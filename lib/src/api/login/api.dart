import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:encrypt/encrypt.dart';
import 'package:netease_music_api/src/dio_ext.dart';
import 'package:netease_music_api/src/netease_handler.dart';
import 'package:pointycastle/digests/md5.dart';

import 'bean.dart';

mixin ApiLogin {
  Future<NeteaseAccountInfoWrap> loginCellPhone(String phone, String password,
      {String countryCode = ''}) {
    var params = {
      'phone': phone,
      'password': _encryptPassword(password),
      'countrycode': countryCode,
      'rememberLogin': true
    };
    return Https.dio
        .postUri(joinUri('/weapi/login/cellphone'),
            data: params,
            options:
                joinOptions(userAgent: UserAgent.Pc, cookies: {'os': 'pc'}))
        .then((Response value) {
      return NeteaseAccountInfoWrap.fromJson(value.data);
    });
  }

  Future<NeteaseAccountInfoWrap> loginEmail(String phone, String password,
      {String countryCode = ''}) {
    var params = {
      'username': phone,
      'password': _encryptPassword(password),
      'rememberLogin': true
    };
    return Https.dio
        .postUri(joinUri('/weapi/login'),
            data: params,
            options:
                joinOptions(userAgent: UserAgent.Pc, cookies: {'os': 'pc'}))
        .then((Response value) {
      return NeteaseAccountInfoWrap.fromJson(value.data);
    });
  }
}

String _encryptPassword(String password) {
  return Encrypted(
          MD5Digest().process(Uint8List.fromList(utf8.encode(password))))
      .base16;
}
