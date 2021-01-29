import 'package:flutter_test/flutter_test.dart';
import 'package:netease_music_api/netease_music_api.dart';

import 'test_helper.dart';

void main() async {
  await NeteaseMusicApi.init(provider: MockPathProvider(), debug: true);

  var api = NeteaseMusicApi();

  test('test_search_song', () async {
    var result = await api.searchSong("许巍", cloudSearch: false);
    expect(result.code, RET_CODE_OK);

    var result2 = await api.searchSong("许巍", cloudSearch: true);
    expect(result2.code, RET_CODE_OK);
  });

  test('test_search_album', () async {
    var result = await api.searchAlbum("许巍", cloudSearch: false);
    expect(result.code, RET_CODE_OK);

    var result2 = await api.searchAlbum("许巍", cloudSearch: true);
    expect(result2.code, RET_CODE_OK);
  });

  test('test_search_artists', () async {
    var result = await api.searchArtists("许巍", cloudSearch: false);
    expect(result.code, RET_CODE_OK);

    var result2 = await api.searchArtists("许巍", cloudSearch: true);
    expect(result2.code, RET_CODE_OK);
  });

  test('test_search_playlist', () async {
    var result = await api.searchPlaylist("许巍", cloudSearch: false);
    expect(result.code, RET_CODE_OK);

    var result2 = await api.searchPlaylist("许巍", cloudSearch: true);
    expect(result2.code, RET_CODE_OK);
  });

  test('test_search_user', () async {
    var result = await api.searchUser("许巍", cloudSearch: false);
    expect(result.code, RET_CODE_OK);

    var result2 = await api.searchUser("许巍", cloudSearch: true);
    expect(result2.code, RET_CODE_OK);
  });

  test('test_search_mv', () async {
    var result = await api.searchMv("许巍", cloudSearch: false);
    expect(result.code, RET_CODE_OK);

    var result2 = await api.searchMv("许巍", cloudSearch: true);
    expect(result2.code, RET_CODE_OK);
  });

  test('test_search_lyrics', () async {
    var result = await api.searchLyrics("许巍", cloudSearch: false);
    expect(result.code, RET_CODE_OK);

    var result2 = await api.searchLyrics("许巍", cloudSearch: true);
    expect(result2.code, RET_CODE_OK);
  });

  test('test_search_djradio', () async {
    var result = await api.searchDjradio("许巍", cloudSearch: false);
    expect(result.code, RET_CODE_OK);

    var result2 = await api.searchDjradio("许巍", cloudSearch: true);
    expect(result2.code, RET_CODE_OK);
  });

  test('test_search_video', () async {
    var result = await api.searchVideo("许巍", cloudSearch: false);
    expect(result.code, RET_CODE_OK);

    var result2 = await api.searchVideo("许巍", cloudSearch: true);
    expect(result2.code, RET_CODE_OK);
  });

  test('test_search_complex', () async {
    var result = await api.searchComplex("许巍", cloudSearch: false);
    expect(result.code, RET_CODE_OK);

    var result2 = await api.searchComplex("许巍", cloudSearch: true);
    expect(result2.code, RET_CODE_OK);
  });

  test('test_search_default_key', () async {
    var result = await api.searchDefaultKey();
    expect(result.code, RET_CODE_OK);
  });

  test('test_search_hot_key', () async {
    var result = await api.searchHotKey();
    expect(result.code, RET_CODE_OK);
  });

  test('test_search_hot_key_detail', () async {
    var result = await api.searchHotKeyDetailed();
    expect(result.code, RET_CODE_OK);
  });

  test('test_search_suggest', () async {
    var result = await api.searchSuggest('许巍');
    expect(result.code, RET_CODE_OK);
  });

  test('test_search_multi_match', () async {
    var result = await api.searchMultiMatch('许巍');
    expect(result.code, RET_CODE_OK);
  });
}
