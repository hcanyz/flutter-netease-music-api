import 'package:flutter_test/flutter_test.dart';
import 'package:netease_music_api/netease_music_api.dart';

import 'test_helper.dart';

void main() async {
  await NeteaseMusicApi.init(provider: MockPathProvider(), debug: true);

  var api = NeteaseMusicApi();

  test('test home bannerList', () async {
    var result = await api.homeBannerList();
    expect(result.code, RET_CODE_OK);
  });

  test('test home block page', () async {
    var result = await api.homeBlockPage();
    expect(result.code, RET_CODE_OK);
  });

  test('test home dragon ball static', () async {
    var result = await api.homeDragonBallStatic();
    expect(result.code, RET_CODE_OK);
  });

  test('test countries code list', () async {
    var result = await api.countriesCodeList();
    expect(result.code, RET_CODE_OK);
  });

  test('test personalized private content x', () async {
    var result = await api.personalizedPrivateContent();
    expect(result.code, RET_CODE_OK);
  });

  test('test personalized private content list', () async {
    var result = await api.personalizedPrivateContentList();
    expect(result.code, RET_CODE_OK);
  });

  test('test toplist x', () async {
    var result = await api.topList();
    expect(result.code, RET_CODE_OK);
  });

  test('test toplist detail', () async {
    var result = await api.topListDetail();
    expect(result.code, RET_CODE_OK);
  });

  test('test batch api', () async {
    var bannerDioMetaData = api.homeBannerListDioMetaData();

    var result = await api.batchApi([bannerDioMetaData]);
    expect(result.code, RET_CODE_OK);

    BannerListWrap bannerListWrap =
        BannerListWrap.fromJson(result.findResponseData(bannerDioMetaData));
    expect(bannerListWrap, isNotNull);
  });
}
