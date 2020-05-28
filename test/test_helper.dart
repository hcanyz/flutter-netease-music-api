import 'package:mockito/mockito.dart';
import 'package:netease_music_api/netease_music_api.dart';

import 'private_config.dart';

needLogin(NeteaseMusicApi api) async {
  if (api.usc.isLogined) return;
  try {
    var result = await api.loginCellPhone(login_phone, login_phone_password);
    if (result.code == RET_CODE_OK) {
      return;
    }
    result = await api.loginEmail(login_email, login_email_password);
    if (result.code == RET_CODE_OK) {
      return;
    }
  } catch (e) {
    //前置条件允许出错
  }
}

// Mock class
class MockPathProvider extends Mock implements PathProvider {
  @override
  String getCookieSavedPath() {
    return "./.zmusic/.cookies/";
  }

  @override
  String getDataSavedPath() {
    return "./.zmusic/.data/";
  }
}
