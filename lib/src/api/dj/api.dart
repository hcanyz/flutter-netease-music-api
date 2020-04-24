import 'package:dio/dio.dart';
import 'package:netease_music_api/src/dio_ext.dart';
import 'package:netease_music_api/src/netease_handler.dart';

import 'bean.dart';

mixin ApiDjList {
  Future<DjListWrap> userDjList(String userId, int page, {int limit = 30}) {
    var params = {'limit': limit, 'offset': page * limit};
    return Https.dio
        .postUri(joinUri('/weapi/dj/program/$userId'),
            data: params, options: joinOptions())
        .then((Response value) {
      return DjListWrap.fromJson(value.data);
    });
  }
}
