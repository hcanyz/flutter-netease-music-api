# 动态模块 API 说明文档

## 功能概述
动态模块提供了用户动态、评论、转发等社交互动相关的接口。

## API 详细说明

### 获取动态
```dart
Future<EventsWrap> event(
    {int pagesize = 20, int lasttime = -1}
)
```
**参数说明：**
- `pagesize`: 每页返回的动态数量
- `lasttime`: 上次返回结果的 lasttime，用于分页

### 发送/转发动态
```dart
Future<ServerStatusBean> eventSend(
    String msg,
    {
        int type = 1,
        String pics = '',
        dynamic json = const {}
    }
)
```
**参数说明：**
- `msg`: 动态内容
- `type`: 动态类型 (1: 发送动态, 2: 转发动态)
- `pics`: 图片地址，多个用逗号分隔
- `json`: 转发动态时的扩展信息

### 删除动态
```dart
Future<ServerStatusBean> eventDel(int evId)
```
**参数说明：**
- `evId`: 动态 ID

### 获取动态评论
```dart
Future<CommentsWrap> eventComment(
    int threadId,
    {int limit = 20, int offset = 0}
)
```
**参数说明：**
- `threadId`: 动态 ID
- `limit`: 返回数量限制
- `offset`: 分页偏移量

### 点赞动态
```dart
Future<ServerStatusBean> resourceLike(
    int threadId,
    ResourceType type,
    {required bool like}
)
```
**参数说明：**
- `threadId`: 动态 ID
- `type`: 资源类型 (ResourceType.Event)
- `like`: true 表示点赞，false 表示取消点赞

## 使用示例

```dart
final api = NeteaseMusicApi();

// 获取动态
final events = await api.event();

// 发送动态
await api.eventSend('分享一首好歌！', pics: 'http://example.com/pic.jpg');

// 转发动态
await api.eventSend(
    '转发的理由',
    type: 2,
    json: {'eventId': '12345'}
);

// 获取动态评论
final comments = await api.eventComment(12345);

// 点赞动态
await api.resourceLike(
    12345,
    ResourceType.Event,
    like: true
);
```

## 动态类型说明

动态可以包含以下类型的内容：
- 文字
- 图片
- 音乐分享
- 视频分享
- 电台节目
- 歌单
- 专辑
- 转发的其他动态

## 注意事项

1. 发送动态需要登录
2. 图片上传需要单独调用图片上传接口
3. 动态内容有字数限制
4. 转发动态时需要正确设置 json 参数
5. 获取动态时建议使用分页加载
6. 部分内容可能因权限设置而不可见
7. 动态评论同样支持点赞和回复功能
