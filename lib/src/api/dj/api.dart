import 'package:dio/dio.dart';
import 'package:netease_music_api/src/dio_ext.dart';
import 'package:netease_music_api/src/netease_handler.dart';

import 'bean.dart';

mixin ApiDj {
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
