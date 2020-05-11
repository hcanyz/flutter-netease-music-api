// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerItem _$BannerItemFromJson(Map<String, dynamic> json) {
  return BannerItem()
    ..bannerId = json['bannerId'] as String
    ..pic = json['pic'] as String
    ..targetId = json['targetId'] as int
    ..targetType = json['targetType'] as int
    ..titleColor = json['titleColor'] as String
    ..typeTitle = json['typeTitle'] as String
    ..url = json['url'] as String
    ..adurlV2 = json['adurlV2'] as String
    ..exclusive = json['exclusive'] as bool
    ..encodeId = json['encodeId'] as String
    ..song = json['song'] == null
        ? null
        : Song2.fromJson(json['song'] as Map<String, dynamic>)
    ..alg = json['alg'] as String
    ..scm = json['scm'] as String
    ..requestId = json['requestId'] as String
    ..showAdTag = json['showAdTag'] as bool;
}

Map<String, dynamic> _$BannerItemToJson(BannerItem instance) =>
    <String, dynamic>{
      'bannerId': instance.bannerId,
      'pic': instance.pic,
      'targetId': instance.targetId,
      'targetType': instance.targetType,
      'titleColor': instance.titleColor,
      'typeTitle': instance.typeTitle,
      'url': instance.url,
      'adurlV2': instance.adurlV2,
      'exclusive': instance.exclusive,
      'encodeId': instance.encodeId,
      'song': instance.song,
      'alg': instance.alg,
      'scm': instance.scm,
      'requestId': instance.requestId,
      'showAdTag': instance.showAdTag,
    };

BannerListWrap _$BannerListWrapFromJson(Map<String, dynamic> json) {
  return BannerListWrap()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..banners = (json['banners'] as List)
        ?.map((e) =>
            e == null ? null : BannerItem.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$BannerListWrapToJson(BannerListWrap instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'banners': instance.banners,
    };

PersonalizedPrivateContentItem _$PersonalizedPrivateContentItemFromJson(
    Map<String, dynamic> json) {
  return PersonalizedPrivateContentItem()
    ..id = dynamicToString(json['id'])
    ..name = json['name'] as String
    ..picUrl = json['picUrl'] as String
    ..sPicUrl = json['sPicUrl'] as String
    ..copywriter = json['copywriter'] as String
    ..alg = json['alg'] as String
    ..type = json['type'] as int;
}

Map<String, dynamic> _$PersonalizedPrivateContentItemToJson(
        PersonalizedPrivateContentItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'picUrl': instance.picUrl,
      'sPicUrl': instance.sPicUrl,
      'copywriter': instance.copywriter,
      'alg': instance.alg,
      'type': instance.type,
    };

PersonalizedPrivateContentListWrap _$PersonalizedPrivateContentListWrapFromJson(
    Map<String, dynamic> json) {
  return PersonalizedPrivateContentListWrap()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..result = (json['result'] as List)
        ?.map((e) => e == null
            ? null
            : PersonalizedPrivateContentItem.fromJson(
                e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$PersonalizedPrivateContentListWrapToJson(
        PersonalizedPrivateContentListWrap instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'result': instance.result,
    };
