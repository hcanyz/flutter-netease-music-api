library netease_music_api;

import 'package:netease_music_api/src/netease_api.dart';

class Test {
  test() async {
    var api = NeteaseMusicApi();
    await api.homeBannerList();
    await api.categoryPlayList(NeteaseMusicApi.PLAYLIST_CATEGORY[0]["id"], 0);
    await api.highqualityPlayList(0);
  }
}
