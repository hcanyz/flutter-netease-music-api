import 'package:flutter_test/flutter_test.dart';
import 'package:netease_music_api/netease_music_api.dart';

void main() {
  test('test', () async {
    var api = NeteaseMusicApi();
    await api.homeBannerList();
    await api.categoryPlayList(PLAYLIST_CATEGORY[0]["id"], 0);
    await api.highqualityPlayList(0);
  });
}
