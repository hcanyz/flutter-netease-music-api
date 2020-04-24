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
    return Https.dio
        .postUri(joinUri('/weapi/user/profile/update'),
            data: {
              'avatarImgId': avatarImgId,
              'gender': gender,
              'birthday': birthday,
              'nickname': nickname,
              'province': province,
              'city': city,
              'signature': signature
            },
            options: joinOptions())
        .then((Response value) {
      return ServerStatusBean.fromJson(value.data);
    });
  }
}
