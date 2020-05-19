import 'dart:async';
import 'dart:convert';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:netease_music_api/src/api/dj/api.dart';
import 'package:netease_music_api/src/api/event/api.dart';
import 'package:netease_music_api/src/api/login/bean.dart';
import 'package:netease_music_api/src/api/search/api.dart';
import 'package:netease_music_api/src/api/uncategorized/api.dart';
import 'package:netease_music_api/src/api/user/api.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api/login/api.dart';
import 'api/play/api.dart';
import 'dio_ext.dart';
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
  static bool _debug = false;

  static NeteaseMusicApi _neteaseMusicApi;

  static CookieManager cookieManager;

  static Future<bool> init(
      {CookiePathProvider provider, bool debug = false}) async {
    if (provider == null) {
      provider = CookiePathProvider();
    }

    final path = await provider.getCookieSavedPath();
    cookieManager = CookieManager(PersistCookieJar(dir: path));

    _debug = debug;

    return true;
  }

  UserLoginStateController usc = UserLoginStateController();

  NeteaseMusicApi._internal() {
    Https.dio.interceptors.add(cookieManager);

    Https.dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions option) async {
      neteaseInterceptor(option);
    }, onResponse: (Response response) {
      //Headers.jsonContentType.contains(
      //response.headers.value(HttpHeaders.contentTypeHeader))
      //Response content-type: [text/plain;charset=UTF-8]
      if (response.data is String) {
        try {
          response.data = jsonDecode(response.data);
        } catch (e) {}
      }
    }));
    if (_debug) {
      Https.dio.interceptors.add(PrettyDioLogger(
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
  }

  factory NeteaseMusicApi() {
    if (_neteaseMusicApi == null) {
      _neteaseMusicApi = NeteaseMusicApi._internal();
    }
    return _neteaseMusicApi;
  }
}

class UserLoginStateController {
  StreamController _controller;

  NeteaseAccountInfoWrap _accountInfo;

  NeteaseAccountInfoWrap get accountInfo {
    return _accountInfo;
  }

  StreamSubscription listenerLoginState(
      void onChange(LoginState event, NeteaseAccountInfoWrap accountInfoWrap)) {
    if (_controller == null) {
      _controller = StreamController(sync: true);
    }
    return _controller.stream.listen((t) {
      onChange(t, accountInfo);
    });
  }

  void onLogined(NeteaseAccountInfoWrap infoWrap) {
    _accountInfo = infoWrap;
    if (_controller != null) {
      _controller.add(LoginState.Logined);
    }
  }

  void onLogout() {
    _accountInfo = null;
    (NeteaseMusicApi.cookieManager.cookieJar as PersistCookieJar).deleteAll();
    if (_controller != null) {
      _controller.add(LoginState.Logout);
    }
  }

  void destroy() {
    _controller.close();
  }
}

enum LoginState {
  Logined,
  Logout,
}

class CookiePathProvider {
  Future<String> getCookieSavedPath() async {
    return (await getApplicationSupportDirectory()).absolute.path +
        "/zmusic/cookies";
  }
}
