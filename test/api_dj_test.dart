import 'package:flutter_test/flutter_test.dart';
import 'package:netease_music_api/netease_music_api.dart';

import 'private_config.dart';

void main() {
  NeteaseMusicApi.debug = true;

  var api = NeteaseMusicApi();

  // PersistCookieJar 会存储cookie，登录完成后可以将doSetUp置为false,
  // TODO 登录接口需要验证本地是否登录只类的场景，不需要每次都去调用
  const bool doSetUp = true;

  const defaultUserId = '3375937';

  setUp(() async {
    if (!doSetUp) return;
    try {
      var result = await api.loginCellPhone(login_phone, login_phone_password);
      if (result.code == RET_CODE_OK) {
        return;
      }
      result = await api.loginEmail(login_email, login_email_password);
      if (result.code == RET_CODE_OK) {
        return;
      }
    } catch (e) {
      //前置条件允许出错
    }
  });

  test('test dj radio banner', () async {
    var result = await api.djRadioBanner();
    expect(result.code, RET_CODE_OK);
  });

  test('test user dj radio list', () async {
    var result = await api.userDjRadioList(defaultUserId);
    expect(result.code, RET_CODE_OK);
  });

  test('test hot dj tadio list', () async {
    var result = await api.hotDjRadioList();
    expect(result.code, RET_CODE_OK);
  });

  test('test dj radio top list', () async {
    var result = await api.djRadioTopList();
    expect(result.code, RET_CODE_OK);
  });

  test('test pay dj radio top list', () async {
    var result = await api.djRadioPayTopList();
    expect(result.code, RET_CODE_OK);
  });

  test('test dj program hours top list', () async {
    var result = await api.djProgramHoursTopList();
    expect(result.code, RET_CODE_OK);
  });

  test('test user dj programs list', () async {
    var result = await api.userDjProgramsList(
        NeteaseMusicApi?.accountInfo?.account?.id ?? defaultUserId);
    expect(result.code, RET_CODE_OK);
  });

  test('test dj program top list', () async {
    var result = await api.djProgramsTopList();
    expect(result.code, RET_CODE_OK);
  });

  test('test personalized dj program list', () async {
    var result = await api.personalizedProgramDjList();
    expect(result.code, RET_CODE_OK);
  });

  test('test personalized dj program list', () async {
    var result = await api.recommendDjProgramList();
    expect(result.code, RET_CODE_OK);
  });

  test('test dj hours top list', () async {
    var result = await api.djHoursTopList();
    expect(result.code, RET_CODE_OK);
  });

  test('test dj newcomer top list', () async {
    var result = await api.djNewcomerTopList();
    expect(result.code, RET_CODE_OK);
  });

  test('test dj popular top list', () async {
    var result = await api.djPopularTopList();
    expect(result.code, RET_CODE_OK);
  });
}
