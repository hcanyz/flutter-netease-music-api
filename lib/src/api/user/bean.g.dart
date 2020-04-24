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
    ..gender = json['gender'] as int
    ..birthday = json['birthday'] as int
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
      'gender': instance.gender,
      'birthday': instance.birthday,
      'city': instance.city,
      'province': instance.province,
      'backgroundUrl': instance.backgroundUrl,
      'expertTags': instance.expertTags,
    };

NeteaseUserDetail _$NeteaseUserDetailFromJson(Map<String, dynamic> json) {
  return NeteaseUserDetail()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..more = json['more'] as bool
    ..count = json['count'] as int
    ..createTime = json['createTime'] as int
    ..createDays = json['createDays'] as int
    ..profile = json['profile'] == null
        ? null
        : NeteaseAccountProfile.fromJson(
            json['profile'] as Map<String, dynamic>);
}

Map<String, dynamic> _$NeteaseUserDetailToJson(NeteaseUserDetail instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'more': instance.more,
      'count': instance.count,
      'createTime': instance.createTime,
      'createDays': instance.createDays,
      'profile': instance.profile,
    };

NeteaseUserSubcount _$NeteaseUserSubcountFromJson(Map<String, dynamic> json) {
  return NeteaseUserSubcount()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..more = json['more'] as bool
    ..count = json['count'] as int
    ..programCount = json['programCount'] as int
    ..djRadioCount = json['djRadioCount'] as int
    ..mvCount = json['mvCount'] as int
    ..artistCount = json['artistCount'] as int
    ..newProgramCount = json['newProgramCount'] as int
    ..createDjRadioCount = json['createDjRadioCount'] as int
    ..createdPlaylistCount = json['createdPlaylistCount'] as int
    ..subPlaylistCount = json['subPlaylistCount'] as int;
}

Map<String, dynamic> _$NeteaseUserSubcountToJson(
        NeteaseUserSubcount instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'more': instance.more,
      'count': instance.count,
      'programCount': instance.programCount,
      'djRadioCount': instance.djRadioCount,
      'mvCount': instance.mvCount,
      'artistCount': instance.artistCount,
      'newProgramCount': instance.newProgramCount,
      'createDjRadioCount': instance.createDjRadioCount,
      'createdPlaylistCount': instance.createdPlaylistCount,
      'subPlaylistCount': instance.subPlaylistCount,
    };

PlayListCreator _$PlayListCreatorFromJson(Map<String, dynamic> json) {
  return PlayListCreator()
    ..userId = dynamicToString(json['userId'])
    ..nickname = json['nickname'] as String
    ..avatarUrl = json['avatarUrl'] as String
    ..signature = json['signature'] as String
    ..gender = json['gender'] as int
    ..birthday = json['birthday'] as int
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
      'gender': instance.gender,
      'birthday': instance.birthday,
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
    ..gender = json['gender'] as int
    ..birthday = json['birthday'] as int
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
      'gender': instance.gender,
      'birthday': instance.birthday,
      'city': instance.city,
      'province': instance.province,
      'backgroundUrl': instance.backgroundUrl,
      'expertTags': instance.expertTags,
    };

UserFollowListWrap _$UserFollowListWrapFromJson(Map<String, dynamic> json) {
  return UserFollowListWrap()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..more = json['more'] as bool
    ..count = json['count'] as int
    ..follow = (json['follow'] as List)
        ?.map((e) => e == null
            ? null
            : NeteaseAccountProfile.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$UserFollowListWrapToJson(UserFollowListWrap instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'more': instance.more,
      'count': instance.count,
      'follow': instance.follow,
    };

UserFollowedListWrap _$UserFollowedListWrapFromJson(Map<String, dynamic> json) {
  return UserFollowedListWrap()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..more = json['more'] as bool
    ..count = json['count'] as int
    ..followed = (json['followed'] as List)
        ?.map((e) => e == null
            ? null
            : NeteaseAccountProfile.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..lasttime = json['lasttime'] as int;
}

Map<String, dynamic> _$UserFollowedListWrapToJson(
        UserFollowedListWrap instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'more': instance.more,
      'count': instance.count,
      'followed': instance.followed,
      'lasttime': instance.lasttime,
    };
