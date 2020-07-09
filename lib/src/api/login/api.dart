import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:encrypt/encrypt.dart';
import 'package:netease_music_api/netease_music_api.dart';
import 'package:netease_music_api/src/api/bean.dart';
import 'package:netease_music_api/src/dio_ext.dart';
import 'package:netease_music_api/src/netease_bean.dart';
import 'package:netease_music_api/src/netease_handler.dart';
import 'package:pointycastle/digests/md5.dart';

import 'bean.dart';

mixin ApiLogin {
  DioMetaData loginCellPhoneDioMetaData(String phone, String password,
      {String countryCode = ''}) {
    var params = {
      'phone': phone,
      'password': _encryptPassword(password),
      'countrycode': countryCode,
      'rememberLogin': true
    };
    return DioMetaData(joinUri('/weapi/login/cellphone'),
        data: params,
        options: joinOptions(userAgent: UserAgent.Pc, cookies: {'os': 'pc'}));
  }

  /// 手机号码登录
  /// [password] hex(md5(password))
  /// [countryCode] 国家区号
  Future<NeteaseAccountInfoWrap> loginCellPhone(String phone, String password,
      {String countryCode = ''}) {
    return Https.dioProxy
        .postUri(loginCellPhoneDioMetaData(phone, password,
            countryCode: countryCode))
        .then((Response value) {
      var info = NeteaseAccountInfoWrap.fromJson(value.data);
      NeteaseMusicApi().usc.onLogined(info);
      return info;
    });
  }

  DioMetaData loginEmailDioMetaData(String phone, String password) {
    var params = {
      'username': phone,
      'password': _encryptPassword(password),
      'rememberLogin': true
    };
    return DioMetaData(joinUri('/weapi/login'),
        data: params,
        options: joinOptions(userAgent: UserAgent.Pc, cookies: {'os': 'pc'}));
  }

  /// 邮箱登录
  /// [password] hex(md5(password))
  Future<NeteaseAccountInfoWrap> loginEmail(String phone, String password) {
    return Https.dioProxy
        .postUri(loginEmailDioMetaData(phone, password))
        .then((Response value) {
      var info = NeteaseAccountInfoWrap.fromJson(value.data);
      NeteaseMusicApi().usc.onLogined(info);
      return info;
    });
  }

  /// 获取当前登录状态
  /// [ServerStatusBean] code [RetCode]
  Future<ServerStatusBean> loginStatus() {
    return Https.dioProxy.get(HOST).then((Response value) {
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

  var _loginRefreshVersion = 0;

  get loginRefreshVersion {
    return _loginRefreshVersion;
  }

  /// 刷新token
  /// !需要登录
  /// [ServerStatusBean] code [RetCode]
  Future<ServerStatusBean> loginRefresh({Dio dio}) {
    if (dio == null) {
      dio = Https.dio;
    }
    return dio
        .postUri(joinUri('/weapi/login/token/refresh'),
            data: {}, options: joinOptions(userAgent: UserAgent.Pc))
        .then((Response value) {
      // 刷新token接口set-cookie并不会返回最新token. 所以需要记录一个版本号，避免多次刷新
      var result = ServerStatusBean.fromJson(value.data);
      if (result.code == RET_CODE_OK) {
        _loginRefreshVersion++;
      }
      return result;
    });
  }

  DioMetaData captchaSendDioMetaData(String phone, {String ctcode = '86'}) {
    var params = {'ctcode': ctcode, 'cellphone': phone};
    return DioMetaData(joinUri('/weapi/sms/captcha/sent'),
        data: params, options: joinOptions());
  }

  /// 发送手机验证码
  /// [ctcode] 国家区号,默认86即中国
  Future<ServerStatusBean> captchaSend(String phone, {String ctcode = '86'}) {
    return Https.dioProxy
        .postUri(captchaSendDioMetaData(phone, ctcode: ctcode))
        .then((Response value) {
      return ServerStatusBean.fromJson(value.data);
    });
  }

  DioMetaData captchaVerifyDioMetaData(String phone, String captcha,
      {String ctcode = '86'}) {
    var params = {'ctcode': ctcode, 'cellphone': phone, 'captcha': captcha};
    return DioMetaData(joinUri('/weapi/sms/captcha/verify'),
        data: params, options: joinOptions());
  }

  /// 检验手机验证码
  /// [ctcode] 国家区号,默认86即中国
  /// [captcha] 获取到的验证码
  Future<ServerStatusBean> captchaVerify(String phone, String captcha,
      {String ctcode = '86'}) {
    return Https.dioProxy
        .postUri(captchaVerifyDioMetaData(phone, captcha, ctcode: ctcode))
        .then((Response value) {
      return ServerStatusBean.fromJson(value.data);
    });
  }

  DioMetaData registerCellPhoneDioMetaData(
      String phone, String password, String captcha,
      {String nickname = ''}) {
    var params = {
      'phone': phone,
      'password': _encryptPassword(password),
      'captcha': captcha,
      'nickname': nickname
    };
    return DioMetaData(joinUri('/weapi/register/cellphone'),
        data: params, options: joinOptions());
  }

  /// 注册账号（也可修改密码）
  /// [password] hex(md5(password))
  /// [captcha] 获取到的验证码
  Future<ServerStatusBean> registerCellPhone(
      String phone, String password, String captcha,
      {String nickname = ''}) {
    return Https.dioProxy
        .postUri(registerCellPhoneDioMetaData(phone, password, captcha,
            nickname: nickname))
        .then((Response value) {
      return ServerStatusBean.fromJson(value.data);
    });
  }

  DioMetaData checkCellPhoneExistenceDioMetaData(String phone,
      {String countrycode = ''}) {
    var params = {'cellphone': phone, 'countrycode': countrycode};
    return DioMetaData(joinUri('/eapi/cellphone/existence/check'),
        data: params,
        options: joinOptions(
            encryptType: EncryptType.EApi,
            eApiUrl: '/api/cellphone/existence/check'));
  }

  /// 检测手机号码是否已注册
  /// [countryCode] 国家区号
  Future<CellPhoneCheckExistenceRet> checkCellPhoneExistence(String phone,
      {String countrycode = ''}) {
    return Https.dioProxy
        .postUri(
            checkCellPhoneExistenceDioMetaData(phone, countrycode: countrycode))
        .then((Response value) {
      return CellPhoneCheckExistenceRet.fromJson(value.data);
    });
  }

  DioMetaData initNicknameDioMetaData(String nickname) {
    var params = {'nickname': nickname};
    return DioMetaData(joinUri('/eapi/activate/initProfile'),
        data: params,
        options: joinOptions(
            encryptType: EncryptType.EApi,
            eApiUrl: '/api/activate/initProfile'));
  }

  /// 刚注册的账号(需登录),调用此接口 ,可初始化昵称
  /// [nickname] 必须
  Future<ServerStatusBean> initNickname(String nickname) {
    return Https.dioProxy
        .postUri(initNicknameDioMetaData(nickname))
        .then((Response value) {
      return ServerStatusBean.fromJson(value.data);
    });
  }

  DioMetaData rebindCellPhoneDioMetaData(
      String phone, String captcha, String oldcaptcha,
      {String ctcode = '86'}) {
    var params = {
      'phone': phone,
      'captcha': captcha,
      'oldcaptcha': oldcaptcha,
      'ctcode': ctcode
    };
    return DioMetaData(joinUri('/api/user/replaceCellphone'),
        data: params, options: joinOptions());
  }

  /// 更换绑定手机(流程:先发送验证码到原手机号码,再发送验证码到新手机号码然后再调用此接口)
  /// [captcha] 获取到的验证码
  /// [oldcaptcha] 获取到的验证码
  /// [ctcode] 国家区号,默认86即中国
  Future<ServerStatusBean> rebindCellPhone(
      String phone, String captcha, String oldcaptcha,
      {String ctcode = '86'}) {
    return Https.dioProxy
        .postUri(rebindCellPhoneDioMetaData(phone, captcha, oldcaptcha,
            ctcode: ctcode))
        .then((Response value) {
      return ServerStatusBean.fromJson(value.data);
    });
  }

  DioMetaData logoutDioMetaData() {
    return DioMetaData(joinUri('/weapi/logout'),
        data: {}, options: joinOptions());
  }

  /// 退出登录
  /// !需要登录
  Future<ServerStatusBean> logout() {
    return Https.dioProxy.postUri(logoutDioMetaData()).then((Response value) {
      NeteaseMusicApi().usc.onLogout();
      return ServerStatusBean.fromJson(value.data);
    });
  }
}

String _encryptPassword(String password) {
  return Encrypted(
          MD5Digest().process(Uint8List.fromList(utf8.encode(password))))
      .base16;
}
