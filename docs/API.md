# Flutter Netease Music API 文档

这是一个完整的网易云音乐 API 封装，提供了全面的接口支持。

## 目录结构说明

```
lib/
├── netease_music_api.dart    # 主入口文件
└── src/                      # 源代码目录
    ├── dio_ext.dart         # Dio 网络请求扩展
    ├── encrypt_ext.dart     # 加密相关扩展
    ├── netease_api.dart     # API 基础类
    ├── netease_bean.dart    # 基础数据模型
    ├── netease_handler.dart # API 处理器
    └── api/                 # API 模块目录
        ├── login/          # 登录相关 API
        ├── play/           # 播放相关 API
        ├── dj/             # 电台相关 API
        ├── event/          # 动态相关 API
        ├── search/         # 搜索相关 API
        ├── user/           # 用户相关 API
        └── uncategorized/  # 其他未分类 API
```

## 快速开始

```dart
// 初始化
final success = await NeteaseMusicApi.init(debug: true);

// 创建实例
final api = NeteaseMusicApi();

// 使用接口
await api.loginCellPhone("手机号", "密码");
```

## 主要功能模块

- 登录注册
- 音乐播放
- 用户信息
- 歌单管理
- 搜索功能
- 电台节目
- 评论互动
- 动态关注

每个模块的详细说明请参考对应目录下的 README.md 文件。
