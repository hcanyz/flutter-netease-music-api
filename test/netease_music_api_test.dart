import 'package:flutter_test/flutter_test.dart';
import 'package:netease_music_api/netease_music_api.dart';

import 'private_config.dart';

void main() {
  NeteaseMusicApi.debug = true;

  var api = NeteaseMusicApi();

  test('test login cellPhone', () async {
    var result = await api.loginCellPhone(login_phone, login_phone_password);
    expect(result.code, 200);
  });

  test('test login email', () async {
    var result = await api.loginEmail(login_email, login_email_password);
    expect(result.code, 200);
  });

  test('test homeBannerList', () async {
    await api.homeBannerList();
  });

  test('test categoryPlayList', () async {
    var result = await api.categoryPlayList(PLAYLIST_CATEGORY[0]['id'], 0);
    expect(result.code, 200);
  });

  test('test highqualityPlayList', () async {
    var result = await api.highqualityPlayList(0);
    expect(result.code, 200);
  });
}
