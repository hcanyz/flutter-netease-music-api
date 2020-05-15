import 'package:cookie_jar/cookie_jar.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:netease_music_api/netease_music_api.dart';

import 'MockNeteaseMusicApi.dart';
import 'private_config.dart';

void main() async {
  await NeteaseMusicApi.init(provider: MockCookiePathProvider(), debug: true);

  var api = NeteaseMusicApi();

  //是否测试发验证码
  const bool doSendCaptcha = false;

  test('test login cellPhone', () async {
    var result = await api.loginCellPhone(login_phone, login_phone_password);
    expect(result.code, RET_CODE_OK);
  });

  test('test login email', () async {
    (NeteaseMusicApi.cookieManager.cookieJar as PersistCookieJar).deleteAll();

    var result = await api.loginEmail(login_email, login_email_password);
    expect(result.code, RET_CODE_OK);
  });

  test('test loginStatus', () async {
    var result = await api.loginStatus();
    expect(result.code, anyOf(RET_CODE_OK, RET_CODE_NEED_LOGIN));
  });

  test('test refresh login', () async {
    var result = await api.loginRefresh();
    expect(result.code, RET_CODE_OK);
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
    var result = await api.checkCellPhoneExistence(login_phone);
    expect(result.code, RET_CODE_OK);
  });

  test('test check cellPhone existence', () async {
    var result = await api.initNickname('hcanyz');
    expect(result.code, anyOf(RET_CODE_OK, RET_CODE_HAS_INIT));
  });

  test('test verify logout', () async {
    var result = await api.logout();
    expect(result.code, RET_CODE_OK);

    result = await api.loginStatus();
    expect(result.code, RET_CODE_NEED_LOGIN);
  });
}
