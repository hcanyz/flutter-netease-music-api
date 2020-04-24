import 'package:dio/dio.dart';
import 'package:netease_music_api/src/api/user/bean.dart';
import 'package:netease_music_api/src/dio_ext.dart';
import 'package:netease_music_api/src/netease_handler.dart';

mixin ApiUser {
  /// 获取用户详情
  Future<NeteaseUserDetail> userDetail(String userId) {
    return Https.dio
        .postUri(joinUri('/weapi/v1/user/detail/$userId'),
            data: {}, options: joinOptions())
        .then((Response value) {
      return NeteaseUserDetail.fromJson(value.data);
    });
  }

  /// 获取用户信息 , 歌单，收藏，mv, dj 数量
  Future<NeteaseUserSubcount> userSubcount() {
    return Https.dio
        .postUri(joinUri('/weapi/subcount'), data: {}, options: joinOptions())
        .then((Response value) {
      return NeteaseUserSubcount.fromJson(value.data);
    });
  }
}
