// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventItemInfo _$EventItemInfoFromJson(Map<String, dynamic> json) {
  return EventItemInfo()..threadId = json['threadId'] as String;
}

Map<String, dynamic> _$EventItemInfoToJson(EventItemInfo instance) =>
    <String, dynamic>{
      'threadId': instance.threadId,
    };

EventItem _$EventItemFromJson(Map<String, dynamic> json) {
  return EventItem()
    ..id = dynamicToString(json['id'])
    ..json = json['json'] as String
    ..eventTime = json['eventTime'] as int
    ..user = json['user'] == null
        ? null
        : NeteaseAccountProfile.fromJson(json['user'] as Map<String, dynamic>)
    ..info = json['info'] == null
        ? null
        : EventItemInfo.fromJson(json['info'] as Map<String, dynamic>);
}

Map<String, dynamic> _$EventItemToJson(EventItem instance) => <String, dynamic>{
      'id': instance.id,
      'json': instance.json,
      'eventTime': instance.eventTime,
      'user': instance.user,
      'info': instance.info,
    };

EventListWrap _$EventListWrapFromJson(Map<String, dynamic> json) {
  return EventListWrap()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..more = json['more'] as bool
    ..count = json['count'] as int
    ..events = (json['events'] as List)
        ?.map((e) =>
            e == null ? null : EventItem.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..lasttime = json['lasttime'] as int;
}

Map<String, dynamic> _$EventListWrapToJson(EventListWrap instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'more': instance.more,
      'count': instance.count,
      'events': instance.events,
      'lasttime': instance.lasttime,
    };

EventSingleWrap _$EventSingleWrapFromJson(Map<String, dynamic> json) {
  return EventSingleWrap()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..more = json['more'] as bool
    ..count = json['count'] as int
    ..event = json['event'] == null
        ? null
        : EventItem.fromJson(json['event'] as Map<String, dynamic>);
}

Map<String, dynamic> _$EventSingleWrapToJson(EventSingleWrap instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'more': instance.more,
      'count': instance.count,
      'event': instance.event,
    };

CommentItem _$CommentItemFromJson(Map<String, dynamic> json) {
  return CommentItem()
    ..commentId = dynamicToString(json['commentId'])
    ..parentCommentId = dynamicToString(json['parentCommentId'])
    ..user = json['user'] == null
        ? null
        : NeteaseUserInfo.fromJson(json['user'] as Map<String, dynamic>)
    ..content = json['content'] as String
    ..time = json['time'] as int
    ..likedCount = json['likedCount'] as int
    ..liked = json['liked'] as bool;
}

Map<String, dynamic> _$CommentItemToJson(CommentItem instance) =>
    <String, dynamic>{
      'commentId': instance.commentId,
      'parentCommentId': instance.parentCommentId,
      'user': instance.user,
      'content': instance.content,
      'time': instance.time,
      'likedCount': instance.likedCount,
      'liked': instance.liked,
    };

CommentListWrap _$CommentListWrapFromJson(Map<String, dynamic> json) {
  return CommentListWrap()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..more = json['more'] as bool
    ..count = json['count'] as int
    ..moreHot = json['moreHot'] as bool
    ..cnum = json['cnum'] as int
    ..isMusician = json['isMusician'] as bool
    ..userId = dynamicToString(json['userId'])
    ..topComments = (json['topComments'] as List)
        ?.map((e) =>
            e == null ? null : CommentItem.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..hotComments = (json['hotComments'] as List)
        ?.map((e) =>
            e == null ? null : CommentItem.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$CommentListWrapToJson(CommentListWrap instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'more': instance.more,
      'count': instance.count,
      'moreHot': instance.moreHot,
      'cnum': instance.cnum,
      'isMusician': instance.isMusician,
      'userId': instance.userId,
      'topComments': instance.topComments,
      'hotComments': instance.hotComments,
    };

EventForwardRet _$EventForwardRetFromJson(Map<String, dynamic> json) {
  return EventForwardRet()
    ..msg = json['msg'] as String
    ..eventId = json['eventId'] as int
    ..eventTime = json['eventTime'] as int;
}

Map<String, dynamic> _$EventForwardRetToJson(EventForwardRet instance) =>
    <String, dynamic>{
      'msg': instance.msg,
      'eventId': instance.eventId,
      'eventTime': instance.eventTime,
    };

EventForwardRetWrap _$EventForwardRetWrapFromJson(Map<String, dynamic> json) {
  return EventForwardRetWrap()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..more = json['more'] as bool
    ..count = json['count'] as int
    ..data = json['data'] == null
        ? null
        : EventForwardRet.fromJson(json['data'] as Map<String, dynamic>);
}

Map<String, dynamic> _$EventForwardRetWrapToJson(
        EventForwardRetWrap instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'more': instance.more,
      'count': instance.count,
      'data': instance.data,
    };

TopicItem _$TopicItemFromJson(Map<String, dynamic> json) {
  return TopicItem()
    ..actId = dynamicToString(json['actId'])
    ..title = json['title'] as String
    ..text = (json['text'] as List)?.map((e) => e as String)?.toList()
    ..reason = json['reason'] as String
    ..sharePicUrl = json['sharePicUrl'] as String
    ..participateCount = json['participateCount'] as int
    ..alg = json['alg'] as String;
}

Map<String, dynamic> _$TopicItemToJson(TopicItem instance) => <String, dynamic>{
      'actId': instance.actId,
      'title': instance.title,
      'text': instance.text,
      'reason': instance.reason,
      'sharePicUrl': instance.sharePicUrl,
      'participateCount': instance.participateCount,
      'alg': instance.alg,
    };

TopicHotListWrap _$TopicHotListWrapFromJson(Map<String, dynamic> json) {
  return TopicHotListWrap()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..more = json['more'] as bool
    ..count = json['count'] as int
    ..hot = (json['hot'] as List)
        ?.map((e) =>
            e == null ? null : TopicItem.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$TopicHotListWrapToJson(TopicHotListWrap instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'more': instance.more,
      'count': instance.count,
      'hot': instance.hot,
    };

SimpleResourceInfo _$SimpleResourceInfoFromJson(Map<String, dynamic> json) {
  return SimpleResourceInfo()
    ..songId = dynamicToString(json['songId'])
    ..threadId = json['threadId'] as String
    ..songCoverUrl = json['songCoverUrl'] as String
    ..name = json['name'] as String
    ..song = json['song'] == null
        ? null
        : Song.fromJson(json['song'] as Map<String, dynamic>);
}

Map<String, dynamic> _$SimpleResourceInfoToJson(SimpleResourceInfo instance) =>
    <String, dynamic>{
      'songId': instance.songId,
      'threadId': instance.threadId,
      'songCoverUrl': instance.songCoverUrl,
      'name': instance.name,
      'song': instance.song,
    };

HotwallCommentItem _$HotwallCommentItemFromJson(Map<String, dynamic> json) {
  return HotwallCommentItem()
    ..id = dynamicToString(json['id'])
    ..threadId = json['threadId'] as String
    ..content = json['content'] as String
    ..time = json['time'] as int
    ..liked = json['liked'] as bool
    ..likedCount = json['likedCount'] as int
    ..replyCount = json['replyCount'] as int
    ..simpleUserInfo = json['simpleUserInfo'] == null
        ? null
        : NeteaseSimpleUserInfo.fromJson(
            json['simpleUserInfo'] as Map<String, dynamic>)
    ..simpleResourceInfo = json['simpleResourceInfo'] == null
        ? null
        : SimpleResourceInfo.fromJson(
            json['simpleResourceInfo'] as Map<String, dynamic>);
}

Map<String, dynamic> _$HotwallCommentItemToJson(HotwallCommentItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'threadId': instance.threadId,
      'content': instance.content,
      'time': instance.time,
      'liked': instance.liked,
      'likedCount': instance.likedCount,
      'replyCount': instance.replyCount,
      'simpleUserInfo': instance.simpleUserInfo,
      'simpleResourceInfo': instance.simpleResourceInfo,
    };

HotwallCommentListWrap _$HotwallCommentListWrapFromJson(
    Map<String, dynamic> json) {
  return HotwallCommentListWrap()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..more = json['more'] as bool
    ..count = json['count'] as int
    ..data = (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : HotwallCommentItem.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$HotwallCommentListWrapToJson(
        HotwallCommentListWrap instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'more': instance.more,
      'count': instance.count,
      'data': instance.data,
    };
