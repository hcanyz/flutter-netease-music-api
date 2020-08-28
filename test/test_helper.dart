import 'package:mockito/mockito.dart';
import 'package:netease_music_api/netease_music_api.dart';

import 'private_config.dart';

needLogin(NeteaseMusicApi api) async {
  if (api.usc.isLogined) return;

  if (login_phone.isNotEmpty && login_phone_password.isNotEmpty) {
    var result = await api.loginCellPhone(login_phone, login_phone_password);
    if (result.code == RET_CODE_OK) {
      return;
    }
  }
  if (login_email.isNotEmpty && login_email_password.isNotEmpty) {
    var result = await api.loginEmail(login_email, login_email_password);
    if (result.code == RET_CODE_OK) {
      return;
    }
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
