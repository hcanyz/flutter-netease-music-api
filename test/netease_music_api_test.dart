import 'package:cookie_jar/cookie_jar.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:netease_music_api/netease_music_api.dart';

import 'private_config.dart';

void main() {
  NeteaseMusicApi.debug = true;

  var api = NeteaseMusicApi();

  const bool doSetUp = false;

  //0:没有登录 ，1：手机  2：邮箱
  int logined = 0;
  setUp(() async {
    if (!doSetUp) return;
    try {
      var result = await api.loginCellPhone(login_phone, login_phone_password);
      if (result.code == RET_CODE_OK) {
        logined = 1;
        return;
      }
      result = await api.loginEmail(login_email, login_email_password);
      if (result.code == RET_CODE_OK) {
        logined = 2;
        return;
      }
    } catch (e) {
      //前置条件允许出错
    }
  });

  test('test login cellPhone', () async {
    if (logined != 1) {
      var result = await api.loginCellPhone(login_phone, login_phone_password);
      expect(result.code, RET_CODE_OK);

      logined = 1;
    }
  });

  test('test login email', () async {
    if (logined == 1) {
      (CookieJar() as DefaultCookieJar).deleteAll();
    }
    if (logined != 2) {
      var result = await api.loginEmail(login_email, login_email_password);
      expect(result.code, RET_CODE_OK);

      logined = 2;
    }
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
    var result = await api.captchaSend(login_phone);
    expect(result.code, anyOf(RET_CODE_OK, RET_CODE_CAPTCHA_VERIFY_FREQUENTLY));
  });

  test('test verify captcha', () async {
    var result = await api.captchaVerify(login_phone, '7721');
    expect(result.code, anyOf(RET_CODE_OK, RET_CODE_CAPTCHA_VERIFY_FAIL));
  });

  test('test homeBannerList', () async {
    await api.homeBannerList();
  });

  test('test categoryPlayList', () async {
    var result = await api.categoryPlayList(PLAYLIST_CATEGORY[0]['id'], 0);
    expect(result.code, RET_CODE_OK);
  });

  test('test highqualityPlayList', () async {
    var result = await api.highqualityPlayList(0);
    expect(result.code, RET_CODE_OK);
  });
}
