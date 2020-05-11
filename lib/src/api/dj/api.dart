import 'package:dio/dio.dart';
import 'package:netease_music_api/src/api/uncategorized/bean.dart';
import 'package:netease_music_api/src/dio_ext.dart';
import 'package:netease_music_api/src/netease_handler.dart';

import 'bean.dart';

mixin ApiDj {
  /// 电台banner
  Future<BannerListWrap2> djBanner() {
    return Https.dio
        .postUri(joinUri('/weapi/djradio/banner/get'),
            data: {}, options: joinOptions(cookies: {'os': 'pc'}))
        .then((Response value) {
      return BannerListWrap2.fromJson(value.data);
    });
  }

  /// 用户创建的电台
  Future<DjListWrap> userDjList(String userId) {
    var params = {'userId': userId};
    return Https.dio
        .postUri(joinUri('/weapi/djradio/get/byuser'),
            data: params, options: joinOptions(cookies: {'os': 'pc'}))
        .then((Response value) {
      return DjListWrap.fromJson(value.data);
    });
  }

  /// 热门电台
  Future<DjListWrap> hotDjList({int offset = 0, int limit = 30}) {
    var params = {'limit': limit, 'offset': offset};
    return Https.dio
        .postUri(joinUri('/weapi/djradio/hot/v1'),
            data: params, options: joinOptions(cookies: {'os': 'pc'}))
        .then((Response value) {
      return DjListWrap.fromJson(value.data);
    });
  }

  /// 付费精品电台
  Future<DjPayTopListListWrapX> djPayTopList({int limit = 100}) {
    var params = {'limit': limit};
    return Https.dio
        .postUri(joinUri('/api/djradio/toplist/pay'),
            data: params, options: joinOptions())
        .then((Response value) {
      return DjPayTopListListWrapX.fromJson(value.data);
    });
  }

  /// 电台节目排行榜
  /// !需要登录
  Future<DjProgramsTopListListWrap> djProgramsTopList(
      {int offset = 0, int limit = 100}) {
    var params = {'limit': limit, 'offset': offset};
    return Https.dio
        .postUri(joinUri('/api/program/toplist/v1'),
            data: params, options: joinOptions())
        .then((Response value) {
      return DjProgramsTopListListWrap.fromJson(value.data);
    });
  }

  /// 用户电台节目列表
  Future<DjProgramsListWrap> userDjProgramsList(String userId,
      {int offset = 0, int limit = 30}) {
    var params = {'limit': limit, 'offset': offset};
    return Https.dio
        .postUri(joinUri('/weapi/dj/program/$userId'),
            data: params, options: joinOptions())
        .then((Response value) {
      return DjProgramsListWrap.fromJson(value.data);
    });
  }

  /// 推荐电台
  Future<PersonalizedDjListWrap> personalizedDjList() {
    return Https.dio
        .postUri(joinUri('/weapi/personalized/djprogram'),
            data: {}, options: joinOptions())
        .then((Response value) {
      return PersonalizedDjListWrap.fromJson(value.data);
    });
  }

  /// 推荐节目
  Future<DjProgramsListWrap> personalizedDjProgramList(
      {String cateId = '', int offset = 0, int limit = 30}) {
    var params = {'cateId': cateId, 'limit': limit, 'offset': offset};
    return Https.dio
        .postUri(joinUri('/weapi/program/recommend/v1'),
            data: params, options: joinOptions())
        .then((Response value) {
      return DjProgramsListWrap.fromJson(value.data);
    });
  }
}
