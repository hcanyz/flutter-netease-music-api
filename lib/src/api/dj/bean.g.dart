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
    ..name = json['name'] as String
    ..programDesc = json['programDesc'] as String
    ..coverUrl = json['coverUrl'] as String
    ..blurCoverUrl = json['blurCoverUrl'] as String
    ..description = json['description'] as String
    ..alg = json['alg'] as String
    ..commentThreadId = json['commentThreadId'] as String
    ..mainTrackId = json['mainTrackId'] as int
    ..pubStatus = json['pubStatus'] as int
    ..bdAuditStatus = json['bdAuditStatus'] as int
    ..serialNum = json['serialNum'] as int
    ..duration = json['duration'] as int
    ..auditStatus = json['auditStatus'] as int
    ..score = json['score'] as int
    ..createTime = json['createTime'] as int
    ..feeScope = json['feeScope'] as int
    ..listenerCount = json['listenerCount'] as int
    ..subscribedCount = json['subscribedCount'] as int
    ..programFeeType = json['programFeeType'] as int
    ..trackCount = json['trackCount'] as int
    ..smallLanguageAuditStatus = json['smallLanguageAuditStatus'] as int
    ..shareCount = json['shareCount'] as int
    ..likedCount = json['likedCount'] as int
    ..commentCount = json['commentCount'] as int
    ..buyed = json['buyed'] as bool
    ..isPublish = json['isPublish'] as bool
    ..subscribed = json['subscribed'] as bool
    ..canReward = json['canReward'] as bool
    ..reward = json['reward'] as bool
    ..radio = json['radio'] == null
        ? null
        : Dj.fromJson(json['radio'] as Map<String, dynamic>)
    ..mainSong = json['mainSong'] == null
        ? null
        : Song.fromJson(json['mainSong'] as Map<String, dynamic>)
    ..dj = json['dj'] == null
        ? null
        : NeteaseAccountProfile.fromJson(json['dj'] as Map<String, dynamic>);
}

Map<String, dynamic> _$DjProgramToJson(DjProgram instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'programDesc': instance.programDesc,
      'coverUrl': instance.coverUrl,
      'blurCoverUrl': instance.blurCoverUrl,
      'description': instance.description,
      'alg': instance.alg,
      'commentThreadId': instance.commentThreadId,
      'mainTrackId': instance.mainTrackId,
      'pubStatus': instance.pubStatus,
      'bdAuditStatus': instance.bdAuditStatus,
      'serialNum': instance.serialNum,
      'duration': instance.duration,
      'auditStatus': instance.auditStatus,
      'score': instance.score,
      'createTime': instance.createTime,
      'feeScope': instance.feeScope,
      'listenerCount': instance.listenerCount,
      'subscribedCount': instance.subscribedCount,
      'programFeeType': instance.programFeeType,
      'trackCount': instance.trackCount,
      'smallLanguageAuditStatus': instance.smallLanguageAuditStatus,
      'shareCount': instance.shareCount,
      'likedCount': instance.likedCount,
      'commentCount': instance.commentCount,
      'buyed': instance.buyed,
      'isPublish': instance.isPublish,
      'subscribed': instance.subscribed,
      'canReward': instance.canReward,
      'reward': instance.reward,
      'radio': instance.radio,
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

DjProgramsTopListItem _$DjProgramsTopListItemFromJson(
    Map<String, dynamic> json) {
  return DjProgramsTopListItem()
    ..program = json['program'] == null
        ? null
        : DjProgram.fromJson(json['program'] as Map<String, dynamic>)
    ..rank = json['rank'] as int
    ..lastRank = json['lastRank'] as int
    ..score = json['score'] as int
    ..programFeeType = json['programFeeType'] as int;
}

Map<String, dynamic> _$DjProgramsTopListItemToJson(
        DjProgramsTopListItem instance) =>
    <String, dynamic>{
      'program': instance.program,
      'rank': instance.rank,
      'lastRank': instance.lastRank,
      'score': instance.score,
      'programFeeType': instance.programFeeType,
    };

DjProgramsTopListListWrap _$DjProgramsTopListListWrapFromJson(
    Map<String, dynamic> json) {
  return DjProgramsTopListListWrap()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..toplist = (json['toplist'] as List)
        ?.map((e) => e == null
            ? null
            : DjProgramsTopListItem.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..updateTime = json['updateTime'] as int;
}

Map<String, dynamic> _$DjProgramsTopListListWrapToJson(
        DjProgramsTopListListWrap instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'toplist': instance.toplist,
      'updateTime': instance.updateTime,
    };

DjProgramsPayTopListItem _$DjProgramsPayTopListItemFromJson(
    Map<String, dynamic> json) {
  return DjProgramsPayTopListItem()
    ..id = dynamicToString(json['id'])
    ..name = json['name'] as String
    ..picUrl = json['picUrl'] as String
    ..creatorName = json['creatorName'] as String
    ..rank = json['rank'] as int
    ..lastRank = json['lastRank'] as int
    ..score = json['score'] as int;
}

Map<String, dynamic> _$DjProgramsPayTopListItemToJson(
        DjProgramsPayTopListItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'picUrl': instance.picUrl,
      'creatorName': instance.creatorName,
      'rank': instance.rank,
      'lastRank': instance.lastRank,
      'score': instance.score,
    };

DjProgramsPayTopListListWrap _$DjProgramsPayTopListListWrapFromJson(
    Map<String, dynamic> json) {
  return DjProgramsPayTopListListWrap()
    ..list = (json['list'] as List)
        ?.map((e) => e == null
            ? null
            : DjProgramsPayTopListItem.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..total = json['total'] as int
    ..updateTime = json['updateTime'] as int;
}

Map<String, dynamic> _$DjProgramsPayTopListListWrapToJson(
        DjProgramsPayTopListListWrap instance) =>
    <String, dynamic>{
      'list': instance.list,
      'total': instance.total,
      'updateTime': instance.updateTime,
    };

DjProgramsPayTopListListWrapX _$DjProgramsPayTopListListWrapXFromJson(
    Map<String, dynamic> json) {
  return DjProgramsPayTopListListWrapX()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..data = json['data'] == null
        ? null
        : DjProgramsPayTopListListWrap.fromJson(
            json['data'] as Map<String, dynamic>);
}

Map<String, dynamic> _$DjProgramsPayTopListListWrapXToJson(
        DjProgramsPayTopListListWrapX instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'data': instance.data,
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
