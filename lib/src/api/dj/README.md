# 电台模块 API 说明文档

## 功能概述
电台模块提供了电台相关的所有接口，包括获取电台节目、分类、订阅等功能。

## API 详细说明

### 获取电台分类
```dart
Future<DjCategoriesWrap> djCateList()
```

### 获取推荐电台
```dart
Future<DjRecommendsWrap> djRecommend({int limit = 30})
```
**参数说明：**
- `limit`: 返回数量限制，默认 30

### 获取电台详情
```dart
Future<DjDetailWrap> djDetail(int rid)
```
**参数说明：**
- `rid`: 电台 ID

### 获取节目详情
```dart
Future<DjProgramWrap> djProgramDetail(int id)
```
**参数说明：**
- `id`: 节目 ID

### 订阅/取消订阅电台
```dart
Future<ServerStatusBean> djSubscribe(
    int rid,
    {required bool subscribe}
)
```
**参数说明：**
- `rid`: 电台 ID
- `subscribe`: true 表示订阅，false 表示取消订阅

### 获取用户订阅的电台
```dart
Future<DjSublistWrap> djSubList(
    {int limit = 30, int offset = 0}
)
```
**参数说明：**
- `limit`: 返回数量限制
- `offset`: 分页偏移量

## 使用示例

```dart
final api = NeteaseMusicApi();

// 获取电台分类
final categories = await api.djCateList();

// 获取推荐电台
final recommends = await api.djRecommend();

// 获取电台详情
final detail = await api.djDetail(336355127);

// 订阅电台
await api.djSubscribe(336355127, subscribe: true);

// 获取订阅的电台列表
final subList = await api.djSubList();
```

## 电台分类说明

常见电台分类：
- 音乐电台
- 情感电台
- 讲故事
- 新闻资讯
- 相声段子
- 知识技能
- 广播剧
- 更多...

## 注意事项

1. 订阅/取消订阅电台需要登录
2. 获取节目内容可能需要 VIP 权限
3. 部分接口有调用频率限制
4. 推荐结果可能因用户收听历史而异
