# netease_music_api

Netease cloud music api for flutter ,reference https://github.com/Binaryify/NeteaseCloudMusicApi. 

### 注意事项
- 测试登录，需要在test/目录下添加 private_config.dart
    ```dart
    const String login_email = '';
    const String login_email_password = '';
    
    const String login_phone = '';
    const String login_phone_password = '';
    ```

### errorCode
| code | desc         |
|------|--------------|
| 400  | 请求参数异常 |


如果你想知道更多如何使用这个库，可以参考我的另外一个项目。https://github.com/hcanyz/flutter-zmusic