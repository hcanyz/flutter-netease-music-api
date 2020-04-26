import 'dart:io';
import 'dart:math';

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

  // ~
  const defaultArtistId = '5770';

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

  test('test userDetail', () async {
    var result = await api
        .userDetail(NeteaseMusicApi?.accountInfo?.account?.id ?? defaultUserId);
    expect(result.code, RET_CODE_OK);
  });

  test('test user Subcount', () async {
    var result = await api.userSubcount();
    expect(result.code, RET_CODE_OK);
  });

  test('test user update profile', () async {
    var info = NeteaseMusicApi.accountInfo;
    if (info == null) {
      return;
    }
    var result = await api.userUpdateProfile(
        info.profile.gender,
        info.profile.birthday < 0
            ? DateTime.now().millisecondsSinceEpoch
            : info.profile.birthday,
        'hcanyz_${Random().nextInt(10)}',
        info.profile.province,
        info.profile.city,
        '偶尔会发笑_${Random().nextInt(10)}');
    expect(result.code, RET_CODE_OK);
  });

  test('test user follow list', () async {
    var result = await api.userFollowList(defaultUserId);
    expect(result.code, RET_CODE_OK);
  });

  test('test user followed list', () async {
    var result = await api.userFollowedList(defaultUserId);
    expect(result.code, RET_CODE_OK);
  });

  test('test user follow or delFollow', () async {
    var result = await api.userFollow(defaultUserId, false);
    expect(result.code, anyOf(RET_CODE_OK_FOLLOW, RET_CODE_OK));

    sleep(Duration(seconds: 2));

    var result2 = await api.userFollow(defaultUserId, true);
    expect(result2.code, anyOf(RET_CODE_OK_FOLLOW, RET_CODE_OK));
  });

  test('test user artist Sub or unSub', () async {
    var result = await api.artistSub(defaultArtistId, false);
    expect(result.code, anyOf(RET_CODE_OK_FOLLOW, RET_CODE_OK));

    sleep(Duration(seconds: 2));

    var result2 = await api.artistSub(defaultArtistId, true);
    expect(result2.code, anyOf(RET_CODE_OK_FOLLOW, RET_CODE_OK));
  });

  test('test user play record list', () async {
    var result = await api.userPlayRecordList(
        NeteaseMusicApi?.accountInfo?.account?.id ?? defaultUserId, false);
    expect(result.code, RET_CODE_OK);
  });
}
