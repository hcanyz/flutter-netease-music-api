import 'dart:convert';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:netease_music_api/netease_music_api.dart';
import 'package:netease_music_api/src/api/dj/api.dart';
import 'package:netease_music_api/src/api/event/api.dart';
import 'package:netease_music_api/src/api/user/api.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api/list/api.dart';
import 'api/login/api.dart';
import 'dio_ext.dart';
import 'netease_handler.dart';

class NeteaseMusicApi with ApiPlayList, ApiDjList, ApiLogin, ApiUser, ApiEvent {
  static bool _hasInit = false;
  static bool debug = false;

  //FIXME 先简单这么做，后面设计一下登录数据使用流程（使用、更新）
  static NeteaseAccountInfoWrap _accountInfo;

  static NeteaseAccountInfoWrap get accountInfo {
    return _accountInfo;
  }

  static set accountInfo(NeteaseAccountInfoWrap infoWrap) {
    _accountInfo = infoWrap;
  }

  NeteaseMusicApi._internal() {
    if (_hasInit) {
      return;
    }
    _hasInit = true;
    Https.dio.interceptors.add(CookieManager(PersistCookieJar()));
    Https.dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions option) async {
      neteaseInterceptor(option);
    }, onResponse: (Response response) {
      //Headers.jsonContentType.contains(
      //response.headers.value(HttpHeaders.contentTypeHeader))
      if (response.data is String) {
        //Response content-type: [text/plain;charset=UTF-8]
        try {
          response.data = jsonDecode(response.data);
        } catch (e) {}
      }
    }));
    if (debug) {
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
    return NeteaseMusicApi._internal();
  }
}
