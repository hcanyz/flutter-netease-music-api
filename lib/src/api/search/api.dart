import 'package:dio/dio.dart';
import 'package:netease_music_api/src/dio_ext.dart';
import 'package:netease_music_api/src/netease_handler.dart';

import 'bean.dart';

mixin ApiSearch {
  /// [type] 搜索类型 1: 单曲
  Future<SearchSongWrapX> searchSong(String keyword,
      {int offset = 0, int limit = 30}) {
    var params = {'s': keyword, 'type': 1, 'limit': limit, 'offset': offset};
    return Https.dio
        .postUri(joinUri('/weapi/search/get'),
            data: params, options: joinOptions())
        .then((Response value) {
      return SearchSongWrapX.fromJson(value.data);
    });
  }

  /// [type] 搜索类型  10: 专辑
  Future<SearchAlbumsWrapX> searchAlbum(String keyword,
      {int offset = 0, int limit = 30}) {
    var params = {'s': keyword, 'type': 10, 'limit': limit, 'offset': offset};
    return Https.dio
        .postUri(joinUri('/weapi/search/get'),
            data: params, options: joinOptions())
        .then((Response value) {
      return SearchAlbumsWrapX.fromJson(value.data);
    });
  }

  /// [type] 搜索类型 100: 歌手
  Future<SearchArtistsWrapX> searchArtists(String keyword,
      {int offset = 0, int limit = 30}) {
    var params = {'s': keyword, 'type': 100, 'limit': limit, 'offset': offset};
    return Https.dio
        .postUri(joinUri('/weapi/search/get'),
            data: params, options: joinOptions())
        .then((Response value) {
      return SearchArtistsWrapX.fromJson(value.data);
    });
  }

  /// [type] 搜索类型 1000: 歌单
  Future<SearchPlaylistWrapX> searchPlaylist(String keyword,
      {int offset = 0, int limit = 30}) {
    var params = {'s': keyword, 'type': 1000, 'limit': limit, 'offset': offset};
    return Https.dio
        .postUri(joinUri('/weapi/search/get'),
            data: params, options: joinOptions())
        .then((Response value) {
      return SearchPlaylistWrapX.fromJson(value.data);
    });
  }

  /// [type] 搜索类型 1: 单曲, 10: 专辑, 100: 歌手, 1000: 歌单, 1002: 用户, 1004: MV, 1006: 歌词, 1009: 电台, 1014: 视频, 1018:综合，默认为1
  Future<SearchUserWrapX> searchUser(String keyword,
      {int offset = 0, int limit = 30}) {
    var params = {'s': keyword, 'type': 1002, 'limit': limit, 'offset': offset};
    return Https.dio
        .postUri(joinUri('/weapi/search/get'),
            data: params, options: joinOptions())
        .then((Response value) {
      return SearchUserWrapX.fromJson(value.data);
    });
  }
}
