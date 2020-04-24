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
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..more = json['more'] as bool
    ..count = json['count'] as int
    ..msg = json['msg'] as String
    ..eventId = json['eventId'] as int
    ..eventTime = json['eventTime'] as int;
}

Map<String, dynamic> _$EventForwardRetToJson(EventForwardRet instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'more': instance.more,
      'count': instance.count,
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
