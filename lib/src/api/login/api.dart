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
  /// [countryCode] 国家区号
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
  Future<NeteaseAccountInfoWrap> loginEmail(String phone, String password) {
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
            options: joinOptions())
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
            options: joinOptions())
        .then((Response value) {
      return ServerStatusBean.fromJson(value.data);
    });
  }

  /// 注册账号（也可修改密码）
  /// [password] hex(md5(password))
  /// [captcha] 获取到的验证码
  Future<ServerStatusBean> registerCellPhone(
      String phone, String password, String captcha,
      {String nickname = ''}) {
    return Https.dio
        .postUri(joinUri('/weapi/register/cellphone'),
            data: {
              'phone': phone,
              'password': _encryptPassword(password),
              'captcha': captcha,
              'nickname': nickname
            },
            options: joinOptions())
        .then((Response value) {
      return ServerStatusBean.fromJson(value.data);
    });
  }

  /// 检测手机号码是否已注册
  /// [countryCode] 国家区号
  Future<ServerStatusBean> checkCellPhoneExistence(String phone,
      {String countrycode = ''}) {
    //TODO eapi 请求方式
    //url: '/api/cellphone/existence/check'
    return Https.dio
        .postUri(joinUri('/eapi/cellphone/existence/check'),
            data: {'cellphone': phone, 'countrycode': countrycode},
            options: joinOptions(encryptType: EncryptType.EApi))
        .then((Response value) {
      return ServerStatusBean.fromJson(value.data);
    });
  }

  /// 刚注册的账号(需登录),调用此接口 ,可初始化昵称
  /// [nickname] 必须
  Future<ServerStatusBean> initNickname(String nickname) {
    //TODO eapi 请求方式
    //url: '/api/activate/initProfile'
    return Https.dio
        .postUri(joinUri('/eapi/activate/initProfile'),
            data: {'nickname': nickname},
            options: joinOptions(encryptType: EncryptType.EApi))
        .then((Response value) {
      return ServerStatusBean.fromJson(value.data);
    });
  }

  /// 更换绑定手机(流程:先发送验证码到原手机号码,再发送验证码到新手机号码然后再调用此接口)
  /// [captcha] 获取到的验证码
  /// [oldcaptcha] 获取到的验证码
  /// [ctcode] 国家区号,默认86即中国
  Future<ServerStatusBean> rebindCellPhone(
      String phone, String captcha, String oldcaptcha,
      {String ctcode = '86'}) {
    return Https.dio
        .postUri(joinUri('/api/user/replaceCellphone'),
            data: {
              'phone': phone,
              'captcha': captcha,
              'oldcaptcha': oldcaptcha,
              'ctcode': ctcode
            },
            options: joinOptions())
        .then((Response value) {
      return ServerStatusBean.fromJson(value.data);
    });
  }

  /// 退出登录
  Future<ServerStatusBean> logout() {
    return Https.dio
        .postUri(joinUri('/weapi/logout'), data: {}, options: joinOptions())
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
