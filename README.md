Netease cloud music api for flutter ,reference https://github.com/Binaryify/NeteaseCloudMusicApi.   

欢迎star、pull request

### 使用方法
```yaml
dependencies:
  netease_music_api:
    git:
      url: git://github.com/hcanyz/flutter-netease-music-api.git
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
- [ ] 搬运 NeteaseCloudMusicApi 所有api.
- [ ] 完善 api unit test
- [ ] 补齐 api bean 字段
- [ ] 代码结构优化、模块划分
- [ ] 文档

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

250: 可能是cookie中缺少 'os':'pc'

如果你想知道更多如何使用这个库，可以参考我的另外一个项目。https://github.com/hcanyz/flutter-zmusic