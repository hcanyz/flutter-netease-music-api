import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:netease_music_api/netease_music_api.dart';

import 'private_config.dart';

void main() {
  NeteaseMusicApi.debug = true;

  var api = NeteaseMusicApi();

  test('test login cellPhone', () async {
    var result = await api.loginCellPhone(login_phone, login_phone_password);
    expect(result.code, RET_CODE_OK);
  });

  test('test login email', () async {
    var result = await api.loginEmail(login_email, login_email_password);
    expect(result.code, RET_CODE_OK);
  });

  test('test loginStatus', () async {
    var resultLogin = await api.loginEmail(login_email, login_email_password);
    expect(resultLogin.code, RET_CODE_OK);

    var result = await api.loginStatus();
    expect(result.code, RET_CODE_OK);
  });

  test('test refresh login', () async {
    var resultLogin = await api.loginEmail(login_email, login_email_password);
    expect(resultLogin.code, RET_CODE_OK);

    sleep(Duration(seconds: 1));

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
