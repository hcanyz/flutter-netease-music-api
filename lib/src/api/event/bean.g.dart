// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentThread _$CommentThreadFromJson(Map<String, dynamic> json) {
  return CommentThread()
    ..id = dynamicToString(json['id'])
    ..resourceType = json['resourceType'] as int
    ..commentCount = json['commentCount'] as int
    ..likedCount = json['likedCount'] as int
    ..shareCount = json['shareCount'] as int
    ..hotCount = json['hotCount'] as int
    ..resourceId = json['resourceId'] as int
    ..resourceOwnerId = json['resourceOwnerId'] as int
    ..resourceTitle = json['resourceTitle'] as String;
}

Map<String, dynamic> _$CommentThreadToJson(CommentThread instance) =>
    <String, dynamic>{
      'id': instance.id,
      'resourceType': instance.resourceType,
      'commentCount': instance.commentCount,
      'likedCount': instance.likedCount,
      'shareCount': instance.shareCount,
      'hotCount': instance.hotCount,
      'resourceId': instance.resourceId,
      'resourceOwnerId': instance.resourceOwnerId,
      'resourceTitle': instance.resourceTitle,
    };

EventItemInfo _$EventItemInfoFromJson(Map<String, dynamic> json) {
  return EventItemInfo()
    ..threadId = json['threadId'] as String
    ..resourceId = json['resourceId'] as int
    ..resourceType = json['resourceType'] as int
    ..liked = json['liked'] as bool
    ..commentCount = json['commentCount'] as int
    ..likedCount = json['likedCount'] as int
    ..shareCount = json['shareCount'] as int
    ..commentThread = json['commentThread'] == null
        ? null
        : CommentThread.fromJson(json['commentThread'] as Map<String, dynamic>);
}

Map<String, dynamic> _$EventItemInfoToJson(EventItemInfo instance) =>
    <String, dynamic>{
      'threadId': instance.threadId,
      'resourceId': instance.resourceId,
      'resourceType': instance.resourceType,
      'liked': instance.liked,
      'commentCount': instance.commentCount,
      'likedCount': instance.likedCount,
      'shareCount': instance.shareCount,
      'commentThread': instance.commentThread,
    };

EventItem _$EventItemFromJson(Map<String, dynamic> json) {
  return EventItem()
    ..id = dynamicToString(json['id'])
    ..json = json['json'] as String
    ..type = json['type'] as int
    ..actId = json['actId'] as int
    ..eventTime = json['eventTime'] as int
    ..expireTime = json['expireTime'] as int
    ..showTime = json['showTime'] as int
    ..insiteForwardCount = json['insiteForwardCount'] as int
    ..topEvent = json['topEvent'] as bool
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
      'type': instance.type,
      'actId': instance.actId,
      'eventTime': instance.eventTime,
      'expireTime': instance.expireTime,
      'showTime': instance.showTime,
      'insiteForwardCount': instance.insiteForwardCount,
      'topEvent': instance.topEvent,
      'user': instance.user,
      'info': instance.info,
    };

EventListWrap _$EventListWrapFromJson(Map<String, dynamic> json) {
  return EventListWrap()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
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
      'events': instance.events,
      'lasttime': instance.lasttime,
    };

