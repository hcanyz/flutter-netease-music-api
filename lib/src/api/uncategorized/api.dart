import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:netease_music_api/src/api/bean.dart';
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

  /// 独家放送
  Future<PersonalizedPrivateContentListWrap> personalizedPrivateContent() {
    return Https.dio
        .postUri(joinUri('/weapi/personalized/privatecontent'),
            data: {}, options: joinOptions())
        .then((Response value) {
      return PersonalizedPrivateContentListWrap.fromJson(value.data);
    });
  }

  /// 所有榜单内容摘要
  Future<TopListWrap> topList() {
    return Https.dio
        .postUri(joinUri('/weapi/toplist'),
            data: {},
            options: joinOptions(encryptType: EncryptType.LinuxForward))
        .then((Response value) {
      return TopListWrap.fromJson(value.data);
    });
  }

  /// 所有榜单详情
  Future<TopListDetailWrap> topListDetail() {
    return Https.dio
        .postUri(joinUri('/weapi/toplist/detail'),
            data: {}, options: joinOptions())
        .then((Response value) {
      return TopListDetailWrap.fromJson(value.data);
    });
  }

  /// 操作记录
  /// [action] 'play'
  Future<ServerStatusBean> weblog(
      String id, String sourceId, String action, String type, String end,
      {int download = 0, int wifi = 0, int time = 0}) {
    var params = {
      'logs': jsonEncode([
        {
          'action': action,
          'json': {
            'download': download,
            'end': end,
            'id': id,
            'sourceId': sourceId,
            'time': time,
            'type': type,
            'wifi': wifi,
          }
        }
      ])
    };
    return Https.dio
        .postUri(joinUri('/weapi/feedback/weblog'),
            data: params, options: joinOptions())
        .then((Response value) {
      return ServerStatusBean.fromJson(value.data);
    });
  }
}
