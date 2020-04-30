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
}
