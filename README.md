Netease cloud music api for flutter ,reference https://github.com/Binaryify/NeteaseCloudMusicApi.   

欢迎star、pr、issues

### 使用方法
*如果你想知道更多如何使用这个库，可以参考我的另外一个项目 ~。https://github.com/hcanyz/flutter-zmusic*

添加依赖
```yaml
dependencies:
  netease_music_api:
    git:
      url: git://github.com/hcanyz/flutter-netease-music-api.git
      #url: git://gitee.com/hcanyz/flutter-netease-music-api.git
```
使用

```dart
final success = await NeteaseMusicApi.init(debug: true);
```

```dart
var api = NeteaseMusicApi();
api.useSomeApi

// 登录态变化
var subscription = api.usc.listenLoginState((event, accountInfoWrap) {
    switch (event) {
    case LoginState.Logined:
      //do some
      print(accountInfoWrap);
      break;
    case LoginState.Logout:
      //do some
      break;
    }
});


// dispose
subscription.cancel();
```

### 注意事项
- unit test 需要在test/目录下添加 private_config.dart
    ```dart
    const String login_email = '';
    const String login_email_password = '';
    
    const String login_phone = '';
    const String login_phone_password = '';
    ```
- 本项目仅供学习使用,请尊重版权，请勿利用此项目从事商业行为

### TODO
- [x] 搬运 NeteaseCloudMusicApi库 所有api
- [x] 用户登录数据存储及变化通知
- [x] api bean 数据结构
- [x] api unit test
- [ ] 代码结构优化、模块重新划分
- [ ] 文档
- [ ] 持续同步api...

### errorCode
| code | desc                               |
|------|--------------------                |
| -460 | Cheating                           |
| -2   | 无权限访问                         |
| 200  | ok                                 |
| 201  | 已经取消关注                       |
| 250  | 风险提示                           |
| 301  | 需要登录                           |
| 400  | 请求(参数异常、无效请求、业务相关) |
| 403  | 请求参数异常(无效)                 |
| 404  | 请求的接口不存在                   |
| 501  | 账号不存在                         |
| 503  | 验证码错误                         |
| 405  | 发送验证码间隔过短                 |
| 505  | 更新昵称被占用                     |
| 509  | 密码错误超过限制                   |
| 512  | 未付费歌曲无法收藏                 |

250: 可能是cookie中缺少 'os':'pc'

### flutter version
```text
flutter doctor
Doctor summary (to see all details, run flutter doctor -v):
[√] Flutter (Channel master, 1.25.0-5.0.pre.125, on Microsoft Windows [Version 10.0.18363.1198], locale zh-CN)
[√] Android toolchain - develop for Android devices (Android SDK version 30.0.2)
[√] Chrome - develop for the web
[√] Android Studio (version 4.1.0)
[√] VS Code, 64-bit edition (version 1.51.1)
[√] Connected device (1 available)
```