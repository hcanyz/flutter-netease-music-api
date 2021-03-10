import 'package:flutter_test/flutter_test.dart';
import 'package:netease_music_api/netease_music_api.dart';

import 'test_helper.dart';

void main() async {
  await NeteaseMusicApi.init(provider: MockPathProvider(), debug: true);

  var api = NeteaseMusicApi();

  test('test_home_bannerList', () async {
    var result = await api.homeBannerList();
    expect(result.code, RET_CODE_OK);
  });

  test('test_home_block_page', () async {
    var result = await api.homeBlockPage();
    expect(result.code, RET_CODE_OK);
  });

  test('test_home_dragon_ball_static', () async {
    var result = await api.homeDragonBallStatic();
    expect(result.code, RET_CODE_OK);
  });

  test('test_countries_code_list', () async {
    var result = await api.countriesCodeList();
    expect(result.code, RET_CODE_OK);
  });

  test('test_personalized_private_content', () async {
    var result = await api.personalizedPrivateContent();
    expect(result.code, RET_CODE_OK);
  });

  test('test_personalized_private_content_list', () async {
    var result = await api.personalizedPrivateContentList();
    expect(result.code, RET_CODE_OK);
  });

  test('test_toplist', () async {
    var result = await api.topList();
    expect(result.code, RET_CODE_OK);
  });

  test('test_toplist_detail', () async {
    var result = await api.topListDetail();
    expect(result.code, RET_CODE_OK);
  });

  test('test_mcalendar_detail', () async {
    var result = await api.mcalendarDetail();
    expect(result.code, RET_CODE_OK);
  });

  test('test_audio_match', () async {
    var result = await api.audioMatch();
    expect(result.code, RET_CODE_OK);
  });

  test('test_upload_image', () async {
    await needLogin(api);

    var result = await api.uploadImage('./test/raw/z.png');

    expect(result.code, RET_CODE_OK);
    expect(result.url, isNotNull);
  });

  test('test_upload_song', () async {
    await needLogin(api);

    var result = await api.uploadSong('./test/raw/z.png');

    expect(result, isNotNull);
  });

  test('test_batch_api', () async {
    var bannerDioMetaData = api.homeBannerListDioMetaData();

    var result = await api.batchApi([bannerDioMetaData]);
    expect(result.code, RET_CODE_OK);

    BannerListWrap bannerListWrap =
        BannerListWrap.fromJson(result.findResponseData(bannerDioMetaData));
    expect(bannerListWrap, isNotNull);
  });
}
