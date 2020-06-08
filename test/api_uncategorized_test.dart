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

  test('test toplist detail', () async {
    var result = await api.batchApi({
      '/api/v2/banner/get': r'{"clientType": "pc"}',
      '/api/user/setting': ''
    });
    expect(result, isNotNull);
  });
}
