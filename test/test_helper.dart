import 'package:mockito/mockito.dart';
import 'package:netease_music_api/netease_music_api.dart';

import 'private_config.dart';

needLogin(NeteaseMusicApi api) async {
  if (api.usc.isLogined) return;

  var result = await api.loginCellPhone(login_phone, login_phone_password);
  if (result.code == RET_CODE_OK) {
    return;
  }
  result = await api.loginEmail(login_email, login_email_password);
  if (result.code == RET_CODE_OK) {
    return;
  }
}

// Mock class
class MockPathProvider extends Mock implements PathProvider {
  @override
  init() {}

  @override
  String getCookieSavedPath() {
    return "./.zmusic/.cookies/";
  }

  @override
  String getDataSavedPath() {
    return "./.zmusic/.data/";
  }
}
