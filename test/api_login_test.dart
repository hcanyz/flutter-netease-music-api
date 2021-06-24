import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:netease_music_api/netease_music_api.dart';
import 'package:netease_music_api/src/api/bean.dart';
import 'package:netease_music_api/src/dio_ext.dart';
import 'package:netease_music_api/src/netease_handler.dart';

import 'private_config.dart';
import 'test_helper.dart';

void main() async {
  await NeteaseMusicApi.init(provider: MockPathProvider(), debug: true);

  var api = NeteaseMusicApi();

  //是否测试发验证码
  const bool doSendCaptcha = false;

  test('test_login_protect', () async {
    var result = await api.loginProtect();
    expect(result.code, RET_CODE_OK);
  });

  test('test_anonimous', () async {
    await api.usc.onLogout();

    var result = await api.loginAnonimous();
    expect(result.code, RET_CODE_OK);
    expect(api.usc.anonimousLoginInfo?.userId, isNotNull);
  });

  test('test_login_cellPhone_then_logout', () async {
    await api.usc.onLogout();

    var loginStateChange = [];

    var subscription =
        NeteaseMusicApi().usc.listenLoginState((event, accountInfoWrap) {
      loginStateChange
          .add({'event': event, 'accountInfoWrap': accountInfoWrap});
    });

    var result = await api.loginCellPhone(login_phone, login_phone_password);
    expect(result.code, RET_CODE_OK);

    assert((await loadCookies()).isNotEmpty);

    var result2 = await api.logout();
    expect(result2.code, RET_CODE_OK);

    assert(loginStateChange[0]['event'] == LoginState.Logined);
    assert(loginStateChange[0]['accountInfoWrap'] != null);

    assert(loginStateChange[1]['event'] == LoginState.Logout);
    assert(loginStateChange[1]['accountInfoWrap'] == null);

    subscription.cancel();
  });

  test('test_RET_CODE_NEED_LOGIN_refresh_tokenx', () async {
    var result = await api.loginCellPhone(login_phone, login_phone_password);
    expect(result.code, RET_CODE_OK);

    var oldCookiesHash = await loadCookiesHash();
    const mockNeedLoginCount = 1;
    var setUp = 0;
    Response result2 = await Https.dio.postUri(joinUri('/weapi/subcount'),
        data: {},
        options: joinOptions().copyWith(responseDecoder:
            (List<int> responseBytes, RequestOptions options,
                ResponseBody responseBody) {
          if (setUp++ < mockNeedLoginCount) {
            return jsonEncode({'code': RET_CODE_NEED_LOGIN});
          }
          return utf8.decode(responseBytes, allowMalformed: true);
        }));

    expect(setUp, mockNeedLoginCount + 1);
    expect(oldCookiesHash, isNot(await loadCookiesHash()));
    expect(ServerStatusBean.fromJson(result2.data).code, RET_CODE_OK);
  });

  test('test_RET_CODE_NEED_LOGIN_refresh_token_mutil', () async {
    await api.usc.onLogout();

    var result = await api.loginCellPhone(login_phone, login_phone_password);
    expect(result.code, RET_CODE_OK);

    var oldCookiesHash = await loadCookiesHash();

    var reqFun = () {
      var mocked = false;
      return Https.dio.postUri(joinUri('/weapi/subcount'),
          data: {},
          options: joinOptions().copyWith(responseDecoder:
              (List<int> responseBytes, RequestOptions options,
                  ResponseBody responseBody) {
            if (!mocked) {
              mocked = true;
              return jsonEncode({'code': RET_CODE_NEED_LOGIN});
            }
            return utf8.decode(responseBytes, allowMalformed: true);
          }));
    };

    List<Response> result2 =
        await Future.wait([reqFun(), reqFun(), reqFun(), reqFun()]);

    expect(oldCookiesHash, isNot(await loadCookiesHash()));

    result2.forEach((element) {
      expect(ServerStatusBean.fromJson(element.data).code, RET_CODE_OK);
    });
  });

  test('test_login_email_then_logout', () async {
    await api.usc.onLogout();

    var loginStateChange = [];

    var subscription =
        NeteaseMusicApi().usc.listenLoginState((event, accountInfoWrap) {
      loginStateChange
          .add({'event': event, 'accountInfoWrap': accountInfoWrap});
    });

    var result = await api.loginEmail(login_email, login_email_password);
    expect(result.code, RET_CODE_OK);

    var result2 = await api.logout();
    expect(result2.code, RET_CODE_OK);

    assert(loginStateChange[0]['event'] == LoginState.Logined);
    assert(loginStateChange[0]['accountInfoWrap'] != null);

    assert(loginStateChange[1]['event'] == LoginState.Logout);
    assert(loginStateChange[1]['accountInfoWrap'] == null);

    subscription.cancel();
  });

  test('test_loginQrCode', () async {
    var result = await api.loginQrCodeKey();
    expect(result.code, RET_CODE_OK);

    var uniKey = result.unikey;

    var url = api.loginQrCodeUrl(uniKey);
    expect(url, isNotNull);

    var result2 = await api.loginQrCodeCheck(uniKey);
    expect(result2.message, isNotNull);
  });

  test('test_loginStatus', () async {
    var result = await api.loginStatus();
    expect(result.code, anyOf(RET_CODE_OK, RET_CODE_NEED_LOGIN));
  });

  test('test_loginAccountInfo', () async {
    var result = await api.loginAccountInfo();
    expect(result.code, anyOf(RET_CODE_OK, RET_CODE_NEED_LOGIN));
  });

  test('test_refresh_login', () async {
    var result = await api.loginCellPhone(login_phone, login_phone_password);
    expect(result.code, RET_CODE_OK);

    var result2 = await api.loginRefresh();
    expect(result2.code, RET_CODE_OK);
  });

  test('test_send_captcha', () async {
    if (doSendCaptcha) {
      var result = await api.captchaSend(login_phone);
      expect(
          result.code, anyOf(RET_CODE_OK, RET_CODE_CAPTCHA_VERIFY_FREQUENTLY));
    }
  });

  test('test_verify_captcha', () async {
    var result = await api.captchaVerify(login_phone, '1379');
    expect(result.code, anyOf(RET_CODE_OK, RET_CODE_CAPTCHA_VERIFY_FAIL));
  });

  test('test_check_cellPhone_existence', () async {
    var result = await api.loginCellPhone(login_phone, login_phone_password);
    expect(result.code, RET_CODE_OK);

    var result2 = await api.checkCellPhoneExistence(login_phone);
    expect(result2.code, RET_CODE_OK);
  });

  test('test_init_nickname', () async {
    var result = await api.loginCellPhone(login_phone, login_phone_password);
    expect(result.code, RET_CODE_OK);

    var result2 = await api.initNickname('hcanyz');
    expect(result2.code, anyOf(RET_CODE_OK, RET_CODE_HAS_INIT));
  });
}
