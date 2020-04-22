// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NeteaseUserInfo _$NeteaseUserInfoFromJson(Map<String, dynamic> json) {
  return NeteaseUserInfo()
    ..userId = dynamicToString(json['userId'])
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
    ..userId = dynamicToString(json['userId'])
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
    ..userId = dynamicToString(json['userId'])
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
