# 未分类 API 说明文档

## 功能概述
本模块包含了一些不属于其他主要分类的辅助功能接口，如轮播图、榜单、歌单分类等。

## API 详细说明

### 获取轮播图
```dart
Future<BannersWrap> banner({String type = '2'})
```
**参数说明：**
- `type`: 轮播图类型
  - 0: pc
  - 1: android
  - 2: iphone
  - 3: ipad

### 获取榜单
```dart
Future<TopListWrap> topList()
```

### 获取歌单分类
```dart
Future<PlaylistCatlistWrap> playlistCatlist()
```

### 获取每日推荐歌单
```dart
Future<RecommendPlaylistWrap> recommendPlaylist()
```

### 获取私人 FM
```dart
Future<PersonalFmWrap> personalFm()
```

### 获取日推歌曲
```dart
Future<RecommendSongsWrap> recommendSongs()
```

### 喜欢音乐
```dart
Future<ServerStatusBean> likeSong(
    int musicId,
    {bool like = true}
)
```
**参数说明：**
- `musicId`: 音乐 ID
- `like`: true 表示喜欢，false 表示取消喜欢

### 红心歌曲列表
```dart
Future<LikeListWrap> likeList(int uid)
```
**参数说明：**
- `uid`: 用户 ID

## 使用示例

```dart
final api = NeteaseMusicApi();

// 获取轮播图
final banners = await api.banner();

// 获取榜单
final toplist = await api.topList();

// 获取每日推荐歌单
final recommendPlaylists = await api.recommendPlaylist();

// 获取私人 FM
final personalFm = await api.personalFm();

// 喜欢音乐
await api.likeSong(347230);

// 获取红心歌曲列表
final likeList = await api.likeList(123456);
```

## 榜单说明

网易云音乐提供多种榜单：
- 飙升榜
- 新歌榜
- 原创榜
- 热歌榜
- 云音乐电音榜
- 等等...

## 歌单分类说明

歌单分类包括：
- 语种（华语、欧美、日语、韩语等）
- 风格（流行、摇滚、民谣、电子等）
- 场景（清晨、夜晚、学习、工作等）
- 情感（怀旧、浪漫、伤感、治愈等）
- 主题（ACG、影视原声、游戏等）

## 注意事项

1. 部分接口需要登录才能使用
2. 每日推荐歌单和歌曲在每天 6:00 更新
3. 私人 FM 需要用户有一定的听歌记录
4. 部分接口可能有调用频率限制
5. 榜单数据定期更新
6. 获取推荐内容可能需要用户有一定的使用记录
