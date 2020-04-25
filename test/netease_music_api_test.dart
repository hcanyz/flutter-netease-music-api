import 'dart:io';
import 'dart:math';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:netease_music_api/netease_music_api.dart';

import 'private_config.dart';

void main() {
  NeteaseMusicApi.debug = true;

  var api = NeteaseMusicApi();

  // PersistCookieJar 会存储cookie，登录完成后可以将doSetUp置为false,
  // TODO 登录接口需要验证本地是否登录只类的场景，不需要每次都去调用
  const bool doSetUp = false;

  const defaultUserId = '3375937';

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
      PersistCookieJar().deleteAll();
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

  // TODO eapi
  test('test check cellPhone existence', () async {
    var result = await api.checkCellPhoneExistence(login_phone);
    expect(result.code, RET_CODE_OK);
  });

  test('test verify logout', () async {
    var result = await api.logout();
    expect(result.code, RET_CODE_OK);

    result = await api.loginStatus();
    expect(result.code, RET_CODE_NEED_LOGIN);
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
    var result = await api.userFollowList(defaultUserId, 0);
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

  test('test user play record list', () async {
    var result = await api.userPlayRecordList(
        NeteaseMusicApi?.accountInfo?.account?.id ?? defaultUserId, false);
    expect(result.code, anyOf(RET_CODE_OK_FOLLOW, RET_CODE_OK));
  });

  test('test user event list', () async {
    var result = await api.eventList(defaultUserId);
    expect(result.code, RET_CODE_OK);
  });

  test('test user forward event', () async {
    var result =
        await api.eventForward(defaultUserId, '12433751183', forwards: '偶尔会发笑');
    expect(result.code, RET_CODE_OK);
  });

  test('test user delete event', () async {
    var result =
        await api.eventForward(defaultUserId, '12433751183', forwards: '偶尔会发笑');
    expect(result.code, RET_CODE_OK);

    var result2 = await api.eventDelete('${result.data.eventId}');
    expect(result2.code, RET_CODE_OK);
  });

  test('test user share resource', () async {
    var result =
        await api.shareResource('52057476', type: 'playlist', msg: '偶尔会发笑');
    expect(result.code, RET_CODE_OK);

    var result2 = await api.eventDelete('${result.event.id}');
    expect(result2.code, RET_CODE_OK);
  });

  test('test user event comment list', () async {
    var result = await api.eventList(defaultUserId);
    expect(result.code, RET_CODE_OK);
    expect(result.events, isNotEmpty);

    var result2 = await api.eventCommentList(result.events[0].info.threadId, 0);
    expect(result2.code, RET_CODE_OK);
  });

  test('test user playlist', () async {
    var result = await api.userPlayList(
        NeteaseMusicApi?.accountInfo?.account?.id ?? defaultUserId, 0);
    expect(result.code, RET_CODE_OK);
    expect(result.playlist, isNotNull);
  });

  test('test user update playlist info', () async {
    var result = await api.userPlayList(
        NeteaseMusicApi?.accountInfo?.account?.id ?? defaultUserId, 0);
    expect(result.playlist, isNotNull);
    expect(result.playlist, isNotEmpty);

    var id = result.playlist
            .firstWhere((element) => element.specialType == 0,
                orElse: () => null)
            ?.id ??
        '';

    if (id.isEmpty) {
      return;
    }

    var result2 = await api.updateUserPlayListInfo(
        id,
        '偶尔会发笑_${Random().nextInt(10)}',
        '偶尔会发笑_${Random().nextInt(10)}',
        ['孤独']);

    expect(result2.code, anyOf(RET_CODE_OK, RET_CODE_ILLEGAL_ARGUMENT));
  });

  test('test user dj list', () async {
    var result = await api.userDjList(
        NeteaseMusicApi?.accountInfo?.account?.id ?? defaultUserId, 0);
    expect(result.code, RET_CODE_OK);
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
