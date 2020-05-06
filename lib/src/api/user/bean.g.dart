// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NeteaseSimpleUserInfo _$NeteaseSimpleUserInfoFromJson(
    Map<String, dynamic> json) {
  return NeteaseSimpleUserInfo()
    ..userId = dynamicToString(json['userId'])
    ..nickname = json['nickname'] as String
    ..avatar = json['avatar'] as String
    ..followed = json['followed'] as bool;
}

Map<String, dynamic> _$NeteaseSimpleUserInfoToJson(
        NeteaseSimpleUserInfo instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'nickname': instance.nickname,
      'avatar': instance.avatar,
      'followed': instance.followed,
    };

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
      'createTime': instance.createTime,
      'createDays': instance.createDays,
      'profile': instance.profile,
    };

NeteaseUserSubcount _$NeteaseUserSubcountFromJson(Map<String, dynamic> json) {
  return NeteaseUserSubcount()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
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
      'follow': instance.follow,
    };

UserFollowedListWrap _$UserFollowedListWrapFromJson(Map<String, dynamic> json) {
  return UserFollowedListWrap()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..followeds = (json['followeds'] as List)
        ?.map((e) => e == null
            ? null
            : NeteaseAccountProfile.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$UserFollowedListWrapToJson(
        UserFollowedListWrap instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'followeds': instance.followeds,
    };

ArtistsSubListWrap _$ArtistsSubListWrapFromJson(Map<String, dynamic> json) {
  return ArtistsSubListWrap()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..more = json['more'] as bool
    ..count = json['count'] as int
    ..total = json['total'] as int
    ..data = (json['data'] as List)
        ?.map((e) =>
            e == null ? null : Artists.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$ArtistsSubListWrapToJson(ArtistsSubListWrap instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'more': instance.more,
      'count': instance.count,
      'total': instance.total,
      'data': instance.data,
    };

MvSubListWrap _$MvSubListWrapFromJson(Map<String, dynamic> json) {
  return MvSubListWrap()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..more = json['more'] as bool
    ..count = json['count'] as int
    ..total = json['total'] as int
    ..data = (json['data'] as List)
        ?.map((e) => e == null ? null : Mv2.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$MvSubListWrapToJson(MvSubListWrap instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'more': instance.more,
      'count': instance.count,
      'total': instance.total,
      'data': instance.data,
    };

PlayRecordItem _$PlayRecordItemFromJson(Map<String, dynamic> json) {
  return PlayRecordItem()
    ..playCount = json['playCount'] as int
    ..score = json['score'] as int
    ..song = json['song'] == null
        ? null
        : Song.fromJson(json['song'] as Map<String, dynamic>);
}

Map<String, dynamic> _$PlayRecordItemToJson(PlayRecordItem instance) =>
    <String, dynamic>{
      'playCount': instance.playCount,
      'score': instance.score,
      'song': instance.song,
    };

PlayRecordListWrap _$PlayRecordListWrapFromJson(Map<String, dynamic> json) {
  return PlayRecordListWrap()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..allData = (json['allData'] as List)
        ?.map((e) => e == null
            ? null
            : PlayRecordItem.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$PlayRecordListWrapToJson(PlayRecordListWrap instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'allData': instance.allData,
    };

PlaylistCreateWrap _$PlaylistCreateWrapFromJson(Map<String, dynamic> json) {
  return PlaylistCreateWrap()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..id = dynamicToString(json['id'])
    ..playlist = json['playlist'] == null
        ? null
        : PlayItem.fromJson(json['playlist'] as Map<String, dynamic>);
}

Map<String, dynamic> _$PlaylistCreateWrapToJson(PlaylistCreateWrap instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'id': instance.id,
      'playlist': instance.playlist,
    };

PlaylistSubscribersWrap _$PlaylistSubscribersWrapFromJson(
    Map<String, dynamic> json) {
  return PlaylistSubscribersWrap()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..subscribers = (json['subscribers'] as List)
        ?.map((e) => e == null
            ? null
            : NeteaseUserInfo.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$PlaylistSubscribersWrapToJson(
        PlaylistSubscribersWrap instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'subscribers': instance.subscribers,
    };
