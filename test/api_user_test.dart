import 'dart:io';
import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:netease_music_api/netease_music_api.dart';

import 'test_helper.dart';

void main() async {
  await NeteaseMusicApi.init(provider: MockPathProvider(), debug: true);

  var api = NeteaseMusicApi();

  const defaultUserId = '3375937';
  // ~
  const defaultArtistId = '5770';

  // api_user 都需要登录
  setUp(() async {
    await needLogin(api);
  });

  test('test user setting', () async {
    var result = await api.userSetting();
    expect(result.code, RET_CODE_OK);
  });

  test('test userDetail', () async {
    var result = await api
        .userDetail(api.usc?.accountInfo?.account?.id ?? defaultUserId);
    expect(result.code, RET_CODE_OK);
  });

  test('test user Subcount', () async {
    var result = await api.userSubcount();
    expect(result.code, RET_CODE_OK);
  });

  test('test user update profile', () async {
    var info = api.usc.accountInfo;
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

  test('test user update profile-avatar', () async {
    var result = await api.userUpdateProfileAvatar('./test/raw/z.png');
    expect(result.code, RET_CODE_OK);
  });

  test('test user playlist', () async {
    var result = await api
        .userPlayList(api.usc?.accountInfo?.account?.id ?? defaultUserId);
    expect(result.code, RET_CODE_OK);
    expect(result.playlist, isNotNull);
  });

  test('test user update playlist info', () async {
    var result = await api
        .userPlayList(api.usc?.accountInfo?.account?.id ?? defaultUserId);
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

    expect(result2.code, anyOf(RET_CODE_OK, RET_CODE_ILLEGAL));

    var result3 =
        await api.updateUserPlayListName(id, '偶尔会发笑_${Random().nextInt(10)}');
    expect(result3.code, RET_CODE_OK);

    result3 =
        await api.updateUserPlayListDesc(id, '偶尔会发笑_${Random().nextInt(10)}');
    expect(result3.code, RET_CODE_OK);

    result3 = await api.updateUserPlayListTags(id, ['孤独']);
    expect(result3.code, RET_CODE_OK);
  });

  test('test user follow list', () async {
    var result = await api.userFollowList(defaultUserId);
    expect(result.code, RET_CODE_OK);
  });

  test('test user sign', () async {
    var result = await api.userSign();
    expect(result.code, anyOf(RET_CODE_OK, RET_CODE_NO_PERMISSION));
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

  test('test user artist sub or unSub', () async {
    var result = await api.artistSub(defaultArtistId, false);
    expect(result.code, anyOf(RET_CODE_OK_FOLLOW, RET_CODE_OK));

    sleep(Duration(seconds: 2));

    var result2 = await api.artistSub(defaultArtistId, true);
    expect(result2.code, anyOf(RET_CODE_OK_FOLLOW, RET_CODE_OK));
  });

  test('test user artist sub list', () async {
    var result = await api.artistSubList();
    expect(result.code, RET_CODE_OK);
  });

  test('test user dj radio sub or unSub', () async {
    var result = await api.djRadioSub('526230592', true);
    expect(result.code, anyOf(RET_CODE_ILLEGAL, RET_CODE_OK));

    sleep(Duration(seconds: 2));

    var result2 = await api.djRadioSub('526230592', false);
    expect(result2.code, anyOf(RET_CODE_ILLEGAL, RET_CODE_OK));
  });

  test('test user dj radio sub list', () async {
    var result = await api.djRadioSubList();
    expect(result.code, anyOf(RET_CODE_ILLEGAL, RET_CODE_OK));
  });

  test('test user video sub or unSub', () async {
    var result = await api.videoSub('84107D4616B72B929C8AEB7D1E6CC904', false);
    expect(result.code, anyOf(RET_CODE_ILLEGAL, RET_CODE_OK));

    sleep(Duration(seconds: 2));

    var result2 = await api.videoSub('84107D4616B72B929C8AEB7D1E6CC904', true);
    expect(result2.code, anyOf(RET_CODE_ILLEGAL, RET_CODE_OK));
  });

  test('test user mv sub or unSub', () async {
    var result = await api.mvSub('5300126', false);
    expect(result.code, anyOf(RET_CODE_ILLEGAL, RET_CODE_OK));

    sleep(Duration(seconds: 2));

    var result2 = await api.mvSub('5300126', true);
    expect(result2.code, anyOf(RET_CODE_ILLEGAL, RET_CODE_OK));
  });

  test('test user mv sub list', () async {
    var result = await api.mvSubList();
    expect(result.code, RET_CODE_OK);
  });

  test('test user play record list', () async {
    var result = await api.userPlayRecordList(
        NeteaseMusicApi().usc?.accountInfo?.account?.id ?? defaultUserId,
        false);
    expect(result.code, RET_CODE_OK);
  });

  test('test user album sub or unSub', () async {
    var result = await api.albumSub('489928', false);
    expect(result.code, anyOf(RET_CODE_REQUEST_NOT_FOUNT, RET_CODE_OK));

    sleep(Duration(seconds: 2));

    var result2 = await api.albumSub('489928', true);
    expect(result2.code, RET_CODE_OK);
  });

  test('test album sub list', () async {
    var result = await api.albumSubList();
    expect(result.code, RET_CODE_OK);
  });

  test('test user playlist sub or unSub', () async {
    var result = await api.playlistSub('2819660572', false);
    expect(result.code, anyOf(RET_CODE_ILLEGAL, RET_CODE_OK));

    sleep(Duration(seconds: 2));

    var result2 = await api.playlistSub('2819660572', true);
    expect(result2.code, anyOf(RET_CODE_ILLEGAL, RET_CODE_OK));
  });

  test('test playlist create or delete', () async {
    var result = await api.playlistCreate('老白涮肉铺', true);
    expect(result.code, RET_CODE_OK);

    sleep(Duration(seconds: 2));

    var result2 = await api.playlistDelete([result.id]);
    expect(result2.code, RET_CODE_OK);
  });

  test('test playlist update order', () async {
    var result = await api.playlistUpdateOrder(['2819660572']);
    expect(result.code, RET_CODE_OK);
  });

  test('test user playlist update cover manipulate tracks', () async {
    var result = await api.playlistCreate('老白涮肉铺', true);
    expect(result.code, RET_CODE_OK);

    var result2 = await api.playlistManipulateTracks(result.id, '167975', true);
    expect(result2.code, anyOf(RET_CODE_UNPAID, RET_CODE_OK));

    var result3 =
        await api.playlistManipulateTracks(result.id, '167975', false);
    expect(result3.code, RET_CODE_OK);

    var result4 = await api.playlistUpdateCover(result.id, './test/raw/z.png');
    expect(result4.code, RET_CODE_OK);

    sleep(Duration(seconds: 2));

    var result5 = await api.playlistDelete([result.id]);
    expect(result5.code, RET_CODE_OK);
  });

  test('test ordering digital album', () async {
    var result = await api.orderingDigitalAlbum('10888');
    expect(result.code, anyOf(RET_CODE_OK, RET_CODE_ILLEGAL));
  });

  test('test purchased digital album', () async {
    var result = await api.purchasedDigitalAlbum();
    expect(result.code, anyOf(RET_CODE_OK, RET_CODE_ILLEGAL));
  });
}
