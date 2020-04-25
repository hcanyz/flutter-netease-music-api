// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NeteaseAccount _$NeteaseAccountFromJson(Map<String, dynamic> json) {
  return NeteaseAccount()
    ..id = dynamicToString(json['id'])
    ..userName = json['userName'] as String
    ..type = json['type'] as int
    ..status = json['status'] as int
    ..createTime = json['createTime'] as int
    ..vipType = json['vipType'] as int
    ..viptypeVersion = json['viptypeVersion'] as int
    ..anonimousUser = json['anonimousUser'] as bool;
}

Map<String, dynamic> _$NeteaseAccountToJson(NeteaseAccount instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'type': instance.type,
      'status': instance.status,
      'createTime': instance.createTime,
      'vipType': instance.vipType,
      'viptypeVersion': instance.viptypeVersion,
      'anonimousUser': instance.anonimousUser,
    };

NeteaseAccountProfile _$NeteaseAccountProfileFromJson(
    Map<String, dynamic> json) {
  return NeteaseAccountProfile()
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
        (json['expertTags'] as List)?.map((e) => e as String)?.toList()
    ..follows = json['follows'] as int
    ..playlistCount = json['playlistCount'] as int;
}

Map<String, dynamic> _$NeteaseAccountProfileToJson(
        NeteaseAccountProfile instance) =>
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
      'follows': instance.follows,
      'playlistCount': instance.playlistCount,
    };

NeteaseAccountInfoWrap _$NeteaseAccountInfoWrapFromJson(
    Map<String, dynamic> json) {
  return NeteaseAccountInfoWrap()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..loginType = json['loginType'] as int
    ..account = json['account'] == null
        ? null
        : NeteaseAccount.fromJson(json['account'] as Map<String, dynamic>)
    ..profile = json['profile'] == null
        ? null
        : NeteaseAccountProfile.fromJson(
            json['profile'] as Map<String, dynamic>);
}

Map<String, dynamic> _$NeteaseAccountInfoWrapToJson(
        NeteaseAccountInfoWrap instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'loginType': instance.loginType,
      'account': instance.account,
      'profile': instance.profile,
    };

CellPhoneCheckExistenceRet _$CellPhoneCheckExistenceRetFromJson(
    Map<String, dynamic> json) {
  return CellPhoneCheckExistenceRet()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..exist = json['exist'] as int
    ..nickname = json['nickname'] as String
    ..hasPassword = json['hasPassword'] as bool;
}

Map<String, dynamic> _$CellPhoneCheckExistenceRetToJson(
        CellPhoneCheckExistenceRet instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'exist': instance.exist,
      'nickname': instance.nickname,
      'hasPassword': instance.hasPassword,
    };
