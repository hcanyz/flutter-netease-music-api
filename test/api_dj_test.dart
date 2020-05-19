import 'package:flutter_test/flutter_test.dart';
import 'package:netease_music_api/netease_music_api.dart';

import 'MockNeteaseMusicApi.dart';
import 'private_config.dart';

void main() async {
  await NeteaseMusicApi.init(provider: MockCookiePathProvider(), debug: true);

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

  test('test dj radio category', () async {
    var result = await api.djRadioCategory();
    expect(result.code, RET_CODE_OK);
  });

  test('test recommend dj radio category', () async {
    var result = await api.recommendDjRadioCategory();
    expect(result.code, RET_CODE_OK);
  });

  test('test exclude hot dj radio category', () async {
    var result = await api.excludeHotDjRadioCategory();
    expect(result.code, RET_CODE_OK);
  });

  test('test user dj radio list', () async {
    var result = await api.userDjRadioList(defaultUserId);
    expect(result.code, RET_CODE_OK);
  });

  test('test today preferred dj radio list', () async {
    var result = await api.todayPreferredDjRadioList();
    expect(result.code, RET_CODE_OK);
  });

  test('test recommend dj radio list x', () async {
    var result = await api.recommendDjRadioList();
    expect(result.code, RET_CODE_OK);
  });

  test('test recommend dj radio list by category', () async {
    var result = await api.excludeHotDjRadioCategory();
    expect(result.code, RET_CODE_OK);

    if (result.data.isEmpty) {
      return;
    }

    var result2 = await api.recommendDjRadioListByCategory(result.data[0].id);
    expect(result2.code, RET_CODE_OK);
  });

  test('test hot dj radio list', () async {
    var result = await api.hotDjRadioList();
    expect(result.code, RET_CODE_OK);
  });

  test('test hot category dj radio list', () async {
    var result = await api.djRadioCategory();
    expect(result.code, RET_CODE_OK);

    if (result.categories.isEmpty) {
      return;
    }

    var result2 = await api.hotDjRadioListByCategory(result.categories[0].id);
    expect(result2.code, RET_CODE_OK);
  });

  test('test dj radio top list', () async {
    var result = await api.djRadioTopList();
    expect(result.code, RET_CODE_OK);
  });

  test('test pay dj radio top list', () async {
    var result = await api.djRadioPayTopList();
    expect(result.code, RET_CODE_OK);
  });

  test('test pay gift dj radio top list', () async {
    var result = await api.djRadioPayGiftTopList();
    expect(result.code, RET_CODE_OK);
  });

  test('test dj detail', () async {
    var result = await api.djRadioDetail('526230592');
    expect(result.code, RET_CODE_OK);
  });

  test('test dj program list', () async {
    var result = await api.djProgramList('526230592');
    expect(result.code, RET_CODE_OK);
  });

  test('test dj program hours top list', () async {
    var result = await api.djProgramHoursTopList();
    expect(result.code, RET_CODE_OK);
  });

  test('test user dj programs list', () async {
    var result = await api.userDjProgramsList(
        NeteaseMusicApi().usc.accountInfo?.account?.id ?? defaultUserId);
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

  test('test dj program detail', () async {
    var result = await api.djProgramDetail('8368032');
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
