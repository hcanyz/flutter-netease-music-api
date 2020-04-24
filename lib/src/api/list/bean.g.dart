// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayListItem _$PlayListItemFromJson(Map<String, dynamic> json) {
  return PlayListItem()
    ..id = dynamicToString(json['id'])
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
    ..specialType = json['specialType'] as int
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
      'specialType': instance.specialType,
      'creator': instance.creator,
      'subscribers': instance.subscribers,
    };

MultiPlayListWrap _$MultiPlayListWrapFromJson(Map<String, dynamic> json) {
  return MultiPlayListWrap()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..playlists = (json['playlists'] as List)
        ?.map((e) =>
            e == null ? null : PlayListItem.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$MultiPlayListWrapToJson(MultiPlayListWrap instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'playlists': instance.playlists,
    };

MultiPlayListWrap2 _$MultiPlayListWrap2FromJson(Map<String, dynamic> json) {
  return MultiPlayListWrap2()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..playlist = (json['playlist'] as List)
        ?.map((e) =>
            e == null ? null : PlayListItem.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$MultiPlayListWrap2ToJson(MultiPlayListWrap2 instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'playlist': instance.playlist,
    };

SinglePlayListWrap _$SinglePlayListWrapFromJson(Map<String, dynamic> json) {
  return SinglePlayListWrap()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..playlist = json['playlist'] == null
        ? null
        : PlayListItem.fromJson(json['playlist'] as Map<String, dynamic>);
}

Map<String, dynamic> _$SinglePlayListWrapToJson(SinglePlayListWrap instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'playlist': instance.playlist,
    };
