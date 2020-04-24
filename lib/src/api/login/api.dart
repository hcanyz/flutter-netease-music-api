import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:encrypt/encrypt.dart';
import 'package:netease_music_api/src/api/bean.dart';
import 'package:netease_music_api/src/dio_ext.dart';
import 'package:netease_music_api/src/netease_bean.dart';
import 'package:netease_music_api/src/netease_handler.dart';
import 'package:pointycastle/digests/md5.dart';

import 'bean.dart';

mixin ApiLogin {
  /// 手机号码登录
  /// [password] hex(md5(password))
  /// countryCode 国家码 TODO 整理取值范围
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

  /// 邮箱登录
  /// [password] hex(md5(password))
  /// countryCode 国家码 TODO 整理取值范围
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

  /// 获取当前登录状态
  /// [ServerStatusBean] code [RetCode]
  Future<ServerStatusBean> loginStatus() {
    return Https.dio.get(HOST).then((Response value) {
      var s = NeteaseAccountInfoWrap();
      s.code = RET_CODE_NEED_LOGIN;
      try {
        String body = value.data;
        var profile = RegExp(r'GUser\s*=\s*([^;]+);').firstMatch(body).group(1);
        var bindings =
            RegExp(r'GBinds\s*=\s*([^;]+);').firstMatch(body).group(1);
        if (profile != null && bindings != null) {
          s.code = RET_CODE_OK;
        }
      } catch (e) {}
      return s;
    });
  }

  /// 刷新token
  /// [ServerStatusBean] code [RetCode]
  Future<ServerStatusBean> loginRefresh() {
    return Https.dio
        .postUri(joinUri('/weapi/login/token/refresh'),
            data: {}, options: joinOptions(userAgent: UserAgent.Pc))
        .then((Response value) {
      return ServerStatusBean.fromJson(value.data);
    });
  }

  /// 发送手机验证码
  /// [ctcode] 国家区号,默认86即中国
  Future<ServerStatusBean> captchaSend(String phone, {String ctcode = '86'}) {
    return Https.dio
        .postUri(joinUri('/weapi/sms/captcha/sent'),
            data: {'ctcode': ctcode, 'cellphone': phone},
            options: joinOptions(userAgent: UserAgent.Pc))
        .then((Response value) {
      return ServerStatusBean.fromJson(value.data);
    });
  }

  /// 检验手机验证码
  /// [ctcode] 国家区号,默认86即中国
  /// [captcha] 获取到的验证码
  Future<ServerStatusBean> captchaVerify(String phone, String captcha,
      {String ctcode = '86'}) {
    return Https.dio
        .postUri(joinUri('/weapi/sms/captcha/verify'),
            data: {'ctcode': ctcode, 'cellphone': phone, 'captcha': captcha},
            options: joinOptions(userAgent: UserAgent.Pc))
        .then((Response value) {
      return ServerStatusBean.fromJson(value.data);
    });
  }
}

String _encryptPassword(String password) {
  return Encrypted(
          MD5Digest().process(Uint8List.fromList(utf8.encode(password))))
      .base16;
}
