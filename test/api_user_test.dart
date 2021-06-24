import 'dart:io';
import 'dart:math';

import 'package:collection/src/iterable_extensions.dart';
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

  test('test_user_setting', () async {
    var result = await api.userSetting();
    expect(result.code, RET_CODE_OK);
  });

  test('test_userDetail', () async {
    var result =
        await api.userDetail(api.usc.accountInfo?.account?.id ?? defaultUserId);
    expect(result.code, RET_CODE_OK);
  });

  test('test_userDetail', () async {
    var result = await api
        .userBindings(api.usc.accountInfo?.account?.id ?? defaultUserId);
    expect(result.code, RET_CODE_OK);
  });

  test('test_user_Subcount', () async {
    var result = await api.userSubcount();
    expect(result.code, RET_CODE_OK);
  });

  test('test_user_level', () async {
    var result = await api.userLevel();
    expect(result.code, RET_CODE_OK);
  });

  test('test_user_update_profile', () async {
    var info = api.usc.accountInfo;
    if (info == null) {
      return;
    }
    var birthday = info.profile?.birthday ?? 0;
    var result = await api.userUpdateProfile(
        info.profile?.gender ?? 0,
        (birthday) < 0 ? DateTime.now().millisecondsSinceEpoch : birthday,
        'hcanyz_${Random().nextInt(10)}',
        info.profile?.province ?? 0,
        info.profile?.city ?? 0,
        '偶尔会发笑_${Random().nextInt(10)}');
    expect(result.code, RET_CODE_OK);
  });

  test('test_user_update_profile-avatar', () async {
    var result = await api.userUpdateProfileAvatar('./test/raw/z.png');
    expect(result.code, RET_CODE_OK);
  });

  test('test_user_playlist', () async {
    var result = await api
        .userPlayList(api.usc.accountInfo?.account?.id ?? defaultUserId);
    expect(result.code, RET_CODE_OK);
    expect(result.playlist, isNotNull);
  });

  test('test_user_update_playlist_info', () async {
    var result = await api
        .userPlayList(api.usc.accountInfo?.account?.id ?? defaultUserId);
    expect(result.playlist, isNotNull);
    expect(result.playlist, isNotEmpty);

    var id = result.playlist
            ?.firstWhereOrNull((element) => element.specialType == 0)
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

  test('test_user_follow_list', () async {
    var result = await api.userFollowList(defaultUserId);
    expect(result.code, RET_CODE_OK);
  });

  test('test_user_sign', () async {
    var result = await api.userSign();
    expect(result.code, anyOf(RET_CODE_OK, RET_CODE_NO_PERMISSION));
  });

  test('test_user_followed_list', () async {
    var result = await api.userFollowedList(defaultUserId);
    expect(result.code, RET_CODE_OK);
  });

  test('test_user_follow_or_delFollow', () async {
    var result = await api.userFollow(defaultUserId, false);
    expect(result.code, anyOf(RET_CODE_OK_FOLLOW, RET_CODE_OK));

    sleep(Duration(seconds: 2));

    var result2 = await api.userFollow(defaultUserId, true);
    expect(result2.code, anyOf(RET_CODE_OK_FOLLOW, RET_CODE_OK));
  });

  test('test_user_artist_sub_or_unSub', () async {
    var result = await api.artistSub(defaultArtistId, false);
    expect(result.code, anyOf(RET_CODE_OK_FOLLOW, RET_CODE_OK));

    sleep(Duration(seconds: 2));

    var result2 = await api.artistSub(defaultArtistId, true);
    expect(result2.code, anyOf(RET_CODE_OK_FOLLOW, RET_CODE_OK));
  });

  test('test_user_artist_sub_list', () async {
    var result = await api.artistSubList();
    expect(result.code, RET_CODE_OK);
  });

  test('test_user_dj_radio_sub_or_unSub', () async {
    var result = await api.djRadioSub('526230592', true);
    expect(result.code, anyOf(RET_CODE_ILLEGAL, RET_CODE_OK));

    sleep(Duration(seconds: 2));

    var result2 = await api.djRadioSub('526230592', false);
    expect(result2.code, anyOf(RET_CODE_ILLEGAL, RET_CODE_OK));
  });

  test('test_user_dj_radio_sub_list', () async {
    var result = await api.djRadioSubList();
    expect(result.code, anyOf(RET_CODE_ILLEGAL, RET_CODE_OK));
  });

  test('test_user_video_sub_or_unSub', () async {
    var result = await api.videoSub('84107D4616B72B929C8AEB7D1E6CC904', false);
    expect(result.code, anyOf(RET_CODE_ILLEGAL, RET_CODE_OK));

    sleep(Duration(seconds: 2));

    var result2 = await api.videoSub('84107D4616B72B929C8AEB7D1E6CC904', true);
    expect(result2.code, anyOf(RET_CODE_ILLEGAL, RET_CODE_OK));
  });

  test('test_user_mv_sub_or_unSub', () async {
    var result = await api.mvSub('5300126', false);
    expect(result.code, anyOf(RET_CODE_ILLEGAL, RET_CODE_OK));

    sleep(Duration(seconds: 2));

    var result2 = await api.mvSub('5300126', true);
    expect(result2.code, anyOf(RET_CODE_ILLEGAL, RET_CODE_OK));
  });

  test('test_user_mv_sub_list', () async {
    var result = await api.mvSubList();
    expect(result.code, RET_CODE_OK);
  });

  test('test_user_play_record_list', () async {
    var result = await api.userPlayRecordList(
        NeteaseMusicApi().usc.accountInfo?.account?.id ?? defaultUserId, false);
    expect(result.code, RET_CODE_OK);
  });

  test('test_user_album_sub_or_unSub', () async {
    var result = await api.albumSub('489928', false);
    expect(result.code, anyOf(RET_CODE_REQUEST_NOT_FOUNT, RET_CODE_OK));

    sleep(Duration(seconds: 2));

    var result2 = await api.albumSub('489928', true);
    expect(result2.code, RET_CODE_OK);
  });

  test('test_album_sub_list', () async {
    var result = await api.albumSubList();
    expect(result.code, RET_CODE_OK);
  });

  test('test_user_playlist_sub_or_unSub', () async {
    var result = await api.playlistSub('2819660572', false);
    expect(result.code, anyOf(RET_CODE_ILLEGAL, RET_CODE_OK));

    sleep(Duration(seconds: 2));

    var result2 = await api.playlistSub('2819660572', true);
    expect(result2.code, anyOf(RET_CODE_ILLEGAL, RET_CODE_OK));
  });

  test('test_playlist_create_or_delete', () async {
    var result = await api.playlistCreate('老白涮肉铺', true);
    expect(result.code, RET_CODE_OK);

    sleep(Duration(seconds: 2));

    var result2 = await api.playlistDelete([result.id]);
    expect(result2.code, RET_CODE_OK);
  });

  test('test_playlist_update_order', () async {
    var result = await api.playlistUpdateOrder(['2819660572']);
    expect(result.code, RET_CODE_OK);
  });

  test('test_user_playlist_update_cover_manipulate_tracks', () async {
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

  test('test_ordering_digital_album', () async {
    var result = await api.orderingDigitalAlbum('10888');
    expect(result.code, anyOf(RET_CODE_OK, RET_CODE_ILLEGAL));
  });

  test('test_purchased_digital_album', () async {
    var result = await api.purchasedDigitalAlbum();
    expect(result.code, anyOf(RET_CODE_OK, RET_CODE_ILLEGAL));
  });
}
