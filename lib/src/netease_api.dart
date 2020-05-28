import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:netease_music_api/netease_music_api.dart';
import 'package:netease_music_api/src/api/bean.dart';
import 'package:netease_music_api/src/api/dj/api.dart';
import 'package:netease_music_api/src/api/event/api.dart';
import 'package:netease_music_api/src/api/login/bean.dart';
import 'package:netease_music_api/src/api/search/api.dart';
import 'package:netease_music_api/src/api/uncategorized/api.dart';
import 'package:netease_music_api/src/api/user/api.dart';
import 'package:netease_music_api/src/dio_ext.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api/login/api.dart';
import 'api/play/api.dart';
import 'netease_handler.dart';

class NeteaseMusicApi
    with
        ApiPlay,
        ApiDj,
        ApiLogin,
        ApiUser,
        ApiEvent,
        ApiSearch,
        ApiUncategorized {
  static NeteaseMusicApi _neteaseMusicApi;

  static CookieManager cookieManager;
  static PathProvider pathProvider;

  static Future<bool> init({PathProvider provider, bool debug = false}) async {
    if (provider == null) {
      provider = PathProvider();
    }
    pathProvider = provider;

    await provider.init();

    cookieManager =
        CookieManager(PersistCookieJar(dir: provider.getCookieSavedPath()));

    _initDio(Https.dio, debug, true);

    return true;
  }

  static Dio _initDio(Dio dio, bool debug, bool refreshToken) {
    dio.interceptors.add(cookieManager);

    dio.interceptors.add(InterceptorsWrapper(
        onRequest: neteaseInterceptor,
        onResponse: (Response response) async {
          if (response.data is String) {
            try {
              response.data = jsonDecode(response.data);
            } catch (e) {}
          }
          if (refreshToken && NeteaseMusicApi().usc.isLogined) {
            try {
              var result = ServerStatusBean.fromJson(response.data);
              // 1. token已经更新，请求重试
              // 2. token未更新
              //    刷新token
              //    1. 刷新成功，请求重试
              //    2. 刷新失败，登录态切换
              if (result.code == RET_CODE_NEED_LOGIN) {
                try {
                  var request = response.request;
                  if (request.extra['cookiesHash'] !=
                      loadCookiesHash(loadCookies())) {
                    return dio.request(
                      request.path,
                      options: request,
                    );
                  }
                  dio.lock();
                  var refreshResult = await NeteaseMusicApi()
                      .loginRefresh(dio: _initDio(Dio(), debug, false));
                  dio.unlock();
                  if (refreshResult.code == RET_CODE_OK) {
                    return dio.request(
                      request.path,
                      options: request,
                    );
                  }
                } catch (e) {} finally {
                  dio.unlock();
                }
                NeteaseMusicApi().usc.onLogout();
              }
            } catch (e) {}
          }
          return null;
        }));

    if (debug) {
      dio.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          error: true,
          compact: true,
          maxWidth: 90,
          logPrint: (object) {
            if (object is String) {
              print(object.replaceAll('║', ''));
            }
          }));
    }
    return dio;
  }

  UserLoginStateController usc = UserLoginStateController();

  NeteaseMusicApi._internal();

  factory NeteaseMusicApi() {
    return _neteaseMusicApi ??= NeteaseMusicApi._internal();
  }
}

class UserLoginStateController {
  LoginState _curLoginState;

  StreamController _controller;

  UserLoginStateController() {
    _checkCreateSavePath();
    _readAccountInfo();
    _refreshLoginState(
        loadCookies().isNotEmpty ? LoginState.Logined : LoginState.Logout);
  }

  NeteaseAccountInfoWrap _accountInfo;

  NeteaseAccountInfoWrap get accountInfo {
    return _accountInfo;
  }

  bool get isLogined {
    return _curLoginState == LoginState.Logined;
  }

  StreamSubscription listenerLoginState(
      void onChange(LoginState event, NeteaseAccountInfoWrap accountInfoWrap)) {
    if (_controller == null) {
      _controller = StreamController.broadcast(sync: true);
    }
    return _controller.stream.listen((t) {
      onChange(t, accountInfo);
    });
  }

  void onLogined(NeteaseAccountInfoWrap infoWrap) {
    _accountInfo = infoWrap;
    _refreshLoginState(LoginState.Logined);
    _saveAccountInfo(infoWrap);
  }

  void onLogout() {
    _accountInfo = null;
    deleteAllCookie();
    _refreshLoginState(LoginState.Logout);
    _saveAccountInfo(null);
  }

  void _saveAccountInfo(NeteaseAccountInfoWrap infoWrap) {
    _saveFile().writeAsString(jsonEncode(infoWrap), flush: true);
  }

  void _readAccountInfo() {
    try {
      var accountInfo = _saveFile().readAsStringSync();

      _accountInfo = NeteaseAccountInfoWrap.fromJson(jsonDecode(accountInfo));
    } catch (e) {
      print('login info error');
      onLogout();
    }
  }

  File _saveFile() => File(
      NeteaseMusicApi.pathProvider.getDataSavedPath() + "_accountInfo.json");

  _checkCreateSavePath() {
    var file = _saveFile();
    if (!file.existsSync()) {
      file.createSync(recursive: true);
    }
  }

  void _refreshLoginState(LoginState state) {
    if (_controller != null && _curLoginState != state) {
      _controller.add(state);
    }
    _curLoginState = state;
  }

  void destroy() {
    _controller.close();
  }
}

enum LoginState {
  Logined,
  Logout,
}

class PathProvider {
  var _cookiePath;
  var _dataPath;

  init() async {
    _cookiePath = (await getApplicationSupportDirectory()).absolute.path +
        "/zmusic/.cookies/";
    _dataPath = (await getApplicationSupportDirectory()).absolute.path +
        "/zmusic/.data/";
  }

  String getCookieSavedPath() {
    return _cookiePath;
  }

  String getDataSavedPath() {
    return _dataPath;
  }
}
