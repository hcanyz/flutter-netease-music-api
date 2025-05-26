# 搜索模块 API 说明文档

## 功能概述
搜索模块提供了音乐、歌手、专辑、歌单等多维度的搜索功能。

## API 详细说明

### 搜索
```dart
Future<SearchResultWrap> search(
    String keywords,
    {
        SearchType type = SearchType.Single,
        int limit = 30,
        int offset = 0
    }
)
```
**参数说明：**
- `keywords`: 搜索关键词
- `type`: 搜索类型
- `limit`: 返回数量限制
- `offset`: 分页偏移量

### 搜索类型
```dart
enum SearchType {
  Single,      // 单曲
  Album,       // 专辑
  Artist,      // 艺术家
  Playlist,    // 歌单
  User,        // 用户
  Mv,          // MV
  Lyric,       // 歌词
  Radio,       // 电台
  Video,       // 视频
  Complex      // 综合
}
```

### 获取热门搜索关键词
```dart
Future<SearchHotWrap> searchHot()
```

### 获取搜索建议
```dart
Future<SearchSuggestWrap> searchSuggest(
    String keywords,
    {String type = 'mobile'}
)
```
**参数说明：**
- `keywords`: 搜索关键词
- `type`: 设备类型，默认 'mobile'

## 使用示例

```dart
final api = NeteaseMusicApi();

// 搜索单曲
final songs = await api.search(
    '周杰伦',
    type: SearchType.Single
);

// 搜索歌单
final playlists = await api.search(
    '摇滚',
    type: SearchType.Playlist
);

// 获取热门搜索
final hot = await api.searchHot();

// 获取搜索建议
final suggests = await api.searchSuggest('周杰');
```

## 搜索结果说明

根据不同的搜索类型，返回结果包含以下字段：

### 单曲搜索
- 歌曲名称
- 歌手信息
- 专辑信息
- 时长
- 音质信息

### 歌单搜索
- 歌单名称
- 创建者信息
- 封面图片
- 收藏数
- 播放数

### 歌手搜索
- 歌手名称
- 头像
- 专辑数
- MV数

### 专辑搜索
- 专辑名称
- 歌手信息
- 发行时间
- 音乐数量

## 注意事项

1. 搜索结果可能因用户权限不同而异
2. 部分音乐可能因版权限制无法播放
3. 搜索接口有调用频率限制
4. 建议使用分页加载大量数据
5. 某些特殊关键词可能被过滤
