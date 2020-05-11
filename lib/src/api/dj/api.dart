import 'package:dio/dio.dart';
import 'package:netease_music_api/src/api/uncategorized/bean.dart';
import 'package:netease_music_api/src/dio_ext.dart';
import 'package:netease_music_api/src/netease_handler.dart';

import 'bean.dart';

mixin ApiDj {
  /// 电台banner
  Future<BannerListWrap2> djRadioBanner() {
    return Https.dio
        .postUri(joinUri('/weapi/djradio/banner/get'),
            data: {}, options: joinOptions(cookies: {'os': 'pc'}))
        .then((Response value) {
      return BannerListWrap2.fromJson(value.data);
    });
  }

  /// 用户创建的电台
  Future<DjRadioListWrap> userDjRadioList(String userId) {
    var params = {'userId': userId};
    return Https.dio
        .postUri(joinUri('/weapi/djradio/get/byuser'),
            data: params, options: joinOptions(cookies: {'os': 'pc'}))
        .then((Response value) {
      return DjRadioListWrap.fromJson(value.data);
    });
  }

  /// 热门电台
  Future<DjRadioListWrap> hotDjRadioList({int offset = 0, int limit = 30}) {
    var params = {'limit': limit, 'offset': offset};
    return Https.dio
        .postUri(joinUri('/weapi/djradio/hot/v1'),
            data: params, options: joinOptions(cookies: {'os': 'pc'}))
        .then((Response value) {
      return DjRadioListWrap.fromJson(value.data);
    });
  }

  /// 付费精品电台
  Future<DjRadioTopListListWrapX> djRadioPayTopList({int limit = 100}) {
    var params = {'limit': limit};
    return Https.dio
        .postUri(joinUri('/api/djradio/toplist/pay'),
            data: params, options: joinOptions())
        .then((Response value) {
      return DjRadioTopListListWrapX.fromJson(value.data);
    });
  }

  /// 电台 - 24小时主播榜
  Future<DjTopListListWrapX> djHoursTopList({int limit = 100}) {
    var params = {'limit': limit};
    return Https.dio
        .postUri(joinUri('/api/dj/toplist/hours'),
            data: params, options: joinOptions())
        .then((Response value) {
      return DjTopListListWrapX.fromJson(value.data);
    });
  }

  /// 电台 - 24小时节目榜
  Future<DjProgramTopListListWrapX> djProgramHoursTopList({int limit = 100}) {
    var params = {'limit': limit};
    return Https.dio
        .postUri(joinUri('/api/djprogram/toplist/hours'),
            data: params, options: joinOptions())
        .then((Response value) {
      return DjProgramTopListListWrapX.fromJson(value.data);
    });
  }

  /// 用户电台节目列表
  Future<DjProgramListWrap> userDjProgramsList(String userId,
      {int offset = 0, int limit = 30}) {
    var params = {'limit': limit, 'offset': offset};
    return Https.dio
        .postUri(joinUri('/weapi/dj/program/$userId'),
            data: params, options: joinOptions())
        .then((Response value) {
      return DjProgramListWrap.fromJson(value.data);
    });
  }

  /// 电台节目排行榜
  /// !需要登录
  Future<DjProgramTopListListWrap2> djProgramsTopList(
      {int offset = 0, int limit = 100}) {
    var params = {'limit': limit, 'offset': offset};
    return Https.dio
        .postUri(joinUri('/api/program/toplist/v1'),
            data: params, options: joinOptions())
        .then((Response value) {
      return DjProgramTopListListWrap2.fromJson(value.data);
    });
  }

  /// 推荐电台节目
  Future<PersonalizedDjProgramListWrap> personalizedProgramDjList() {
    return Https.dio
        .postUri(joinUri('/weapi/personalized/djprogram'),
            data: {}, options: joinOptions())
        .then((Response value) {
      return PersonalizedDjProgramListWrap.fromJson(value.data);
    });
  }

  /// 推荐节目
  Future<DjProgramListWrap> recommendDjProgramList(
      {String cateId = '', int offset = 0, int limit = 30}) {
    var params = {'cateId': cateId, 'limit': limit, 'offset': offset};
    return Https.dio
        .postUri(joinUri('/weapi/program/recommend/v1'),
            data: params, options: joinOptions())
        .then((Response value) {
      return DjProgramListWrap.fromJson(value.data);
    });
  }
}