EventListWrap2 _$EventListWrap2FromJson(Map<String, dynamic> json) {
  return EventListWrap2()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..event = (json['event'] as List)
        ?.map((e) =>
            e == null ? null : EventItem.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..lasttime = json['lasttime'] as int;
}

Map<String, dynamic> _$EventListWrap2ToJson(EventListWrap2 instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'event': instance.event,
      'lasttime': instance.lasttime,
    };

EventSingleWrap _$EventSingleWrapFromJson(Map<String, dynamic> json) {
  return EventSingleWrap()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..event = json['event'] == null
        ? null
        : EventItem.fromJson(json['event'] as Map<String, dynamic>);
}

Map<String, dynamic> _$EventSingleWrapToJson(EventSingleWrap instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
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
    ..total = json['total'] as int
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
        ?.toList()
    ..comments = (json['comments'] as List)
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
      'total': instance.total,
      'moreHot': instance.moreHot,
      'cnum': instance.cnum,
      'isMusician': instance.isMusician,
      'userId': instance.userId,
      'topComments': instance.topComments,
      'hotComments': instance.hotComments,
      'comments': instance.comments,
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
      'data': instance.data,
    };

TopicContent _$TopicContentFromJson(Map<String, dynamic> json) {
  return TopicContent()
    ..id = dynamicToString(json['id'])
    ..type = json['type'] as int
    ..content = json['content'] as String;
}

Map<String, dynamic> _$TopicContentToJson(TopicContent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'content': instance.content,
    };

Topic _$TopicFromJson(Map<String, dynamic> json) {
  return Topic()
    ..id = dynamicToString(json['id'])
    ..userId = dynamicToString(json['userId'])
    ..content = (json['content'] as List)
        ?.map((e) =>
            e == null ? null : TopicContent.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..title = json['title'] as String
    ..wxTitle = json['wxTitle'] as String
    ..mainTitle = json['mainTitle'] as String
    ..startText = json['startText'] as String
    ..summary = json['summary'] as String
    ..adInfo = json['adInfo'] as String
    ..recomdTitle = json['recomdTitle'] as String
    ..recomdContent = json['recomdContent'] as String
    ..addTime = json['addTime'] as int
    ..pubTime = json['pubTime'] as int
    ..updateTime = json['updateTime'] as int
    ..cover = json['cover'] as int
    ..headPic = json['headPic'] as int
    ..status = json['status'] as int
    ..seriesId = json['seriesId'] as int
    ..categoryId = json['categoryId'] as int
    ..hotScore = (json['hotScore'] as num)?.toDouble()
    ..auditor = json['auditor'] as String
    ..auditTime = json['auditTime'] as int
    ..auditStatus = json['auditStatus'] as int
    ..delReason = json['delReason'] as String
    ..number = json['number'] as int
    ..readCount = json['readCount'] as int
    ..rectanglePic = json['rectanglePic'] as int
    ..tags = (json['tags'] as List)?.map((e) => e as String)?.toList()
    ..reward = json['reward'] as bool
    ..fromBackend = json['fromBackend'] as bool
    ..showRelated = json['showRelated'] as bool
    ..showComment = json['showComment'] as bool
    ..pubImmidiatly = json['pubImmidiatly'] as bool;
}

Map<String, dynamic> _$TopicToJson(Topic instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'content': instance.content,
      'title': instance.title,
      'wxTitle': instance.wxTitle,
      'mainTitle': instance.mainTitle,
      'startText': instance.startText,
      'summary': instance.summary,
      'adInfo': instance.adInfo,
      'recomdTitle': instance.recomdTitle,
      'recomdContent': instance.recomdContent,
      'addTime': instance.addTime,
      'pubTime': instance.pubTime,
      'updateTime': instance.updateTime,
      'cover': instance.cover,
      'headPic': instance.headPic,
      'status': instance.status,
      'seriesId': instance.seriesId,
      'categoryId': instance.categoryId,
      'hotScore': instance.hotScore,
      'auditor': instance.auditor,
      'auditTime': instance.auditTime,
      'auditStatus': instance.auditStatus,
      'delReason': instance.delReason,
      'number': instance.number,
      'readCount': instance.readCount,
      'rectanglePic': instance.rectanglePic,
      'tags': instance.tags,
      'reward': instance.reward,
      'fromBackend': instance.fromBackend,
      'showRelated': instance.showRelated,
      'showComment': instance.showComment,
      'pubImmidiatly': instance.pubImmidiatly,
    };

TopicItem2 _$TopicItem2FromJson(Map<String, dynamic> json) {
  return TopicItem2()
    ..id = dynamicToString(json['id'])
    ..topic = json['topic'] == null
        ? null
        : Topic.fromJson(json['topic'] as Map<String, dynamic>)
    ..creator = json['creator'] == null
        ? null
        : NeteaseUserInfo.fromJson(json['creator'] as Map<String, dynamic>)
    ..number = json['number'] as int
    ..shareCount = json['shareCount'] as int
    ..commentCount = json['commentCount'] as int
    ..likedCount = json['likedCount'] as int
    ..readCount = json['readCount'] as int
    ..rewardCount = json['rewardCount'] as int
    ..rewardMoney = (json['rewardMoney'] as num)?.toDouble()
    ..rectanglePicUrl = json['rectanglePicUrl'] as String
    ..coverUrl = json['coverUrl'] as String
    ..seriesId = json['seriesId'] as int
    ..categoryId = json['categoryId'] as int
    ..categoryName = json['categoryName'] as String
    ..url = json['url'] as String
    ..wxTitle = json['wxTitle'] as String
    ..mainTitle = json['mainTitle'] as String
    ..title = json['title'] as String
    ..summary = json['summary'] as String
    ..shareContent = json['shareContent'] as String
    ..recmdTitle = json['recmdTitle'] as String
    ..recmdContent = json['recmdContent'] as String
    ..tags = (json['tags'] as List)?.map((e) => e as String)?.toList()
    ..addTime = json['addTime'] as int
    ..commentThreadId = json['commentThreadId'] as String
    ..showRelated = json['showRelated'] as bool
    ..showComment = json['showComment'] as bool
    ..reward = json['reward'] as bool
    ..liked = json['liked'] as bool;
}

Map<String, dynamic> _$TopicItem2ToJson(TopicItem2 instance) =>
    <String, dynamic>{
      'id': instance.id,
      'topic': instance.topic,
      'creator': instance.creator,
      'number': instance.number,
      'shareCount': instance.shareCount,
      'commentCount': instance.commentCount,
      'likedCount': instance.likedCount,
      'readCount': instance.readCount,
      'rewardCount': instance.rewardCount,
      'rewardMoney': instance.rewardMoney,
      'rectanglePicUrl': instance.rectanglePicUrl,
      'coverUrl': instance.coverUrl,
      'seriesId': instance.seriesId,
      'categoryId': instance.categoryId,
      'categoryName': instance.categoryName,
      'url': instance.url,
      'wxTitle': instance.wxTitle,
      'mainTitle': instance.mainTitle,
      'title': instance.title,
      'summary': instance.summary,
      'shareContent': instance.shareContent,
      'recmdTitle': instance.recmdTitle,
      'recmdContent': instance.recmdContent,
      'tags': instance.tags,
      'addTime': instance.addTime,
      'commentThreadId': instance.commentThreadId,
      'showRelated': instance.showRelated,
      'showComment': instance.showComment,
      'reward': instance.reward,
      'liked': instance.liked,
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
      'data': instance.data,
    };

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return Comment()
    ..commentId = dynamicToString(json['commentId'])
    ..user = json['user'] == null
        ? null
        : NeteaseUserInfo.fromJson(json['user'] as Map<String, dynamic>)
    ..beRepliedUser = json['beRepliedUser'] == null
        ? null
        : NeteaseUserInfo.fromJson(
            json['beRepliedUser'] as Map<String, dynamic>)
    ..expressionUrl = json['expressionUrl'] as String
    ..commentLocationType = json['commentLocationType'] as int
    ..time = json['time'] as int
    ..content = json['content'] as String;
}

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'commentId': instance.commentId,
      'user': instance.user,
      'beRepliedUser': instance.beRepliedUser,
      'expressionUrl': instance.expressionUrl,
      'commentLocationType': instance.commentLocationType,
      'time': instance.time,
      'content': instance.content,
    };

