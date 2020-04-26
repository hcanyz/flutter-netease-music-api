import 'package:dio/dio.dart';
import 'package:netease_music_api/src/api/bean.dart';
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

  /// 收藏视频
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
}
