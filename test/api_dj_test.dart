import 'package:flutter_test/flutter_test.dart';
import 'package:netease_music_api/netease_music_api.dart';

import 'test_helper.dart';

void main() async {
  await NeteaseMusicApi.init(provider: MockPathProvider(), debug: true);

  var api = NeteaseMusicApi();

  const defaultUserId = '3375937';

  test('test_dj_radio_banner', () async {
    var result = await api.djRadioBanner();
    expect(result.code, RET_CODE_OK);
  });

  test('test_dj_radio_category', () async {
    var result = await api.djRadioCategory();
    expect(result.code, RET_CODE_OK);
  });

  test('test_recommend_dj_radio_category', () async {
    var result = await api.recommendDjRadioCategory();
    expect(result.code, RET_CODE_OK);
  });

  test('test_exclude_hot_dj_radio_category', () async {
    var result = await api.excludeHotDjRadioCategory();
    expect(result.code, RET_CODE_OK);
  });

  test('test_user_dj_radio_list', () async {
    var result = await api.userDjRadioList(defaultUserId);
    expect(result.code, RET_CODE_OK);
  });

  test('test_today_preferred_dj_radio_list', () async {
    var result = await api.todayPreferredDjRadioList();
    expect(result.code, RET_CODE_OK);
  });

  test('test_recommend_dj_radio_list', () async {
    var result = await api.recommendDjRadioList();
    expect(result.code, RET_CODE_OK);
  });

  test('test_recommend_dj_radio_list_by_category', () async {
    var result = await api.excludeHotDjRadioCategory();
    expect(result.code, RET_CODE_OK);

    if (result.data.isEmpty) {
      return;
    }

    var result2 = await api.recommendDjRadioListByCategory(result.data[0].id);
    expect(result2.code, RET_CODE_OK);
  });

  test('test_hot_dj_radio_list', () async {
    var result = await api.hotDjRadioList();
    expect(result.code, RET_CODE_OK);
  });

  test('test_hot_category_dj_radio_list', () async {
    var result = await api.djRadioCategory();
    expect(result.code, RET_CODE_OK);

    if (result.categories.isEmpty) {
      return;
    }

    var result2 = await api.hotDjRadioListByCategory(result.categories[0].id);
    expect(result2.code, RET_CODE_OK);
  });

  test('test_dj_radio_top_list', () async {
    var result = await api.djRadioTopList();
    expect(result.code, RET_CODE_OK);
  });

  test('test_dj_radio_personalize', () async {
    var result = await api.djRadioPersonalize();
    expect(result.code, RET_CODE_OK);
  });

  test('test_pay_dj_radio_top_list', () async {
    var result = await api.djRadioPayTopList();
    expect(result.code, RET_CODE_OK);
  });

  test('test_pay_gift_dj_radio_top_list', () async {
    var result = await api.djRadioPayGiftTopList();
    expect(result.code, RET_CODE_OK);
  });

  test('test_dj_detail', () async {
    var result = await api.djRadioDetail('526230592');
    expect(result.code, RET_CODE_OK);
  });

  test('test_dj_program_list', () async {
    var result = await api.djProgramList('526230592');
    expect(result.code, RET_CODE_OK);
  });

  test('test_dj_program_hours_top_list', () async {
    var result = await api.djProgramHoursTopList();
    expect(result.code, RET_CODE_OK);
  });

  test('test_user_dj_programs_list', () async {
    var result = await api
        .userDjProgramsList(api.usc.accountInfo?.account.id ?? defaultUserId);
    expect(result.code, RET_CODE_OK);
  });

  test('test_dj_program_top_list', () async {
    var result = await api.djProgramsTopList();
    expect(result.code, RET_CODE_OK);
  });

  test('test_personalized_dj_program_list', () async {
    var result = await api.personalizedProgramDjList();
    expect(result.code, RET_CODE_OK);
  });

  test('test_personalized_dj_program_list', () async {
    var result = await api.recommendDjProgramList();
    expect(result.code, RET_CODE_OK);
  });

  test('test_dj_program_detail', () async {
    var result = await api.djProgramDetail('8368032');
    expect(result.code, RET_CODE_OK);
  });

  test('test_dj_hours_top_list', () async {
    var result = await api.djHoursTopList();
    expect(result.code, RET_CODE_OK);
  });

  test('test_dj_newcomer_top_list', () async {
    var result = await api.djNewcomerTopList();
    expect(result.code, RET_CODE_OK);
  });

  test('test_dj_popular_top_list', () async {
    var result = await api.djPopularTopList();
    expect(result.code, RET_CODE_OK);
  });
}
