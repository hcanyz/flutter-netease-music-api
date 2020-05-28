import 'package:flutter_test/flutter_test.dart';
import 'package:netease_music_api/netease_music_api.dart';

import 'test_helper.dart';

void main() async {
  await NeteaseMusicApi.init(provider: MockPathProvider(), debug: true);

  var api = NeteaseMusicApi();

  test('test search song', () async {
    var result = await api.searchSong("许巍");
    expect(result.code, RET_CODE_OK);
  });

  test('test search album', () async {
    var result = await api.searchAlbum("许巍");
    expect(result.code, RET_CODE_OK);
  });

  test('test search artists', () async {
    var result = await api.searchArtists("许巍");
    expect(result.code, RET_CODE_OK);
  });

  test('test search playlist', () async {
    var result = await api.searchPlaylist("许巍");
    expect(result.code, RET_CODE_OK);
  });

  test('test search user', () async {
    var result = await api.searchUser("许巍");
    expect(result.code, RET_CODE_OK);
  });

  test('test search mv', () async {
    var result = await api.searchMv("许巍");
    expect(result.code, RET_CODE_OK);
  });

  test('test search lyrics', () async {
    var result = await api.searchLyrics("许巍");
    expect(result.code, RET_CODE_OK);
  });

  test('test search djradio', () async {
    var result = await api.searchDjradio("许巍");
    expect(result.code, RET_CODE_OK);
  });

  test('test search video', () async {
    var result = await api.searchVideo("许巍");
    expect(result.code, RET_CODE_OK);
  });

  test('test search complex', () async {
    var result = await api.searchComplex("许巍");
    expect(result.code, RET_CODE_OK);
  });

  test('test search default key', () async {
    var result = await api.searchDefaultKey();
    expect(result.code, RET_CODE_OK);
  });

  test('test search hot key', () async {
    var result = await api.searchHotKey();
    expect(result.code, RET_CODE_OK);
  });

  test('test search hot key detail', () async {
    var result = await api.searchHotKeyDetailed();
    expect(result.code, RET_CODE_OK);
  });

  test('test search suggest', () async {
    var result = await api.searchSuggest('许巍');
    expect(result.code, RET_CODE_OK);
  });

  test('test search multi match', () async {
    var result = await api.searchMultiMatch('许巍');
    expect(result.code, RET_CODE_OK);
  });
}
