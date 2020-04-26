import 'package:dio/dio.dart';
import 'package:netease_music_api/src/api/bean.dart';
import 'package:netease_music_api/src/dio_ext.dart';
import 'package:netease_music_api/src/netease_handler.dart';

import 'bean.dart';

mixin ApiPlayList {
  /// 获取用户歌单
  /// !需要登录
  Future<MultiPlayListWrap2> userPlayList(String userId,
      {int offset = 0, int limit = 30}) {
    var params = {'uid': userId, 'limit': limit, 'offset': offset};
    return Https.dio
        .postUri(joinUri('/weapi/user/playlist'),
            data: params, options: joinOptions())
        .then((Response value) {
      return MultiPlayListWrap2.fromJson(value.data);
    });
  }

  /// 更新用户歌单信息
  /// !需要登录
  /// [name] 歌单名字
  /// [desc] 歌单描述
  /// [tags] 歌单tag ,多个用 `;` 隔开,只能用官方规定标签
  Future<ServerStatusBean> updateUserPlayListInfo(
      String id, String name, String desc, List<String> tags) {
    var params = {
      '/api/playlist/update/name': '{"id": "$id", "name": "$name"}',
      '/api/playlist/desc/update': '{"id": "$id", "desc": "$desc"}',
      '/api/playlist/tags/update':
          '{"id": "$id", "tags": "${tags?.join(',') ?? ''}"}'
    };
    return Https.dio
        .postUri(joinUri('/weapi/batch'),
            data: params, options: joinOptions(cookies: {'os': 'pc'}))
        .then((Response value) {
      return ServerStatusBean.fromJson(value.data);
    });
  }

  /// 更新用户歌单描述
  /// !需要登录
  /// [desc] 歌单描述
  Future<ServerStatusBean> updateUserPlayListDesc(String id, String desc) {
    var params = {'id': id, 'desc': desc};
    return Https.dio
        .postUri(joinUri('/eapi/playlist/desc/update'),
            data: params,
            options: joinOptions(
                encryptType: EncryptType.EApi,
                eApiUrl: '/api/playlist/desc/update'))
        .then((Response value) {
      return ServerStatusBean.fromJson(value.data);
    });
  }

  /// 更新用户歌单描述
  /// !需要登录
  /// [name] 歌单名字
  Future<ServerStatusBean> updateUserPlayListName(String id, String name) {
    var params = {'id': id, 'name': name};
    return Https.dio
        .postUri(joinUri('/eapi/playlist/update/name'),
            data: params,
            options: joinOptions(
                encryptType: EncryptType.EApi,
                eApiUrl: '/api/playlist/update/name'))
        .then((Response value) {
      return ServerStatusBean.fromJson(value.data);
    });
  }

  /// 更新用户歌单描述
  /// !需要登录
  /// [tags] 歌单标签
  Future<ServerStatusBean> updateUserPlayListTags(
      String id, List<String> tags) {
    var params = {'id': id, 'tags': tags?.join(',') ?? ''};
    return Https.dio
        .postUri(joinUri('/eapi/playlist/tags/update'),
            data: params,
            options: joinOptions(
                encryptType: EncryptType.EApi,
                eApiUrl: '/api/playlist/tags/update'))
        .then((Response value) {
      return ServerStatusBean.fromJson(value.data);
    });
  }

  Future<PlaylistCatalogueWrap> playlistCatalogue() {
    return Https.dio
        .postUri(joinUri('/weapi/playlist/catalogue'),
            data: {}, options: joinOptions())
        .then((Response value) {
      return PlaylistCatalogueWrap.fromJson(value.data);
    });
  }

  Future<PlaylistHotTagsWrap> playlistHotTags() {
    return Https.dio
        .postUri(joinUri('/weapi/playlist/hottags'),
            data: {}, options: joinOptions())
        .then((Response value) {
      return PlaylistHotTagsWrap.fromJson(value.data);
    });
  }

  Future<ServerStatusBean> homeBannerList() {
    return Https.dio
        .postUri(joinUri('/api/v2/banner/get'),
            data: {'clientType': 'pc'}, options: joinOptions())
        .then((Response value) {
      return ServerStatusBean.fromJson(value.data);
    });
  }

  Future<MultiPlayListWrap> highqualityPlayList(
      {int offset = 0, int limit = 30}) {
    var params = {'limit': limit, 'offset': offset};
    return Https.dio
        .postUri(joinUri('/weapi/playlist/highquality/list'),
            data: params, options: joinOptions())
        .then((Response value) {
      return MultiPlayListWrap.fromJson(value.data);
    });
  }

  Future<SinglePlayListWrap> categoryPlayList(String categoryId,
      {int offset = 0, int limit = 30}) {
    var params = {'id': categoryId, 'limit': limit, 'offset': offset};
    return Https.dio
        .postUri(joinUri('/weapi/v3/playlist/detail'),
            data: params, options: joinOptions())
        .then((Response value) {
      return SinglePlayListWrap.fromJson(value.data);
    });
  }

  Future<RecommendSongListWrap> recommendSongList(
      {int offset = 0, int limit = 30}) {
    var params = {'limit': limit, 'offset': offset};
    return Https.dio
        .postUri(joinUri('/weapi/v1/discovery/recommend/songs'),
            data: params, options: joinOptions())
        .then((Response value) {
      return RecommendSongListWrap.fromJson(value.data);
    });
  }

  /// 心动模式/智能播放
  /// [songId]  歌曲 id
  /// [playlistId]  歌单 id
  /// [startMusicId]  要开始播放的歌曲的 id
  Future<PlaymodeIntelligenceListWrap> playmodeIntelligenceList(
      String songId, String playlistId,
      {String startMusicId, int count = 1}) {
    var params = {
      'songId': songId,
      'type': 'fromPlayOne',
      'playlistId': playlistId,
      'startMusicId': startMusicId ?? songId,
      'count': count
    };
    return Https.dio
        .postUri(joinUri('/weapi/playmode/intelligence/list'),
            data: params, options: joinOptions())
        .then((Response value) {
      return PlaymodeIntelligenceListWrap.fromJson(value.data);
    });
  }

  /// 分类 歌手列表
  /// [type]   -1:全部 1:男歌手 2:女歌手 3:乐队
  /// [area]   -1:全部 7:华语 96:欧美 8:日本 16:韩国 0:其他
  /// [initial] 取值 a-z/A-Z
  Future<ArtistsListWrap> artistList(int initial,
      {int offset = 0,
      int limit = 30,
      bool total = true,
      int type = 1,
      int area = -1}) {
    var params = {
      'initial': initial,
      'type': type,
      'area': area,
      'total': total,
      'limit': limit,
      'offset': offset
    };
    return Https.dio
        .postUri(joinUri('/api/v1/artist/list'),
            data: params, options: joinOptions())
        .then((Response value) {
      return ArtistsListWrap.fromJson(value.data);
    });
  }

  /// 歌手热门50首歌曲
  Future<ArtistTopSongList> artistTopSongList(String artistId) {
    var params = {'id': artistId};
    return Https.dio
        .postUri(joinUri('/api/artist/top/song'),
            data: params, options: joinOptions())
        .then((Response value) {
      return ArtistTopSongList.fromJson(value.data);
    });
  }
}
