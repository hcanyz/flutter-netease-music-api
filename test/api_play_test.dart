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

  test('test user playlist subscribers', () async {
    var result = await api.playlistSubscribers('2819660572');
    expect(result.code, RET_CODE_OK);
  });

  test('test playlist catalogue', () async {
    var result = await api.playlistCatalogue();
    expect(result.code, RET_CODE_OK);
  });

  test('test playlist hot tags', () async {
    var result = await api.playlistHotTags();
    expect(result.code, RET_CODE_OK);
  });

  test('test highquality playlist', () async {
    var result = await api.highqualityPlayList();
    expect(result.code, RET_CODE_OK);
  });

  test('test related playlist', () async {
    var result = await api.relatedPlayList('167975');
    expect(result.code, RET_CODE_OK);
  });

  test('test personalized playlist', () async {
    var result = await api.personalizedPlaylist();
    expect(result.code, RET_CODE_OK);
  });

  test('test recommend everyday playlist', () async {
    var result = await api.recommendPlaylist();
    expect(result.code, RET_CODE_OK);
  });

  test('test playmode intelligence list ', () async {
    var result = await api.playmodeIntelligenceList('33894312', '24381616');
    expect(result.code, RET_CODE_OK);
  });

  test('test playlist simi', () async {
    var result = await api.playListSimiList('4875306');
    expect(result.code, RET_CODE_OK);
  });

  test('test category playlist', () async {
    var result = await api.playListDetail(PLAYLIST_CATEGORY[0]['id']);
    expect(result.code, RET_CODE_OK);
  });

  test('test category song list', () async {
    var result = await api.categorySongList();
    expect(result.code, RET_CODE_OK);
  });

  test('test recommend song list x', () async {
    var result = await api.recommendSongList();
    expect(result.code, RET_CODE_OK);
  });

  test('test recommend song list history detail', () async {
    var result = await api.recommendSongListHistory();
    expect(result.code, RET_CODE_OK);

    if (result.data.dates.isEmpty) {
      return;
    }

    var result2 =
        await api.recommendSongListHistoryDetail(date: result.data.dates[0]);
    expect(result2.code, RET_CODE_OK);
  });

  test('test user radio x', () async {
    var result = await api.userRadio();
    expect(result.code, RET_CODE_OK);
  });

  test('test user radio trash', () async {
    var result = await api.userRadio();
    expect(result.code, RET_CODE_OK);

    if (result.data.isEmpty) {
      return;
    }

    var result2 = await api.userRadioTrash(result.data[0].id);
    expect(result2.code, RET_CODE_OK);
  });

  test('test personalized song list', () async {
    var result = await api.personalizedSongList();
    expect(result.code, RET_CODE_OK);
  });

  test('test new song list', () async {
    var result = await api.newSongList();
    expect(result.code, RET_CODE_OK);
  });

  test('test user song simi', () async {
    var result = await api.userSongSimiList('167975');
    expect(result.code, RET_CODE_OK);
  });

  test('test song simi', () async {
    var result = await api.songSimiList('167975');
    expect(result.code, RET_CODE_OK);
  });

  test('test song like list', () async {
    var result = await api.likeSongList(
        NeteaseMusicApi().usc?.accountInfo?.account?.id ?? defaultUserId);
    expect(result.code, RET_CODE_OK);
  });

  test('test cloud', () async {
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

  test('test song like x', () async {
    var result = await api.likeSong('167975', false);
    expect(result.code, RET_CODE_OK);

    sleep(Duration(seconds: 1));

    var result2 = await api.likeSong('167975', true);
    expect(result2.code, anyOf(RET_CODE_OK, 500));
  });

  test('test punch song', () async {
    var result = await api.punchSong('167975', '2819660572');
    expect(result.code, RET_CODE_OK);
  });

  test('test song detail', () async {
    var result = await api.songDetail(['167975', '167975']);
    expect(result.code, RET_CODE_OK);
  });

  test('test song url list ', () async {
    var result = await api.songUrl(['167975', '167975']);
    expect(result.code, RET_CODE_OK);
  });

  test('test song lyric', () async {
    var result = await api.songLyric('167975');
    expect(result.code, RET_CODE_OK);
  });

  test('test song available check', () async {
    var result = await api.songAvailableCheck(['167975', '167975']);
    expect(result.code, RET_CODE_OK);
  });

  test('test artist list ', () async {
    var result = await api.artistList('a'.codeUnitAt(0));
    expect(result.code, RET_CODE_OK);
  });

  test('test top artist', () async {
    var result = await api.topArtist();
    expect(result.code, RET_CODE_OK);
  });

  test('test artist top list', () async {
    var result = await api.artistTopList(type: 1);
    expect(result.code, RET_CODE_OK);
  });

  test('test simi artist', () async {
    var result = await api.artistSimiList(defaultArtistId);
    expect(result.code, RET_CODE_OK);
  });

  test('test artist desc', () async {
    var result = await api.artistDesc(defaultArtistId);
    expect(result.code, RET_CODE_OK);
  });

  test('test artist top song list ', () async {
    var result = await api.artistTopSongList(defaultArtistId);
    expect(result.code, RET_CODE_OK);
  });

  test('test artist song list ', () async {
    var result = await api.artistSongList(defaultArtistId);
    expect(result.code, RET_CODE_OK);
  });

  test('test all mv list', () async {
    var result = await api.allMvList();
    expect(result.code, RET_CODE_OK);
  });

  test('test top mv list', () async {
    var result = await api.topMvList();
    expect(result.code, RET_CODE_OK);
  });

  test('test newest mv list', () async {
    var result = await api.newestMvList();
    expect(result.code, RET_CODE_OK);
  });

  test('test netease mv list', () async {
    var result = await api.neteaseMvList();
    expect(result.code, RET_CODE_OK);
  });

  test('test personalized mv list', () async {
    var result = await api.personalizedMvList();
    expect(result.code, RET_CODE_OK);
  });

  test('test artist mv list ', () async {
    var result = await api.artistMvList(defaultArtistId);
    expect(result.code, RET_CODE_OK);
  });

  test('test simi mv', () async {
    var result = await api.mvSimiList('5293222');
    expect(result.code, RET_CODE_OK);
  });

  test('test mv detail', () async {
    var result = await api.mvDetail('5293222');
    expect(result.code, RET_CODE_OK);
  });

  test('test mv detailInfo', () async {
    var result = await api.mvDetailInfo('5293222');
    expect(result.code, RET_CODE_OK);
  });

  test('test mv url', () async {
    var result = await api.mvUrl('5293222');
    expect(result.code, RET_CODE_OK);
  });

  test('test video category list', () async {
    var result = await api.videoCategoryList();
    expect(result.code, RET_CODE_OK);
  });

  test('test video group list & video list', () async {
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

  test('test related video list', () async {
    var result = await api.relatedVideoList('84107D4616B72B929C8AEB7D1E6CC904');
    expect(result.code, RET_CODE_OK);
  });

  test('test video detail x', () async {
    var result = await api.videoDetail('84107D4616B72B929C8AEB7D1E6CC904');
    expect(result.code, RET_CODE_OK);
  });

  test('test video detail info', () async {
    var result = await api.videoDetailInfo('84107D4616B72B929C8AEB7D1E6CC904');
    expect(result.code, RET_CODE_OK);
  });

  test('test video url', () async {
    var result = await api.videoUrl([
      '84107D4616B72B929C8AEB7D1E6CC904',
      '84107D4616B72B929C8AEB7D1E6CC904'
    ]);
    expect(result.code, RET_CODE_OK);
  });

  test('test artist album list ', () async {
    var result = await api.artistAlbumList(defaultArtistId);
    expect(result.code, RET_CODE_OK);
  });

  test('test new album list', () async {
    var result = await api.newAlbumList();
    expect(result.code, RET_CODE_OK);
  });

  test('test new album area list', () async {
    var result = await api.newAlbumListByArea();
    expect(result.code, RET_CODE_OK);
  });

  test('test newest album list', () async {
    var result = await api.newestAlbumList();
    expect(result.code, RET_CODE_OK);
  });

  test('test album detail x', () async {
    var result = await api.albumDetail('489928');
    expect(result.code, RET_CODE_OK);
  });

  test('test album detail dynamic', () async {
    var result = await api.albumDetailDynamic('489928');
    expect(result.code, RET_CODE_OK);
  });
}
