import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:netease_music_api/src/dio_ext.dart';
import 'package:netease_music_api/src/netease_handler.dart';

import 'bean.dart';

mixin ApiPlayList {
  Future<HighqualityPlayListWrap> highqualityPlayList(int page,
      {int limit = 30}) {
    var params = {'limit': limit, 'offset': page * limit};
    return Https.dio
        .postUri(joinUri('/weapi/playlist/highquality/list'),
            data: params, options: joinOptions())
        .then((Response value) {
      return HighqualityPlayListWrap.fromJson(jsonDecode(value.data));
    });
  }

  Future<CategoryPlayListWrap> categoryPlayList(String categoryId, int page,
      {int limit = 30}) {
    var params = {'id': categoryId, 'limit': limit, 'offset': page * limit};
    return Https.dio
        .postUri(joinUri('/weapi/v3/playlist/detail'),
            data: params, options: joinOptions())
        .then((Response value) {
      return CategoryPlayListWrap.fromJson(jsonDecode(value.data));
    });
  }

  Future<CategoryPlayListWrap> recommendPlayList(int page, {int limit = 30}) {
    //TODO need login
    var params = {'limit': limit, 'offset': page * limit};
    return Https.dio
        .postUri(joinUri('/weapi/v1/discovery/recommend/songs'),
            data: params, options: joinOptions())
        .then((Response value) {
      return CategoryPlayListWrap.fromJson(jsonDecode(value.data));
    });
  }
}
