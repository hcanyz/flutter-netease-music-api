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

  /// [type] 1002: 用户
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

  /// [type] 1004: MV
  Future<SearchMvWrapX> searchMv(String keyword,
      {int offset = 0, int limit = 30}) {
    var params = {'s': keyword, 'type': 1004, 'limit': limit, 'offset': offset};
    return Https.dio
        .postUri(joinUri('/weapi/search/get'),
            data: params, options: joinOptions())
        .then((Response value) {
      return SearchMvWrapX.fromJson(value.data);
    });
  }

  /// [type] 1006: 歌词
  Future<SearchLyricsWrapX> searchLyrics(String keyword,
      {int offset = 0, int limit = 30}) {
    var params = {'s': keyword, 'type': 1006, 'limit': limit, 'offset': offset};
    return Https.dio
        .postUri(joinUri('/weapi/search/get'),
            data: params, options: joinOptions())
        .then((Response value) {
      return SearchLyricsWrapX.fromJson(value.data);
    });
  }

  /// [type] 1009: 电台
  Future<SearchDjradioWrapX> searchDjradio(String keyword,
      {int offset = 0, int limit = 30}) {
    var params = {'s': keyword, 'type': 1009, 'limit': limit, 'offset': offset};
    return Https.dio
        .postUri(joinUri('/weapi/search/get'),
            data: params, options: joinOptions())
        .then((Response value) {
      return SearchDjradioWrapX.fromJson(value.data);
    });
  }

  /// [type] 1014: 视频
  Future<SearchVideoWrapX> searchVideo(String keyword,
      {int offset = 0, int limit = 30}) {
    var params = {'s': keyword, 'type': 1014, 'limit': limit, 'offset': offset};
    return Https.dio
        .postUri(joinUri('/weapi/search/get'),
            data: params, options: joinOptions())
        .then((Response value) {
      return SearchVideoWrapX.fromJson(value.data);
    });
  }

  /// [type] 1018:综合
  Future<SearchComplexWrapX> searchComplex(String keyword,
      {int offset = 0, int limit = 30}) {
    var params = {'s': keyword, 'type': 1018, 'limit': limit, 'offset': offset};
    return Https.dio
        .postUri(joinUri('/weapi/search/get'),
            data: params, options: joinOptions())
        .then((Response value) {
      return SearchComplexWrapX.fromJson(value.data);
    });
  }

  /// 默认搜索关键词
  Future<SearchKeyWrap> searchDefaultKey() {
    return Https.dio
        .postUri(
            Uri.parse(
                'http://interface3.music.163.com/eapi/search/defaultkeyword/get'),
            data: {},
            options: joinOptions(
                encryptType: EncryptType.EApi,
                eApiUrl: '/api/search/defaultkeyword/get'))
        .then((Response value) {
      return SearchKeyWrap.fromJson(value.data);
    });
  }

  /// 热搜列表(简略)
  Future<SearchKeyWrapX> searchHotKey() {
    return Https.dio
        .postUri(joinUri('/weapi/search/hot'),
            data: {'type': 1111},
            options: joinOptions(userAgent: UserAgent.Mobile))
        .then((Response value) {
      return SearchKeyWrapX.fromJson(value.data);
    });
  }

  /// 热搜列表(详细)
  Future<SearchKeyDetailedWrap> searchHotKeyDetailed() {
    return Https.dio
        .postUri(joinUri('/weapi/hotsearchlist/get'),
            data: {}, options: joinOptions())
        .then((Response value) {
      return SearchKeyDetailedWrap.fromJson(value.data);
    });
  }

  /// 搜索建议(联想)
  /// [type] : 'mobile': 返回移动端数据  'web': web
  Future<SearchSuggestWrapX> searchSuggest(String keyword,
      {String type = 'mobile'}) {
    var params = {'s': keyword};
    return Https.dio
        .postUri(
            joinUri(
                '/weapi/search/suggest/${type == 'mobile' ? 'keyword' : 'web'}'),
            data: params,
            options: joinOptions())
        .then((Response value) {
      return SearchSuggestWrapX.fromJson(value.data);
    });
  }

  /// 搜索多重匹配
  Future<SearchMultiMatchWrapX> searchMultiMatch(String keyword) {
    var params = {'s': keyword, 'type': '1'};
    return Https.dio
        .postUri(joinUri('/weapi/search/suggest/multimatch'),
            data: params, options: joinOptions())
        .then((Response value) {
      return SearchMultiMatchWrapX.fromJson(value.data);
    });
  }
}
