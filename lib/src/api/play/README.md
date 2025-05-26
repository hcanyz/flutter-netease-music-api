# 播放模块 API 说明文档

## 功能概述
播放模块提供了音乐播放相关的所有接口，包括获取音乐 URL、歌词、音质选择等功能。

## API 详细说明

### 获取音乐 URL
```dart
Future<SongUrlsWrap> songUrl(
    List<int> ids, 
    {int br = 999000}
)
```
**参数说明：**
- `ids`: 歌曲 ID 列表
- `br`: 音质比特率，默认 999000 (最高音质)

### 获取歌词
```dart
Future<LyricWrap> lyric(int id)
```
**参数说明：**
- `id`: 歌曲 ID

### 歌曲详情
```dart
Future<SongsWrap> songDetail(List<int> ids)
```
**参数说明：**
- `ids`: 歌曲 ID 列表

### 心动模式/智能播放
```dart
Future<SongsWrap> intelligenceList(
    int id,
    int pid,
    {int sid = 0}
)
```
**参数说明：**
- `id`: 歌曲 ID
- `pid`: 歌单 ID
- `sid`: 要开始播放的歌曲 ID

## 使用示例

```dart
final api = NeteaseMusicApi();

// 获取歌曲 URL
final songUrls = await api.songUrl([347230]);

// 获取歌词
final lyric = await api.lyric(347230);

// 获取歌曲详情
final songDetails = await api.songDetail([347230]);

// 使用心动模式
final playlist = await api.intelligenceList(347230, 60198);
```

## 音质说明

可用音质比特率：
- 128000: 标准音质
- 320000: 高音质
- 999000: 无损音质

## 注意事项

1. 部分音乐可能因版权限制无法获取播放 URL
2. 获取音乐 URL 接口有频率限制
3. 部分音质可能需要 VIP 权限
4. 智能播放功能需要登录后使用