CommentWrap _$CommentWrapFromJson(Map<String, dynamic> json) {
  return CommentWrap()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..comment = json['comment'] == null
        ? null
        : Comment.fromJson(json['comment'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CommentWrapToJson(CommentWrap instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'comment': instance.comment,
    };

MsgPromotion _$MsgPromotionFromJson(Map<String, dynamic> json) {
  return MsgPromotion()
    ..id = dynamicToString(json['id'])
    ..title = json['title'] as String
    ..coverUrl = json['coverUrl'] as String
    ..text = json['text'] as String
    ..url = json['url'] as String
    ..addTime = json['addTime'] as int;
}

Map<String, dynamic> _$MsgPromotionToJson(MsgPromotion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'coverUrl': instance.coverUrl,
      'text': instance.text,
      'url': instance.url,
      'addTime': instance.addTime,
    };

MsgGeneral _$MsgGeneralFromJson(Map<String, dynamic> json) {
  return MsgGeneral()
    ..title = json['title'] as String
    ..subTitle = json['subTitle'] as String
    ..tag = json['tag'] as String
    ..subTag = json['subTag'] as String
    ..noticeMsg = json['noticeMsg'] as String
    ..inboxBriefContent = json['inboxBriefContent'] as String
    ..webUrl = json['webUrl'] as String
    ..nativeUrl = json['nativeUrl'] as String
    ..cover = json['cover'] as String
    ..resName = json['resName'] as String
    ..channel = json['channel'] as int
    ..subType = json['subType'] as int
    ..canPlay = json['canPlay'] as bool;
}

Map<String, dynamic> _$MsgGeneralToJson(MsgGeneral instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subTitle': instance.subTitle,
      'tag': instance.tag,
      'subTag': instance.subTag,
      'noticeMsg': instance.noticeMsg,
      'inboxBriefContent': instance.inboxBriefContent,
      'webUrl': instance.webUrl,
      'nativeUrl': instance.nativeUrl,
      'cover': instance.cover,
      'resName': instance.resName,
      'channel': instance.channel,
      'subType': instance.subType,
      'canPlay': instance.canPlay,
    };

MsgContent _$MsgContentFromJson(Map<String, dynamic> json) {
  return MsgContent()
    ..msg = json['msg'] as String
    ..title = json['title'] as String
    ..pushMsg = json['pushMsg'] as String
    ..type = json['type'] as int
    ..resType = json['resType'] as int
    ..newPub = json['newPub'] as bool
    ..promotionUrl = json['promotionUrl'] == null
        ? null
        : MsgPromotion.fromJson(json['promotionUrl'] as Map<String, dynamic>)
    ..generalMsg = json['generalMsg'] == null
        ? null
        : MsgGeneral.fromJson(json['generalMsg'] as Map<String, dynamic>)
    ..mv = json['mv'] == null
        ? null
        : Mv3.fromJson(json['mv'] as Map<String, dynamic>);
}

Map<String, dynamic> _$MsgContentToJson(MsgContent instance) =>
    <String, dynamic>{
      'msg': instance.msg,
      'title': instance.title,
      'pushMsg': instance.pushMsg,
      'type': instance.type,
      'resType': instance.resType,
      'newPub': instance.newPub,
      'promotionUrl': instance.promotionUrl,
      'generalMsg': instance.generalMsg,
      'mv': instance.mv,
    };

Msg _$MsgFromJson(Map<String, dynamic> json) {
  return Msg()
    ..fromUser = json['fromUser'] == null
        ? null
        : NeteaseUserInfo.fromJson(json['fromUser'] as Map<String, dynamic>)
    ..toUser = json['toUser'] == null
        ? null
        : NeteaseUserInfo.fromJson(json['toUser'] as Map<String, dynamic>)
    ..lastMsg = json['lastMsg'] as String
    ..noticeAccountFlag = json['noticeAccountFlag'] as bool
    ..lastMsgTime = json['lastMsgTime'] as int
    ..newMsgCount = json['newMsgCount'] as int;
}

Map<String, dynamic> _$MsgToJson(Msg instance) => <String, dynamic>{
      'fromUser': instance.fromUser,
      'toUser': instance.toUser,
      'lastMsg': instance.lastMsg,
      'noticeAccountFlag': instance.noticeAccountFlag,
      'lastMsgTime': instance.lastMsgTime,
      'newMsgCount': instance.newMsgCount,
    };

Msg2 _$Msg2FromJson(Map<String, dynamic> json) {
  return Msg2()
    ..id = dynamicToString(json['id'])
    ..fromUser = json['fromUser'] == null
        ? null
        : NeteaseUserInfo.fromJson(json['fromUser'] as Map<String, dynamic>)
    ..toUser = json['toUser'] == null
        ? null
        : NeteaseUserInfo.fromJson(json['toUser'] as Map<String, dynamic>)
    ..msg = json['msg'] as String
    ..time = json['time'] as int
    ..batchId = json['batchId'] as int;
}

Map<String, dynamic> _$Msg2ToJson(Msg2 instance) => <String, dynamic>{
      'id': instance.id,
      'fromUser': instance.fromUser,
      'toUser': instance.toUser,
      'msg': instance.msg,
      'time': instance.time,
      'batchId': instance.batchId,
    };

UsersMsgListWrap _$UsersMsgListWrapFromJson(Map<String, dynamic> json) {
  return UsersMsgListWrap()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..msgs = (json['msgs'] as List)
        ?.map((e) => e == null ? null : Msg.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$UsersMsgListWrapToJson(UsersMsgListWrap instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'msgs': instance.msgs,
    };

UserMsgListWrap _$UserMsgListWrapFromJson(Map<String, dynamic> json) {
  return UserMsgListWrap()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..msgs = (json['msgs'] as List)
        ?.map(
            (e) => e == null ? null : Msg2.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..isArtist = json['isArtist'] as bool
    ..isSubed = json['isSubed'] as bool
    ..more = json['more'] as bool;
}

Map<String, dynamic> _$UserMsgListWrapToJson(UserMsgListWrap instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'msgs': instance.msgs,
      'isArtist': instance.isArtist,
      'isSubed': instance.isSubed,
      'more': instance.more,
    };

UserMsgListWrap2 _$UserMsgListWrap2FromJson(Map<String, dynamic> json) {
  return UserMsgListWrap2()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..id = dynamicToString(json['id'])
    ..newMsgs = (json['newMsgs'] as List)
        ?.map(
            (e) => e == null ? null : Msg2.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$UserMsgListWrap2ToJson(UserMsgListWrap2 instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'id': instance.id,
      'newMsgs': instance.newMsgs,
    };

Cover _$CoverFromJson(Map<String, dynamic> json) {
  return Cover()
    ..width = json['width'] as int
    ..height = json['height'] as int
    ..url = json['url'] as String;
}

Map<String, dynamic> _$CoverToJson(Cover instance) => <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
      'url': instance.url,
    };

Talk _$TalkFromJson(Map<String, dynamic> json) {
  return Talk()
    ..talkId = dynamicToString(json['talkId'])
    ..talkName = json['talkName'] as String
    ..talkDes = json['talkDes'] as String
    ..shareCover = json['shareCover'] == null
        ? null
        : Cover.fromJson(json['shareCover'] as Map<String, dynamic>)
    ..showCover = json['showCover'] == null
        ? null
        : Cover.fromJson(json['showCover'] as Map<String, dynamic>)
    ..status = json['status'] as int
    ..mlogCount = json['mlogCount'] as int
    ..follows = json['follows'] as int
    ..participations = json['participations'] as int
    ..showParticipations = json['showParticipations'] as int
    ..isFollow = json['isFollow'] as bool
    ..alg = json['alg'] as String;
}

Map<String, dynamic> _$TalkToJson(Talk instance) => <String, dynamic>{
      'talkId': instance.talkId,
      'talkName': instance.talkName,
      'talkDes': instance.talkDes,
      'shareCover': instance.shareCover,
      'showCover': instance.showCover,
      'status': instance.status,
      'mlogCount': instance.mlogCount,
      'follows': instance.follows,
      'participations': instance.participations,
      'showParticipations': instance.showParticipations,
      'isFollow': instance.isFollow,
      'alg': instance.alg,
    };

MyLogBaseData _$MyLogBaseDataFromJson(Map<String, dynamic> json) {
  return MyLogBaseData()
    ..id = dynamicToString(json['id'])
    ..pubTime = json['pubTime'] as int
    ..type = json['type'] as int
    ..coverUrl = json['coverUrl'] as String
    ..coverWidth = json['coverWidth'] as int
    ..coverHeight = json['coverHeight'] as int
    ..coverColor = json['coverColor'] as int
    ..talk = json['talk'] == null
        ? null
        : Talk.fromJson(json['talk'] as Map<String, dynamic>)
    ..text = json['text'] as String;
}

Map<String, dynamic> _$MyLogBaseDataToJson(MyLogBaseData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pubTime': instance.pubTime,
      'type': instance.type,
      'coverUrl': instance.coverUrl,
      'coverWidth': instance.coverWidth,
      'coverHeight': instance.coverHeight,
      'coverColor': instance.coverColor,
      'talk': instance.talk,
      'text': instance.text,
    };

MyLogResourceExt _$MyLogResourceExtFromJson(Map<String, dynamic> json) {
  return MyLogResourceExt()
    ..likedCount = json['likedCount'] as int
    ..commentCount = json['commentCount'] as int;
}

Map<String, dynamic> _$MyLogResourceExtToJson(MyLogResourceExt instance) =>
    <String, dynamic>{
      'likedCount': instance.likedCount,
      'commentCount': instance.commentCount,
    };

MyLogResource _$MyLogResourceFromJson(Map<String, dynamic> json) {
  return MyLogResource()
    ..mlogBaseData = json['mlogBaseData'] == null
        ? null
        : MyLogBaseData.fromJson(json['mlogBaseData'] as Map<String, dynamic>)
    ..mlogExtVO = json['mlogExtVO'] == null
        ? null
        : MyLogResourceExt.fromJson(json['mlogExtVO'] as Map<String, dynamic>)
    ..userProfile = json['userProfile'] == null
        ? null
        : NeteaseAccountProfile.fromJson(
            json['userProfile'] as Map<String, dynamic>)
    ..shareUrl = json['shareUrl'] as String;
}

Map<String, dynamic> _$MyLogResourceToJson(MyLogResource instance) =>
    <String, dynamic>{
      'mlogBaseData': instance.mlogBaseData,
      'mlogExtVO': instance.mlogExtVO,
      'userProfile': instance.userProfile,
      'shareUrl': instance.shareUrl,
    };

MyLog _$MyLogFromJson(Map<String, dynamic> json) {
  return MyLog()
    ..id = dynamicToString(json['id'])
    ..type = json['type'] as int
    ..resource = json['resource'] == null
        ? null
        : MyLogResource.fromJson(json['resource'] as Map<String, dynamic>)
    ..alg = json['alg'] as String
    ..reason = json['reason'] as String
    ..matchField = json['matchField'] as int
    ..matchFieldContent = json['matchFieldContent'] as String
    ..sameCity = json['sameCity'] as bool;
}

Map<String, dynamic> _$MyLogToJson(MyLog instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'resource': instance.resource,
      'alg': instance.alg,
      'reason': instance.reason,
      'matchField': instance.matchField,
      'matchFieldContent': instance.matchFieldContent,
      'sameCity': instance.sameCity,
    };
