// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dj _$DjFromJson(Map<String, dynamic> json) {
  return Dj()
    ..id = dynamicToString(json['id'])
    ..name = json['name'] as String
    ..dj = json['dj'] == null
        ? null
        : NeteaseAccountProfile.fromJson(json['dj'] as Map<String, dynamic>)
    ..picUrl = json['picUrl'] as String
    ..desc = json['desc'] as String
    ..subCount = json['subCount'] as int
    ..commentCount = json['commentCount'] as int
    ..programCount = json['programCount'] as int
    ..shareCount = json['shareCount'] as int
    ..likedCount = json['likedCount'] as int
    ..createTime = json['createTime'] as int
    ..categoryId = json['categoryId'] as int
    ..category = json['category'] as String
    ..radioFeeType = json['radioFeeType'] as int
    ..feeScope = json['feeScope'] as int
    ..buyed = json['buyed'] as bool
    ..finished = json['finished'] as bool
    ..underShelf = json['underShelf'] as bool
    ..purchaseCount = json['purchaseCount'] as int
    ..price = json['price'] as int
    ..originalPrice = json['originalPrice'] as int
    ..lastProgramCreateTime = json['lastProgramCreateTime'] as int
    ..lastProgramName = json['lastProgramName'] as String
    ..lastProgramId = json['lastProgramId'] as int
    ..composeVideo = json['composeVideo'] as bool
    ..alg = json['alg'] as String;
}

Map<String, dynamic> _$DjToJson(Dj instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'dj': instance.dj,
      'picUrl': instance.picUrl,
      'desc': instance.desc,
      'subCount': instance.subCount,
      'commentCount': instance.commentCount,
      'programCount': instance.programCount,
      'shareCount': instance.shareCount,
      'likedCount': instance.likedCount,
      'createTime': instance.createTime,
      'categoryId': instance.categoryId,
      'category': instance.category,
      'radioFeeType': instance.radioFeeType,
      'feeScope': instance.feeScope,
      'buyed': instance.buyed,
      'finished': instance.finished,
      'underShelf': instance.underShelf,
      'purchaseCount': instance.purchaseCount,
      'price': instance.price,
      'originalPrice': instance.originalPrice,
      'lastProgramCreateTime': instance.lastProgramCreateTime,
      'lastProgramName': instance.lastProgramName,
      'lastProgramId': instance.lastProgramId,
      'composeVideo': instance.composeVideo,
      'alg': instance.alg,
    };

DjProgram _$DjProgramFromJson(Map<String, dynamic> json) {
  return DjProgram()
    ..id = dynamicToString(json['id'])
    ..mainSong = json['mainSong'] == null
        ? null
        : Song.fromJson(json['mainSong'] as Map<String, dynamic>)
    ..dj = json['dj'] == null
        ? null
        : NeteaseAccountProfile.fromJson(json['dj'] as Map<String, dynamic>);
}

Map<String, dynamic> _$DjProgramToJson(DjProgram instance) => <String, dynamic>{
      'id': instance.id,
      'mainSong': instance.mainSong,
      'dj': instance.dj,
    };

DjListWrap _$DjListWrapFromJson(Map<String, dynamic> json) {
  return DjListWrap()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..more = json['more'] as bool
    ..total = json['total'] as int
    ..djRadios = (json['djRadios'] as List)
        ?.map((e) => e == null ? null : Dj.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..subCount = json['subCount'] as int
    ..count = json['count'] as int;
}

Map<String, dynamic> _$DjListWrapToJson(DjListWrap instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'more': instance.more,
      'total': instance.total,
      'djRadios': instance.djRadios,
      'subCount': instance.subCount,
      'count': instance.count,
    };

DjProgramsListWrap _$DjProgramsListWrapFromJson(Map<String, dynamic> json) {
  return DjProgramsListWrap()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..more = json['more'] as bool
    ..count = json['count'] as int
    ..total = json['total'] as int
    ..programs = (json['programs'] as List)
        ?.map((e) =>
            e == null ? null : DjProgram.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..name = json['name'] as String;
}

Map<String, dynamic> _$DjProgramsListWrapToJson(DjProgramsListWrap instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'more': instance.more,
      'count': instance.count,
      'total': instance.total,
      'programs': instance.programs,
      'name': instance.name,
    };

PersonalizedDjItem _$PersonalizedDjItemFromJson(Map<String, dynamic> json) {
  return PersonalizedDjItem()
    ..id = dynamicToString(json['id'])
    ..name = json['name'] as String
    ..copywriter = json['copywriter'] as String
    ..picUrl = json['picUrl'] as String
    ..canDislike = json['canDislike'] as bool
    ..type = json['type'] as int
    ..program = json['program'] == null
        ? null
        : DjProgram.fromJson(json['program'] as Map<String, dynamic>);
}

Map<String, dynamic> _$PersonalizedDjItemToJson(PersonalizedDjItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'copywriter': instance.copywriter,
      'picUrl': instance.picUrl,
      'canDislike': instance.canDislike,
      'type': instance.type,
      'program': instance.program,
    };

PersonalizedDjListWrap _$PersonalizedDjListWrapFromJson(
    Map<String, dynamic> json) {
  return PersonalizedDjListWrap()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..category = json['category'] as int
    ..result = (json['result'] as List)
        ?.map((e) => e == null
            ? null
            : PersonalizedDjItem.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$PersonalizedDjListWrapToJson(
        PersonalizedDjListWrap instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'category': instance.category,
      'result': instance.result,
    };
