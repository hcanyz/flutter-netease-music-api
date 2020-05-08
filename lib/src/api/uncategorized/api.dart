import 'package:dio/dio.dart';
import 'package:netease_music_api/src/api/uncategorized/bean.dart';
import 'package:netease_music_api/src/dio_ext.dart';
import 'package:netease_music_api/src/netease_handler.dart';

mixin ApiUncategorized {
  /// 首页轮播图
  /// [clientType] pc android iphone ipad
  Future<BannerListWrap> homeBannerList({String clientType = 'android'}) {
    var params = {'clientType': clientType};
    return Https.dio
        .postUri(joinUri('/api/v2/banner/get'),
            data: params,
            options: joinOptions(encryptType: EncryptType.LinuxForward))
        .then((Response value) {
      return BannerListWrap.fromJson(value.data);
    });
  }
}
