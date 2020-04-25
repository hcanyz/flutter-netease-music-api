import 'package:dio/dio.dart';
import 'package:netease_music_api/src/api/bean.dart';
import 'package:netease_music_api/src/dio_ext.dart';
import 'package:netease_music_api/src/netease_handler.dart';

import 'bean.dart';

mixin ApiPlayList {
  /// 获取用户歌单
  /// !需要登录
  Future<MultiPlayListWrap2> userPlayList(String userId, int page,
      {int limit = 30}) {
    var params = {'uid': userId, 'limit': limit, 'offset': page * limit};
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

  Future<ServerStatusBean> homeBannerList() {
    return Https.dio
        .postUri(joinUri('/api/v2/banner/get'),
            data: {'clientType': 'pc'},
            options: joinOptions(hookRequestDate: true))
        .then((Response value) {
      return ServerStatusBean.fromJson(value.data);
    });
  }

  Future<MultiPlayListWrap> highqualityPlayList(int page, {int limit = 30}) {
    var params = {'limit': limit, 'offset': page * limit};
    return Https.dio
        .postUri(joinUri('/weapi/playlist/highquality/list'),
            data: params, options: joinOptions())
        .then((Response value) {
      return MultiPlayListWrap.fromJson(value.data);
    });
  }

  Future<SinglePlayListWrap> categoryPlayList(String categoryId, int page,
      {int limit = 30}) {
    var params = {'id': categoryId, 'limit': limit, 'offset': page * limit};
    return Https.dio
        .postUri(joinUri('/weapi/v3/playlist/detail'),
            data: params, options: joinOptions())
        .then((Response value) {
      return SinglePlayListWrap.fromJson(value.data);
    });
  }

  Future<RecommendSongListWrap> recommendSongList(int page, {int limit = 30}) {
    var params = {'limit': limit, 'offset': page * limit};
    return Https.dio
        .postUri(joinUri('/weapi/v1/discovery/recommend/songs'),
            data: params, options: joinOptions())
        .then((Response value) {
      return RecommendSongListWrap.fromJson(value.data);
    });
  }

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
}
