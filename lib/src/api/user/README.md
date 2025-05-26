# 用户模块 API 说明文档

## 功能概述
用户模块提供了用户信息管理、关注、动态等相关接口。

## API 详细说明

### 获取用户信息
```dart
Future<UserDetailWrap> userDetail(int uid)
```
**参数说明：**
- `uid`: 用户 ID

### 获取用户动态
```dart
Future<UserEventsWrap> userEvent(
    int uid,
    {int limit = 30, int lasttime = -1}
)
```
**参数说明：**
- `uid`: 用户 ID
- `limit`: 返回数量限制
- `lasttime`: 上一次返回结果的 lasttime，用于分页

### 关注/取消关注用户
```dart
Future<ServerStatusBean> userFollow(
    int uid,
    {required bool follow}
)
```
**参数说明：**
- `uid`: 要关注的用户 ID
- `follow`: true 表示关注，false 表示取消关注

### 获取用户歌单
```dart
Future<UserPlaylistWrap> userPlaylist(
    int uid,
    {int limit = 30, int offset = 0}
)
```
**参数说明：**
- `uid`: 用户 ID
- `limit`: 返回数量限制
- `offset`: 分页偏移量

### 获取用户关注列表
```dart
Future<UserFollowsWrap> userFollows(
    int uid,
    {int limit = 30, int offset = 0}
)
```
**参数说明：**
- `uid`: 用户 ID
- `limit`: 返回数量限制
- `offset`: 分页偏移量

### 获取用户粉丝列表
```dart
Future<UserFollowedsWrap> userFolloweds(
    int uid,
    {int limit = 30, int offset = 0}
)
```

## 使用示例

```dart
final api = NeteaseMusicApi();

// 获取用户信息
final userInfo = await api.userDetail(123456);

// 获取用户动态
final events = await api.userEvent(123456);

// 关注用户
await api.userFollow(123456, follow: true);

// 获取用户歌单
final playlists = await api.userPlaylist(123456);

// 获取用户关注列表
final follows = await api.userFollows(123456);
```

## 用户等级说明

用户等级权限：
- Lv.0: 普通用户
- Lv.1-Lv.10: 逐级提升
- VIP: 付费会员特权

## 注意事项

1. 部分操作需要登录后才能执行
2. 关注用户数量可能有上限
3. 获取用户信息可能因隐私设置而受限
4. 用户动态有时效性限制
5. 获取大量数据时建议使用分页功能
