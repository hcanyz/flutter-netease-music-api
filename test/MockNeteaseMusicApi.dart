import 'package:mockito/mockito.dart';
import 'package:netease_music_api/netease_music_api.dart';

// Mock class
class MockCookiePathProvider extends Mock implements CookiePathProvider {
  @override
  Future<String> getCookieSavedPath() async {
    return "./.cookies/";
  }
}
