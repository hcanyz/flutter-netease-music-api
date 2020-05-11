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

  test('test dj banner', () async {
    var result = await api.djBanner();
    expect(result.code, RET_CODE_OK);
  });

  test('test user dj list', () async {
    var result = await api.userDjList(defaultUserId);
    expect(result.code, RET_CODE_OK);
  });

  test('test hot dj list', () async {
    var result = await api.hotDjList();
    expect(result.code, RET_CODE_OK);
  });

  test('test user dj programs list', () async {
    var result = await api.userDjProgramsList(
        NeteaseMusicApi?.accountInfo?.account?.id ?? defaultUserId);
    expect(result.code, RET_CODE_OK);
  });

  test('test personalized dj list', () async {
    var result = await api.personalizedDjList();
    expect(result.code, RET_CODE_OK);
  });

  test('test personalized dj program list', () async {
    var result = await api.personalizedDjProgramList();
    expect(result.code, RET_CODE_OK);
  });
}
