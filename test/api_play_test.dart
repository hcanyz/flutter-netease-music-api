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

  test('test playmode intelligence list ', () async {
    var result = await api.playmodeIntelligenceList('33894312', '24381616');
    expect(result.code, RET_CODE_OK);
  });

  test('test playlist simi', () async {
    var result = await api.playListSimi('4875306');
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

  test('test recommend song list', () async {
    var result = await api.recommendSongList();
    expect(result.code, RET_CODE_OK);
  });

  test('test new song list', () async {
    var result = await api.newSongList();
    expect(result.code, RET_CODE_OK);
  });

  test('test user song simi', () async {
    var result = await api.userSongSimi('167975');
    expect(result.code, RET_CODE_OK);
  });

  test('test song simi', () async {
    var result = await api.songSimi('167975');
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

  test('test simi mv', () async {
    var result = await api.mvSimi('5293222');
    expect(result.code, RET_CODE_OK);
  });

  test('test simi artist', () async {
    var result = await api.artistSimi(defaultArtistId);
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

  test('test artist mv list ', () async {
    var result = await api.artistMvList(defaultArtistId);
    expect(result.code, RET_CODE_OK);
  });

  test('test artist album list ', () async {
    var result = await api.artistAlbumList(defaultArtistId);
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
