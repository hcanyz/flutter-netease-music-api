import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:netease_music_api/netease_music_api.dart';

import 'test_helper.dart';

void main() async {
  await NeteaseMusicApi.init(provider: MockPathProvider(), debug: true);

  var api = NeteaseMusicApi();

  const defaultUserId = '3375937';
  // ~
  const defaultArtistId = '5770';

  setUp(() async {
    await needLogin(api);
  });

  test('test_user_playlist_subscribers', () async {
    var result = await api.playlistSubscribers('2819660572');
    expect(result.code, RET_CODE_OK);
  });

  test('test_playlist_catalogue', () async {
    var result = await api.playlistCatalogue();
    expect(result.code, RET_CODE_OK);
  });

  test('test_playlist_hot_tags', () async {
    var result = await api.playlistHotTags();
    expect(result.code, RET_CODE_OK);
  });

  test('test_highquality_playlist_hot_tags', () async {
    var result = await api.highqualityPlaylistHotTags();
    expect(result.code, RET_CODE_OK);
  });

  test('test_highquality_playlist', () async {
    var result = await api.highqualityPlayList();
    expect(result.code, RET_CODE_OK);
  });

  test('test_related_playlist', () async {
    var result = await api.relatedPlayList('167975');
    expect(result.code, RET_CODE_OK);
  });

  test('test_personalized_playlist', () async {
    var result = await api.personalizedPlaylist();
    expect(result.code, RET_CODE_OK);
  });

  test('test_recommend_everyday_playlist', () async {
    var result = await api.recommendPlaylist();
    expect(result.code, RET_CODE_OK);
  });

  test('test_playmode_intelligence_list', () async {
    var result = await api.playmodeIntelligenceList('33894312', '24381616');
    expect(result.code, RET_CODE_OK);
  });

  test('test_playlist_simi', () async {
    var result = await api.playListSimiList('4875306');
    expect(result.code, RET_CODE_OK);
  });

  test('test_category_playlist', () async {
    var result = await api.playListDetail(PLAYLIST_CATEGORY[0]['id']);
    expect(result.code, RET_CODE_OK);
  });

  test('test_category_song_list', () async {
    var result = await api.categorySongList();
    expect(result.code, RET_CODE_OK);
  });

  test('test_recommend_song_list', () async {
    var result = await api.recommendSongList();
    expect(result.code, RET_CODE_OK);
  });

  test('test_recommend_song_list_history_detail', () async {
    var result = await api.recommendSongListHistory();
    expect(result.code, RET_CODE_OK);

    if (result.data.dates.isEmpty) {
      return;
    }

    var result2 =
        await api.recommendSongListHistoryDetail(date: result.data.dates[0]);
    expect(result2.code, RET_CODE_OK);
  });

  test('test_user_radio', () async {
    var result = await api.userRadio();
    expect(result.code, RET_CODE_OK);
  });

  test('test_user_radio_trash', () async {
    var result = await api.userRadio();
    expect(result.code, RET_CODE_OK);

    if (result.data.isEmpty) {
      return;
    }

    var result2 = await api.userRadioTrash(result.data[0].id);
    expect(result2.code, RET_CODE_OK);
  });

  test('test_personalized_song_list', () async {
    var result = await api.personalizedSongList();
    expect(result.code, RET_CODE_OK);
  });

  test('test_new_song_list', () async {
    var result = await api.newSongList();
    expect(result.code, RET_CODE_OK);
  });

  test('test_user_song_simi', () async {
    var result = await api.userSongSimiList('167975');
    expect(result.code, RET_CODE_OK);
  });

  test('test_song_simi', () async {
    var result = await api.songSimiList('167975');
    expect(result.code, RET_CODE_OK);
  });

  test('test_song_like_list', () async {
    var result = await api.likeSongList(
        NeteaseMusicApi().usc?.accountInfo?.account?.id ?? defaultUserId);
    expect(result.code, RET_CODE_OK);
  });

  test('test_cloud', () async {
    var result = await api.cloudSong();
    expect(result.code, RET_CODE_OK);

    List<String> ids = result.data.map((e) => e.songId).toList();

    var result2 = await api.cloudSongDetail(ids);
    expect(result2.code, RET_CODE_OK);

    if (ids.isEmpty) {
      return;
    }

    var result3 = await api.cloudSongDelete([ids.first]);
    expect(result3.code, RET_CODE_OK);
  });

  test('test_song_like', () async {
    var result = await api.likeSong('167975', false);
    expect(result.code, RET_CODE_OK);

    sleep(Duration(seconds: 1));

    var result2 = await api.likeSong('167975', true);
    expect(result2.code, anyOf(RET_CODE_OK, 500));
  });

  test('test_punch_song', () async {
    var result = await api.punchSong('167975', '2819660572');
    expect(result.code, RET_CODE_OK);
  });

  test('test_song_detail', () async {
    var result = await api.songDetail(['167975', '167975']);
    expect(result.code, RET_CODE_OK);
  });

  test('test_song_url_list', () async {
    var result = await api.songUrl(['167975', '167975']);
    expect(result.code, RET_CODE_OK);
  });

  test('test_song_lyric', () async {
    var result = await api.songLyric('167975');
    expect(result.code, RET_CODE_OK);
  });

  test('test_song_available_check', () async {
    var result = await api.songAvailableCheck(['167975', '167975']);
    expect(result.code, RET_CODE_OK);
  });

  test('test_artist_list', () async {
    var result = await api.artistList('a'.codeUnitAt(0));
    expect(result.code, RET_CODE_OK);
  });

  test('test_top_artist', () async {
    var result = await api.topArtist();
    expect(result.code, RET_CODE_OK);
  });

  test('test_artist_top_list', () async {
    var result = await api.artistTopList(type: 1);
    expect(result.code, RET_CODE_OK);
  });

  test('test_simi_artist', () async {
    var result = await api.artistSimiList(defaultArtistId);
    expect(result.code, RET_CODE_OK);
  });

  test('test_artist_desc', () async {
    var result = await api.artistDesc(defaultArtistId);
    expect(result.code, RET_CODE_OK);
  });

  test('test_artist_detail', () async {
    var result = await api.artistDetail(defaultArtistId);
    expect(result.code, RET_CODE_OK);
  });

  test('test_artist_top_song_list', () async {
    var result = await api.artistTopSongList(defaultArtistId);
    expect(result.code, RET_CODE_OK);
  });

  test('test_artist_all_song_list', () async {
    var result = await api.artistALLSongList(defaultArtistId);
    expect(result.code, RET_CODE_OK);
  });

  test('test_artist_followed_song_list', () async {
    var result = await api.artistFollowedNewSongList();
    expect(result.code, RET_CODE_OK);
  });

  test('test_artist_song_list', () async {
    var result = await api.artistDetailAndSongList(defaultArtistId);
    expect(result.code, RET_CODE_OK);
  });

  test('test_all_mv_list', () async {
    var result = await api.allMvList();
    expect(result.code, RET_CODE_OK);
  });

  test('test_top_mv_list', () async {
    var result = await api.topMvList();
    expect(result.code, RET_CODE_OK);
  });

  test('test_newest_mv_list', () async {
    var result = await api.newestMvList();
    expect(result.code, RET_CODE_OK);
  });

  test('test_netease_mv_list', () async {
    var result = await api.neteaseMvList();
    expect(result.code, RET_CODE_OK);
  });

  test('test_personalized_mv_list', () async {
    var result = await api.personalizedMvList();
    expect(result.code, RET_CODE_OK);
  });

  test('test_artist_mv_list', () async {
    var result = await api.artistMvList(defaultArtistId);
    expect(result.code, RET_CODE_OK);
  });

  test('test_artist_followed_new_mv_list', () async {
    var result = await api.artistFollowedNewMvList();
    expect(result.code, RET_CODE_OK);
  });

  test('test_simi_mv', () async {
    var result = await api.mvSimiList('5293222');
    expect(result.code, RET_CODE_OK);
  });

  test('test_mv_detail', () async {
    var result = await api.mvDetail('5293222');
    expect(result.code, RET_CODE_OK);
  });

  test('test_mv_detailInfo', () async {
    var result = await api.mvDetailInfo('5293222');
    expect(result.code, RET_CODE_OK);
  });

  test('test_mv_url', () async {
    var result = await api.mvUrl('5293222');
    expect(result.code, RET_CODE_OK);
  });

  test('test_video_category_list', () async {
    var result = await api.videoCategoryList();
    expect(result.code, RET_CODE_OK);
  });

  test('test_video_group_list_& video list', () async {
    var result = await api.videoGroupList();
    expect(result.code, RET_CODE_OK);

    if (result.data.isEmpty) {
      return;
    }

    var result2 = await api.videoListByGroup(result.data[0].id);
    expect(result2.code, RET_CODE_OK);

    var result3 = await api.videoList();
    expect(result3.code, RET_CODE_OK);

    var result4 = await api.videoListOther(result.data[0].id);
    expect(result4.code, RET_CODE_OK);
  });

  test('test_related_video_list', () async {
    var result = await api.relatedVideoList('84107D4616B72B929C8AEB7D1E6CC904');
    expect(result.code, RET_CODE_OK);
  });

  test('test_video_detail', () async {
    var result = await api.videoDetail('84107D4616B72B929C8AEB7D1E6CC904');
    expect(result.code, RET_CODE_OK);
  });

  test('test_video_detail_info', () async {
    var result = await api.videoDetailInfo('84107D4616B72B929C8AEB7D1E6CC904');
    expect(result.code, RET_CODE_OK);
  });

  test('test_video_url', () async {
    var result = await api.videoUrl([
      '84107D4616B72B929C8AEB7D1E6CC904',
      '84107D4616B72B929C8AEB7D1E6CC904'
    ]);
    expect(result.code, RET_CODE_OK);
  });

  test('test_mlog_mylike', () async {
    var result = await api.mlogMylike();
    expect(result.code, RET_CODE_OK);
  });

  test('test_artist_album_list', () async {
    var result = await api.artistAlbumList(defaultArtistId);
    expect(result.code, RET_CODE_OK);
  });

  test('test_new_album_list', () async {
    var result = await api.newAlbumList();
    expect(result.code, RET_CODE_OK);
  });

  test('test_new_album_area_list', () async {
    var result = await api.newAlbumListByArea();
    expect(result.code, RET_CODE_OK);
  });

  test('test_newest_album_list', () async {
    var result = await api.newestAlbumList();
    expect(result.code, RET_CODE_OK);
  });

  test('test_album_detail', () async {
    var result = await api.albumDetail('489928');
    expect(result.code, RET_CODE_OK);
  });

  test('test_album_detail_dynamic', () async {
    var result = await api.albumDetailDynamic('489928');
    expect(result.code, RET_CODE_OK);
  });
}
