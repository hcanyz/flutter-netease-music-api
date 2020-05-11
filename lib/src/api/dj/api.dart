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

  /// 电台 - 分类
  Future<DjRadioCategoryWrap> djRadioCategory() {
    return Https.dio
        .postUri(joinUri('/weapi/djradio/category/get'),
            data: {}, options: joinOptions())
        .then((Response value) {
      return DjRadioCategoryWrap.fromJson(value.data);
    });
  }

  /// 电台 - 推荐分类
  Future<DjRadioCategoryWrap2> recommendDjRadioCategory() {
    return Https.dio
        .postUri(joinUri('/weapi/djradio/home/category/recommend'),
            data: {}, options: joinOptions())
        .then((Response value) {
      return DjRadioCategoryWrap2.fromJson(value.data);
    });
  }

  /// 电台 - 非热门分类
  Future<DjRadioCategoryWrap3> excludeHotDjRadioCategory() {
    return Https.dio
        .postUri(joinUri('/weapi/djradio/category/excludehot'),
            data: {}, options: joinOptions())
        .then((Response value) {
      return DjRadioCategoryWrap3.fromJson(value.data);
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

  /// 今日优选电台
  /// Preferred perfered = =
  Future<DjRadioListWrap2> todayPreferredDjRadioList({int page = 0}) {
    var params = {'page': page};
    return Https.dio
        .postUri(joinUri('/weapi/djradio/home/today/perfered'),
            data: params, options: joinOptions())
        .then((Response value) {
      return DjRadioListWrap2.fromJson(value.data);
    });
  }

  /// 精选电台
  Future<DjRadioListWrap> recommendDjRadioList() {
    return Https.dio
        .postUri(joinUri('/weapi/djradio/recommend/v1'),
            data: {}, options: joinOptions())
        .then((Response value) {
      return DjRadioListWrap.fromJson(value.data);
    });
  }

  /// 精选电台(分类)
  Future<DjRadioListWrap> recommendDjRadioListByCategory(String cateId) {
    var params = {'cateId': cateId};
    return Https.dio
        .postUri(joinUri('/weapi/djradio/recommend'),
            data: params, options: joinOptions())
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

  /// 热门电台（类别）
  Future<DjRadioListWrap> hotDjRadioListByCategory(String cateId,
      {int offset = 0, int limit = 30}) {
    var params = {'cateId': cateId, 'limit': limit, 'offset': offset};
    return Https.dio
        .postUri(joinUri('/api/djradio/hot'),
            data: params, options: joinOptions())
        .then((Response value) {
      return DjRadioListWrap.fromJson(value.data);
    });
  }

  /// 新晋电台榜/热门电台榜
  /// [type] 新晋:'new'  热门:'hot'
  Future<DjRadioTopListListWrapX2> djRadioTopList(
      {String type = 'new', int offset = 0, int limit = 100}) {
    var params = {
      'type': type == 'new' ? 0 : 1,
      'limit': limit,
      'offset': offset
    };
    return Https.dio
        .postUri(joinUri('/api/djradio/toplist'),
            data: params, options: joinOptions())
        .then((Response value) {
      return DjRadioTopListListWrapX2.fromJson(value.data);
    });
  }

  /// 电台 - 付费精品电台
  Future<DjRadioTopListListWrapX> djRadioPayTopList({int limit = 100}) {
    var params = {'limit': limit};
    return Https.dio
        .postUri(joinUri('/api/djradio/toplist/pay'),
            data: params, options: joinOptions())
        .then((Response value) {
      return DjRadioTopListListWrapX.fromJson(value.data);
    });
  }

  /// 电台 - 付费精选
  Future<DjRadioTopListListWrapX> djRadioPayGiftTopList(
      {int offset = 0, int limit = 30}) {
    var params = {'limit': limit, 'offset': offset};
    return Https.dio
        .postUri(joinUri('/weapi/djradio/home/paygift/list?_nmclfl=1'),
            data: params, options: joinOptions())
        .then((Response value) {
      return DjRadioTopListListWrapX.fromJson(value.data);
    });
  }

  /// 电台 - 详情
  Future<DjRadioDetail> djRadioDetail(String radioId) {
    var params = {'id': radioId};
    return Https.dio
        .postUri(joinUri('/weapi/djradio/get'),
            data: params, options: joinOptions())
        .then((Response value) {
      return DjRadioDetail.fromJson(value.data);
    });
  }

  /// 电台 - 节目列表
  Future<DjProgramListWrap> djProgramList(String radioId,
      {int offset = 0, int limit = 30, bool asc = true}) {
    var params = {
      'radioId': radioId,
      'limit': limit,
      'offset': offset,
      'asc': asc
    };
    return Https.dio
        .postUri(joinUri('/weapi/dj/program/byradio'),
            data: params, options: joinOptions())
        .then((Response value) {
      return DjProgramListWrap.fromJson(value.data);
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

  /// 节目详情
  Future<DjProgramDetail> djProgramDetail(String programId) {
    var params = {'id': programId};
    return Https.dio
        .postUri(joinUri('/weapi/dj/program/detail'),
            data: params, options: joinOptions())
        .then((Response value) {
      return DjProgramDetail.fromJson(value.data);
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

  /// 电台 - 新人榜
  Future<DjTopListListWrapX> djNewcomerTopList(
      {int offset = 0, int limit = 100}) {
    var params = {'limit': limit, 'offset': offset};
    return Https.dio
        .postUri(joinUri('/api/dj/toplist/newcomer'),
            data: params, options: joinOptions())
        .then((Response value) {
      return DjTopListListWrapX.fromJson(value.data);
    });
  }

  /// 电台 - 最热主播榜
  Future<DjTopListListWrapX> djPopularTopList({int limit = 100}) {
    var params = {'limit': limit};
    return Https.dio
        .postUri(joinUri('/api/dj/toplist/popular'),
            data: params, options: joinOptions())
        .then((Response value) {
      return DjTopListListWrapX.fromJson(value.data);
    });
  }
}
