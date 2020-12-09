import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:netease_music_api/src/api/bean.dart';
import 'package:netease_music_api/src/api/uncategorized/bean.dart';
import 'package:netease_music_api/src/dio_ext.dart';
import 'package:netease_music_api/src/netease_handler.dart';

mixin ApiUncategorized {
  DioMetaData homeBannerListDioMetaData({String clientType = 'android'}) {
    var params = {'clientType': clientType};
    return DioMetaData(joinUri('/api/v2/banner/get'),
        data: params,
        options: joinOptions(encryptType: EncryptType.LinuxForward));
  }

  /// 首页轮播图
  /// [clientType] pc android iphone ipad
  Future<BannerListWrap> homeBannerList({String clientType = 'android'}) {
    return Https.dioProxy
        .postUri(homeBannerListDioMetaData(clientType: clientType))
        .then((Response value) {
      return BannerListWrap.fromJson(value.data);
    });
  }

  DioMetaData homeBlockPageDioMetaData({bool refresh = true}) {
    var params = {"refresh": refresh};
    return DioMetaData(joinUri('/api/homepage/block/page'),
        data: params, options: joinOptions());
  }

  /// 首页-发现 block page
  Future<HomeBlockPageWrap> homeBlockPage({bool refresh = true}) {
    return Https.dioProxy
        .postUri(homeBlockPageDioMetaData(refresh: refresh))
        .then((Response value) {
      return HomeBlockPageWrap.fromJson(value.data);
    });
  }

  DioMetaData homeDragonBallStaticDioMetaData() {
    return DioMetaData(joinUri('/api/homepage/dragon/ball/static'),
        data: {},
        options: joinOptions(
            eApiUrl: '/api/homepage/dragon/ball/static',
            encryptType: EncryptType.EApi));
  }

  /// 首页-发现 dragon ball
  /// !需要登录或者匿名登录
  Future<HomeDragonBallWrap> homeDragonBallStatic() {
    return Https.dioProxy
        .postUri(homeDragonBallStaticDioMetaData())
        .then((Response value) {
      return HomeDragonBallWrap.fromJson(value.data);
    });
  }

  DioMetaData countriesCodeListDioMetaData() {
    return DioMetaData(
        Uri.parse('http://interface3.music.163.com/eapi/lbs/countries/v1'),
        data: {},
        options: joinOptions(
            encryptType: EncryptType.EApi, eApiUrl: '/api/lbs/countries/v1'));
  }

  /// 国家编码列表
  Future<CountriesCodeListWrap> countriesCodeList() {
    return Https.dioProxy
        .postUri(countriesCodeListDioMetaData())
        .then((Response value) {
      return CountriesCodeListWrap.fromJson(value.data);
    });
  }

  DioMetaData personalizedPrivateContentDioMetaData() {
    return DioMetaData(joinUri('/weapi/personalized/privatecontent'),
        data: {}, options: joinOptions());
  }

  /// 独家放送推荐
  Future<PersonalizedPrivateContentListWrap> personalizedPrivateContent() {
    return Https.dioProxy
        .postUri(personalizedPrivateContentDioMetaData())
        .then((Response value) {
      return PersonalizedPrivateContentListWrap.fromJson(value.data);
    });
  }

  DioMetaData personalizedPrivateContentListDioMetaData(
      {int offset = 0, int limit = 60, bool total = true}) {
    var params = {'total': total, 'limit': limit, 'offset': offset};
    return DioMetaData(joinUri('/api/v2/privatecontent/list'),
        data: params, options: joinOptions());
  }

  /// 独家放送列表
  Future<PersonalizedPrivateContentListWrap> personalizedPrivateContentList(
      {int offset = 0, int limit = 60, bool total = true}) {
    return Https.dioProxy
        .postUri(personalizedPrivateContentListDioMetaData(
            offset: offset, limit: limit, total: total))
        .then((Response value) {
      return PersonalizedPrivateContentListWrap.fromJson(value.data);
    });
  }

  DioMetaData topListDioMetaData() {
    return DioMetaData(joinUri('/api/toplist'),
        data: {}, options: joinOptions(encryptType: EncryptType.LinuxForward));
  }

  /// 所有榜单内容摘要
  Future<TopListWrap> topList() {
    return Https.dioProxy.postUri(topListDioMetaData()).then((Response value) {
      return TopListWrap.fromJson(value.data);
    });
  }

  DioMetaData topListDetailDioMetaData() {
    return DioMetaData(joinUri('/weapi/toplist/detail'),
        data: {}, options: joinOptions());
  }

  /// 所有榜单详情
  Future<TopListDetailWrap> topListDetail() {
    return Https.dioProxy
        .postUri(topListDetailDioMetaData())
        .then((Response value) {
      return TopListDetailWrap.fromJson(value.data);
    });
  }

  /// 申请图片空间
  DioMetaData uploadImageAllocDioMetaData(String fileName) {
    var params = {
      'bucket': 'yyimgs',
      'ext': 'jpg',
      'filename': fileName,
      'local': false,
      'nos_product': 0,
      'return_body': '{"code": 200, "size": "\$(ObjectSize)"}',
      'type': 'other',
    };
    return DioMetaData(joinUri('/weapi/nos/token/alloc'),
        data: params, options: joinOptions());
  }

  /// 生成最终图片地址
  DioMetaData uploadImageResultDioMetaData(docId,
      {int imgSize = 300, int imgX = 0, int imgY = 0}) {
    return DioMetaData(
        joinUri(
            '/upload/img/op?id=$docId&op=${imgX}y${imgY}y${imgSize}y$imgSize'),
        data: {},
        options: joinOptions());
  }

  /// 图片上传
  /// !需要登录
  Future<UploadImageResult> uploadImage(String path,
      {int imgSize = 300, int imgX = 0, int imgY = 0}) async {
    String fileName = path.split('/').last;

    var res = await Https.dioProxy
        .postUri(uploadImageAllocDioMetaData(fileName))
        .then((Response value) {
      return UploadImageAllocWrap.fromJson(value.data);
    });

    var formData = File(path).openRead();

    await Https.dio.post(
        "https://nosup-hz1.127.net/yyimgs/${res.result.objectKey}?offset=0&complete=true&version=1.0",
        data: formData,
        options: Options(
            contentType: 'image/jpeg',
            headers: {'x-nos-token': res.result.token}));

    return Https.dioProxy
        .postUri(uploadImageResultDioMetaData(res.result.docId,
            imgSize: imgSize, imgX: imgX, imgY: imgY))
        .then((Response value) {
      return UploadImageResult.fromJson(value.data);
    });
  }

  DioMetaData batchApiDioMetaData(List<DioMetaData> dioMetaDatas) {
    Map<String, dynamic> params = {};
    dioMetaDatas.forEach((element) {
      params[element.uri.path] = jsonEncode(element.data);
    });
    return DioMetaData(joinUri('/eapi/batch'),
        data: params,
        options:
            joinOptions(encryptType: EncryptType.EApi, eApiUrl: '/api/batch'));
  }

  /// batch批量请求接口
  /// 登陆后调用此接口 ,传入接口和对应原始参数(原始参数非文档里写的参数,需参考源码),可批量请求接口
  Future<BatchApiWrap> batchApi(List<DioMetaData> dioMetaDatas) {
    return Https.dioProxy
        .postUri(batchApiDioMetaData(dioMetaDatas))
        .then((Response value) {
      return BatchApiWrap.fromJson(value.data);
    });
  }

  DioMetaData weblogDioMetaData(
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
    return DioMetaData(joinUri('/weapi/feedback/weblog'),
        data: params, options: joinOptions());
  }

  /// 操作记录
  /// [action] 'play'
  Future<ServerStatusBean> weblog(
      String id, String sourceId, String action, String type, String end,
      {int download = 0, int wifi = 0, int time = 0}) {
    return Https.dioProxy
        .postUri(weblogDioMetaData(id, sourceId, action, type, end,
            download: download, wifi: wifi, time: time))
        .then((Response value) {
      return ServerStatusBean.fromJson(value.data);
    });
  }
}
