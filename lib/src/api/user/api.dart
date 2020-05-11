import 'package:dio/dio.dart';
import 'package:netease_music_api/src/api/bean.dart';
import 'package:netease_music_api/src/api/dj/bean.dart';
import 'package:netease_music_api/src/api/play/bean.dart';
import 'package:netease_music_api/src/api/user/bean.dart';
import 'package:netease_music_api/src/dio_ext.dart';
import 'package:netease_music_api/src/netease_handler.dart';

mixin ApiUser {
  /// 获取用户详情
  /// !需要登录
  Future<NeteaseUserDetail> userDetail(String userId) {
    return Https.dio
        .postUri(joinUri('/weapi/v1/user/detail/$userId'),
            data: {}, options: joinOptions())
        .then((Response value) {
      return NeteaseUserDetail.fromJson(value.data);
    });
  }

  /// 获取用户信息 , 歌单，收藏，mv, dj 数量
  /// !需要登录
  Future<NeteaseUserSubcount> userSubcount() {
    return Https.dio
        .postUri(joinUri('/weapi/subcount'), data: {}, options: joinOptions())
        .then((Response value) {
      return NeteaseUserSubcount.fromJson(value.data);
    });
  }

  /// 更新用户信息
  /// !需要登录
  /// [gender] 性别 0:保密 1:男性 2:女性 !必须
  /// [birthday] 出生日期,时间戳 unix timestamp !必须
  /// [nickname] 用户昵称 !必须
  /// [province] 省份id !必须
  /// [city] 城市id !必须
  /// [signature] 用户签名 !必须
  /// [avatarImgId] 头像id TODO 整理上传接口
  Future<ServerStatusBean> userUpdateProfile(int gender, int birthday,
      String nickname, int province, int city, String signature,
      {String avatarImgId = '0'}) {
    var params = {
      'avatarImgId': avatarImgId,
      'gender': gender,
      'birthday': birthday,
      'nickname': nickname,
      'province': province,
      'city': city,
      'signature': signature
    };
    return Https.dio
        .postUri(joinUri('/weapi/user/profile/update'),
            data: params, options: joinOptions())
        .then((Response value) {
      return ServerStatusBean.fromJson(value.data);
    });
  }

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

  /// 获取用户关注列表
  /// !需要登录
  Future<UserFollowListWrap> userFollowList(String userId,
      {int offset = 0, int limit = 30, bool order = true}) {
    var params = {'limit': limit, 'offset': offset};
    return Https.dio
        .postUri(joinUri('/weapi/user/getfollows/$userId'),
            data: params, options: joinOptions())
        .then((Response value) {
      return UserFollowListWrap.fromJson(value.data);
    });
  }

  /// 用户签到
  /// !需要登录
  /// [clientType] android web
  /// 0为安卓端签到 3点经验, 1为网页签到,2点经验
  Future<ServerStatusBean> userSign({String clientType = 'android'}) {
    var params = {'type': clientType == 'android' ? 0 : 1};
    return Https.dio
        .postUri(joinUri('/weapi/point/dailyTask'),
            data: params, options: joinOptions())
        .then((Response value) {
      return ServerStatusBean.fromJson(value.data);
    });
  }

  /// 获取用户粉丝列表
  /// !需要登录
  /// [lastTime] 传入上一次返回结果的 lasttime,将会返回下一页的数据,默认-1
  Future<UserFollowedListWrap> userFollowedList(String userId,
      {int limit = 30, int lastTime = -1}) {
    var params = {'userId': userId, 'time': lastTime, 'limit': limit};
    return Https.dio
        .postUri(joinUri('/eapi/user/getfolloweds/$userId'),
            data: params,
            options: joinOptions(
                encryptType: EncryptType.EApi,
                eApiUrl: '/api/user/getfolloweds'))
        .then((Response value) {
      return UserFollowedListWrap.fromJson(value.data);
    });
  }

  /// 关注/取消关注用户
  /// !需要登录
  Future<ServerStatusBean> userFollow(String userId, bool follow) {
    return Https.dio
        .postUri(
            joinUri('/weapi/user/${follow ? 'follow' : 'delfollow'}/$userId'),
            data: {},
            options: joinOptions(cookies: {'os': 'pc'}))
        .then((Response value) {
      return ServerStatusBean.fromJson(value.data);
    });
  }

  /// 收藏/取消收藏歌手
  /// !需要登录
  Future<ServerStatusBean> artistSub(String artistId, bool sub) {
    // 批量?
    var params = {'artistId': artistId, 'artistIds': '[$artistId]'};
    return Https.dio
        .postUri(joinUri('/weapi/artist/${sub ? 'sub' : 'unsub'}'),
            data: params, options: joinOptions())
        .then((Response value) {
      return ServerStatusBean.fromJson(value.data);
    });
  }

  /// 收藏的歌手列表
  /// !需要登录
  Future<ArtistsSubListWrap> artistSubList(
      {bool total = true, int offset = 0, int limit = 30}) {
    var params = {'total': total, 'limit': limit, 'offset': offset};
    return Https.dio
        .postUri(joinUri('/weapi/artist/sublist'),
            data: params, options: joinOptions())
        .then((Response value) {
      return ArtistsSubListWrap.fromJson(value.data);
    });
  }

  /// 订阅与取消电台
  /// !需要登录
  Future<ServerStatusBean> djRadioSub(String djId, bool sub) {
    var params = {'id': djId};
    return Https.dio
        .postUri(joinUri('/weapi/djradio/${sub ? 'sub' : 'unsub'}'),
            data: params, options: joinOptions())
        .then((Response value) {
      return ServerStatusBean.fromJson(value.data);
    });
  }

  /// 收藏的电台列表
  /// !需要登录
  Future<DjRadioListWrap> djRadioSubList(
      {bool total = true, int offset = 0, int limit = 30}) {
    var params = {'total': total, 'limit': limit, 'offset': offset};
    return Https.dio
        .postUri(joinUri('/weapi/djradio/get/subed'),
            data: params, options: joinOptions())
        .then((Response value) {
      return DjRadioListWrap.fromJson(value.data);
    });
  }

  /// 收藏/取消视频
  /// !需要登录
  Future<ServerStatusBean> videoSub(String videoId, bool sub) {
    var params = {'id': videoId};
    return Https.dio
        .postUri(joinUri('/weapi/cloudvideo/video/${sub ? 'sub' : 'unsub'}'),
            data: params, options: joinOptions())
        .then((Response value) {
      return ServerStatusBean.fromJson(value.data);
    });
  }

  /// 收藏/取消收藏 MV
  /// !需要登录
  Future<ServerStatusBean> mvSub(String mvId, bool sub) {
    // 批量?
    var params = {'mvId': mvId, 'mvIds': '[$mvId]'};
    return Https.dio
        .postUri(joinUri('/weapi/mv/${sub ? 'sub' : 'unsub'}'),
            data: params, options: joinOptions())
        .then((Response value) {
      return ServerStatusBean.fromJson(value.data);
    });
  }

  /// 收藏的 MV 列表
  /// !需要登录
  Future<MvSubListWrap> mvSubList(
      {bool total = true, int offset = 0, int limit = 30}) {
    var params = {'total': total, 'limit': limit, 'offset': offset};
    return Https.dio
        .postUri(joinUri('/weapi/cloudvideo/allvideo/sublist'),
            data: params, options: joinOptions())
        .then((Response value) {
      return MvSubListWrap.fromJson(value.data);
    });
  }

  /// 获取用户播放记录
  /// !需要登录
  Future<PlayRecordListWrap> userPlayRecordList(String userId, bool weekData) {
    var params = {
      'uid': userId,
      // 1: 最近一周, 0: 所有时间
      'type': weekData ? '1' : '0'
    };
    return Https.dio
        .postUri(joinUri('/weapi/v1/play/record'),
            data: params, options: joinOptions(cookies: {'os': 'pc'}))
        .then((Response value) {
      return PlayRecordListWrap.fromJson(value.data);
    });
  }

  /// 收藏/取消收藏 歌单
  /// !需要登录
  Future<ServerStatusBean> albumSub(String albumId, bool sub) {
    var params = {'id': albumId};
    return Https.dio
        .postUri(joinUri('/api/album/${sub ? 'sub' : 'unsub'}'),
            data: params, options: joinOptions())
        .then((Response value) {
      return ServerStatusBean.fromJson(value.data);
    });
  }

  /// 收藏的 专辑 列表
  /// !需要登录
  Future<AlbumSubListWrap> albumSubList(
      {bool total = true, int offset = 0, int limit = 30}) {
    var params = {'total': total, 'limit': limit, 'offset': offset};
    return Https.dio
        .postUri(joinUri('/weapi/album/sublist'),
            data: params, options: joinOptions())
        .then((Response value) {
      return AlbumSubListWrap.fromJson(value.data);
    });
  }

  /// 收藏/取消收藏 歌单
  /// !需要登录
  Future<ServerStatusBean> playlistSub(String pid, bool sub) {
    var params = {'id': pid};
    return Https.dio
        .postUri(
            joinUri('/weapi/playlist/${sub ? 'subscribe' : 'unsubscribe'}'),
            data: params,
            options: joinOptions())
        .then((Response value) {
      return ServerStatusBean.fromJson(value.data);
    });
  }

  /// 新建歌单
  /// !需要登录
  /// [name] 歌单名
  /// [privacy] 是否私密
  Future<PlaylistCreateWrap> playlistCreate(String name, bool privacy) {
    var params = {'name': name, 'privacy': privacy ? '10' : '0'};
    return Https.dio
        .postUri(joinUri('/weapi/playlist/create'),
            data: params, options: joinOptions(cookies: {'os': 'pc'}))
        .then((Response value) {
      return PlaylistCreateWrap.fromJson(value.data);
    });
  }

  /// 删除歌单
  /// !需要登录
  Future<ServerStatusBean> playlistDelete(String pid) {
    var params = {'pid': pid};
    return Https.dio
        .postUri(joinUri('/weapi/playlist/delete'),
            data: params, options: joinOptions(cookies: {'os': 'pc'}))
        .then((Response value) {
      return ServerStatusBean.fromJson(value.data);
    });
  }

  /// 收藏单曲到歌单 从歌单删除歌曲
  /// !需要登录
  Future<ServerStatusBean> playlistManipulateTracks(
      String pid, String trackId, bool add) {
    // 批量?
    var params = {
      'op': add ? 'add' : 'del',
      'pid': pid,
      'trackIds': '[$trackId]'
    };
    return Https.dio
        .postUri(joinUri('/weapi/playlist/manipulate/tracks'),
            data: params, options: joinOptions())
        .then((Response value) {
      return ServerStatusBean.fromJson(value.data);
    });
  }

  /// 歌单收藏者
  Future<PlaylistSubscribersWrap> playlistSubscribers(String pid,
      {int offset = 0, int limit = 30}) {
    var params = {'id': pid, 'limit': limit, 'offset': offset};
    return Https.dio
        .postUri(joinUri('/weapi/playlist/subscribers'),
            data: params, options: joinOptions())
        .then((Response value) {
      return PlaylistSubscribersWrap.fromJson(value.data);
    });
  }
}
