// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayListItem _$PlayListItemFromJson(Map<String, dynamic> json) {
  return PlayListItem()
    ..id = _dynamicToString(json['id'])
    ..name = json['name'] as String
    ..description = json['description'] as String
    ..coverImgUrl = json['coverImgUrl'] as String
    ..tag = json['tag'] as String
    ..tags = (json['tags'] as List)?.map((e) => e as String)?.toList()
    ..copywriter = json['copywriter'] as String
    ..createTime = json['createTime'] as int
    ..updateTime = json['updateTime'] as int
    ..playCount = json['playCount'] as int
    ..subscribedCount = json['subscribedCount'] as int
    ..shareCount = json['shareCount'] as int
    ..commentCount = json['commentCount'] as int
    ..trackCount = json['trackCount'] as int
    ..trackNumberUpdateTime = json['trackNumberUpdateTime'] as int
    ..creator = json['creator'] == null
        ? null
        : PlayListCreator.fromJson(json['creator'] as Map<String, dynamic>)
    ..subscribers = (json['subscribers'] as List)
        ?.map((e) => e == null
            ? null
            : PlayListSubscriber.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$PlayListItemToJson(PlayListItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'coverImgUrl': instance.coverImgUrl,
      'tag': instance.tag,
      'tags': instance.tags,
      'copywriter': instance.copywriter,
      'createTime': instance.createTime,
      'updateTime': instance.updateTime,
      'playCount': instance.playCount,
      'subscribedCount': instance.subscribedCount,
      'shareCount': instance.shareCount,
      'commentCount': instance.commentCount,
      'trackCount': instance.trackCount,
      'trackNumberUpdateTime': instance.trackNumberUpdateTime,
      'creator': instance.creator,
      'subscribers': instance.subscribers,
    };

NeteaseUserInfo _$NeteaseUserInfoFromJson(Map<String, dynamic> json) {
  return NeteaseUserInfo()
    ..userId = _dynamicToString(json['userId'])
    ..nickname = json['nickname'] as String
    ..avatarUrl = json['avatarUrl'] as String
    ..signature = json['signature'] as String
    ..city = json['city'] as int
    ..province = json['province'] as int
    ..backgroundUrl = json['backgroundUrl'] as String
    ..expertTags =
        (json['expertTags'] as List)?.map((e) => e as String)?.toList();
}

Map<String, dynamic> _$NeteaseUserInfoToJson(NeteaseUserInfo instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'nickname': instance.nickname,
      'avatarUrl': instance.avatarUrl,
      'signature': instance.signature,
      'city': instance.city,
      'province': instance.province,
      'backgroundUrl': instance.backgroundUrl,
      'expertTags': instance.expertTags,
    };

PlayListCreator _$PlayListCreatorFromJson(Map<String, dynamic> json) {
  return PlayListCreator()
    ..userId = _dynamicToString(json['userId'])
    ..nickname = json['nickname'] as String
    ..avatarUrl = json['avatarUrl'] as String
    ..signature = json['signature'] as String
    ..city = json['city'] as int
    ..province = json['province'] as int
    ..backgroundUrl = json['backgroundUrl'] as String
    ..expertTags =
        (json['expertTags'] as List)?.map((e) => e as String)?.toList();
}

Map<String, dynamic> _$PlayListCreatorToJson(PlayListCreator instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'nickname': instance.nickname,
      'avatarUrl': instance.avatarUrl,
      'signature': instance.signature,
      'city': instance.city,
      'province': instance.province,
      'backgroundUrl': instance.backgroundUrl,
      'expertTags': instance.expertTags,
    };

PlayListSubscriber _$PlayListSubscriberFromJson(Map<String, dynamic> json) {
  return PlayListSubscriber()
    ..userId = _dynamicToString(json['userId'])
    ..nickname = json['nickname'] as String
    ..avatarUrl = json['avatarUrl'] as String
    ..signature = json['signature'] as String
    ..city = json['city'] as int
    ..province = json['province'] as int
    ..backgroundUrl = json['backgroundUrl'] as String
    ..expertTags =
        (json['expertTags'] as List)?.map((e) => e as String)?.toList();
}

Map<String, dynamic> _$PlayListSubscriberToJson(PlayListSubscriber instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'nickname': instance.nickname,
      'avatarUrl': instance.avatarUrl,
      'signature': instance.signature,
      'city': instance.city,
      'province': instance.province,
      'backgroundUrl': instance.backgroundUrl,
      'expertTags': instance.expertTags,
    };

HighqualityPlayListWrap _$HighqualityPlayListWrapFromJson(
    Map<String, dynamic> json) {
  return HighqualityPlayListWrap()
    ..code = json['code'] as int
    ..playlists = (json['playlists'] as List)
        ?.map((e) =>
            e == null ? null : PlayListItem.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$HighqualityPlayListWrapToJson(
        HighqualityPlayListWrap instance) =>
    <String, dynamic>{
      'code': instance.code,
      'playlists': instance.playlists,
    };

CategoryPlayListWrap _$CategoryPlayListWrapFromJson(Map<String, dynamic> json) {
  return CategoryPlayListWrap()
    ..code = json['code'] as int
    ..playlist = json['playlist'] == null
        ? null
        : PlayListItem.fromJson(json['playlist'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CategoryPlayListWrapToJson(
        CategoryPlayListWrap instance) =>
    <String, dynamic>{
      'code': instance.code,
      'playlist': instance.playlist,
    };

ServerStatusBean _$ServerStatusBeanFromJson(Map<String, dynamic> json) {
  return ServerStatusBean()..code = json['code'] as int;
}

Map<String, dynamic> _$ServerStatusBeanToJson(ServerStatusBean instance) =>
    <String, dynamic>{
      'code': instance.code,
    };
