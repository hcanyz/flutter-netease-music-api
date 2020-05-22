import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:netease_music_api/netease_music_api.dart';
import 'package:netease_music_api/src/api/bean.dart';
import 'package:netease_music_api/src/dio_ext.dart';
import 'package:netease_music_api/src/netease_handler.dart';

import 'MockNeteaseMusicApi.dart';
import 'private_config.dart';

void main() async {
  await NeteaseMusicApi.init(provider: MockCookiePathProvider(), debug: true);

  var api = NeteaseMusicApi();

  //是否测试发验证码
  const bool doSendCaptcha = false;

  test('test login cellPhone then logout', () async {
    deleteAllCookie();

    var loginStateChange = [];

    var subscription =
        NeteaseMusicApi().usc.listenerLoginState((event, accountInfoWrap) {
      loginStateChange
          .add({'event': event, 'accountInfoWrap': accountInfoWrap});
    });

    var result = await api.loginCellPhone(login_phone, login_phone_password);
    expect(result.code, RET_CODE_OK);

    assert(loadCookies()?.isNotEmpty ?? false);

    var result2 = await api.logout();
    expect(result2.code, RET_CODE_OK);

    assert(loginStateChange[0]['event'] == LoginState.Logined);
    assert(loginStateChange[0]['accountInfoWrap'] != null);

    assert(loginStateChange[1]['event'] == LoginState.Logout);
    assert(loginStateChange[1]['accountInfoWrap'] == null);

    subscription.cancel();
  });

  test('test RET_CODE_NEED_LOGIN refresh token x', () async {
    var result = await api.loginCellPhone(login_phone, login_phone_password);
    expect(result.code, RET_CODE_OK);

    var oldCookiesHash = loadCookiesHash(loadCookies());
    const mockNeedLoginCount = 1;
    var setUp = 0;
    Response result2 = await Https.dio.postUri(joinUri('/weapi/subcount'),
        data: {},
        options: joinOptions().merge(responseDecoder: (List<int> responseBytes,
            RequestOptions options, ResponseBody responseBody) {
          if (setUp++ < mockNeedLoginCount) {
            return jsonEncode({'code': RET_CODE_NEED_LOGIN});
          }
          return utf8.decode(responseBytes, allowMalformed: true);
        }));

    expect(setUp, mockNeedLoginCount + 1);
    expect(oldCookiesHash, isNot(loadCookiesHash(loadCookies())));
    expect(ServerStatusBean.fromJson(result2.data).code, RET_CODE_OK);
  });

  test('test RET_CODE_NEED_LOGIN refresh token mutil', () async {
    var result = await api.loginCellPhone(login_phone, login_phone_password);
    expect(result.code, RET_CODE_OK);

    var oldCookiesHash = loadCookiesHash(loadCookies());

    var reqFun = () {
      var mocked = false;
      return Https.dio.postUri(joinUri('/weapi/subcount'),
          data: {},
          options: joinOptions().merge(responseDecoder:
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

    expect(oldCookiesHash, isNot(loadCookiesHash(loadCookies())));

    result2.forEach((element) {
      expect(ServerStatusBean.fromJson(element.data).code, RET_CODE_OK);
    });
  });

  test('test login email then logout', () async {
    deleteAllCookie();

    var loginStateChange = [];

    var subscription =
        NeteaseMusicApi().usc.listenerLoginState((event, accountInfoWrap) {
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

  test('test loginStatus', () async {
    var result = await api.loginStatus();
    expect(result.code, anyOf(RET_CODE_OK, RET_CODE_NEED_LOGIN));
  });

  test('test refresh login', () async {
    var result = await api.loginCellPhone(login_phone, login_phone_password);
    expect(result.code, RET_CODE_OK);

    var result2 = await api.loginRefresh();
    expect(result2.code, RET_CODE_OK);
  });

  test('test send captcha', () async {
    if (doSendCaptcha) {
      var result = await api.captchaSend(login_phone);
      expect(
          result.code, anyOf(RET_CODE_OK, RET_CODE_CAPTCHA_VERIFY_FREQUENTLY));
    }
  });

  test('test verify captcha', () async {
    var result = await api.captchaVerify(login_phone, '7721');
    expect(result.code, anyOf(RET_CODE_OK, RET_CODE_CAPTCHA_VERIFY_FAIL));
  });

  test('test check cellPhone existence', () async {
    var result = await api.loginCellPhone(login_phone, login_phone_password);
    expect(result.code, RET_CODE_OK);

    var result2 = await api.checkCellPhoneExistence(login_phone);
    expect(result2.code, RET_CODE_OK);
  });

  test('test init nickname', () async {
    var result = await api.loginCellPhone(login_phone, login_phone_password);
    expect(result.code, RET_CODE_OK);

    var result2 = await api.initNickname('hcanyz');
    expect(result2.code, anyOf(RET_CODE_OK, RET_CODE_HAS_INIT));
  });
}
