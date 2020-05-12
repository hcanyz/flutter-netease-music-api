import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:netease_music_api/netease_music_api.dart';
import 'package:netease_music_api/src/api/bean.dart';
import 'package:netease_music_api/src/api/login/bean.dart';

part 'bean.g.dart';

@JsonSerializable()
class CommentThread {
  @JsonKey(fromJson: dynamicToString)
  String id;

  int resourceType;
  int commentCount;
  int likedCount;
  int shareCount;
  int hotCount;

  int resourceId;
  int resourceOwnerId;
  String resourceTitle;

  CommentThread();

  factory CommentThread.fromJson(Map<String, dynamic> json) =>
      _$CommentThreadFromJson(json);

  Map<String, dynamic> toJson() => _$CommentThreadToJson(this);
}

@JsonSerializable()
class EventItemInfo {
  String threadId;

  int resourceId;
  int resourceType;

  bool liked;
  int commentCount;
  int likedCount;
  int shareCount;

  CommentThread commentThread;

  EventItemInfo();

  factory EventItemInfo.fromJson(Map<String, dynamic> json) =>
      _$EventItemInfoFromJson(json);

  Map<String, dynamic> toJson() => _$EventItemInfoToJson(this);
}

@JsonSerializable()
class EventItem {
  @JsonKey(fromJson: dynamicToString)
  String id;

  String json;

  int type;

  int actId;
  int eventTime;
  int expireTime;
  int showTime;

  int insiteForwardCount;

  bool topEvent;

  NeteaseAccountProfile user;

  EventItemInfo info;

  EventItem();

  factory EventItem.fromJson(Map<String, dynamic> json) =>
      _$EventItemFromJson(json);

  Map<String, dynamic> toJson() => _$EventItemToJson(this);
}

@JsonSerializable()
class EventListWrap extends ServerStatusBean {
  List<EventItem> events;

  int lasttime;

  EventListWrap();

  factory EventListWrap.fromJson(Map<String, dynamic> json) =>
      _$EventListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$EventListWrapToJson(this);
}

@JsonSerializable()
class EventListWrap2 extends ServerStatusBean {
  List<EventItem> event;

  int lasttime;

  EventListWrap2();

  factory EventListWrap2.fromJson(Map<String, dynamic> json) =>
      _$EventListWrap2FromJson(json);

  Map<String, dynamic> toJson() => _$EventListWrap2ToJson(this);
}

@JsonSerializable()
class EventSingleWrap extends ServerStatusBean {
  EventItem event;

  EventSingleWrap();

  factory EventSingleWrap.fromJson(Map<String, dynamic> json) =>
      _$EventSingleWrapFromJson(json);

  Map<String, dynamic> toJson() => _$EventSingleWrapToJson(this);
}

@JsonSerializable()
class CommentItem {
  @JsonKey(fromJson: dynamicToString)
  String commentId;

  @JsonKey(fromJson: dynamicToString)
  String parentCommentId;

  NeteaseUserInfo user;

  String content;

  int time;

  int likedCount;
  bool liked;

  CommentItem();

  factory CommentItem.fromJson(Map<String, dynamic> json) =>
      _$CommentItemFromJson(json);

  Map<String, dynamic> toJson() => _$CommentItemToJson(this);
}

@JsonSerializable()
class CommentListWrap extends ServerStatusListBean {
  bool moreHot;
  int cnum;
  bool isMusician;

  @JsonKey(fromJson: dynamicToString)
  String userId;

  List<CommentItem> topComments;
  List<CommentItem> hotComments;
  List<CommentItem> comments;

  CommentListWrap();

  factory CommentListWrap.fromJson(Map<String, dynamic> json) =>
      _$CommentListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$CommentListWrapToJson(this);
}

@JsonSerializable()
class EventForwardRet {
  String msg;
  int eventId;
  int eventTime;

  EventForwardRet();

  factory EventForwardRet.fromJson(Map<String, dynamic> json) =>
      _$EventForwardRetFromJson(json);

  Map<String, dynamic> toJson() => _$EventForwardRetToJson(this);
}

@JsonSerializable()
class EventForwardRetWrap extends ServerStatusBean {
  EventForwardRet data;

  EventForwardRetWrap();

  factory EventForwardRetWrap.fromJson(Map<String, dynamic> json) =>
      _$EventForwardRetWrapFromJson(json);

  Map<String, dynamic> toJson() => _$EventForwardRetWrapToJson(this);
}

@JsonSerializable()
class TopicContent {
  @JsonKey(fromJson: dynamicToString)
  String id;

  int type;

  String content;

  TopicContent();

  factory TopicContent.fromJson(Map<String, dynamic> json) =>
      _$TopicContentFromJson(json);

  Map<String, dynamic> toJson() => _$TopicContentToJson(this);
}

@JsonSerializable()
class Topic {
  @JsonKey(fromJson: dynamicToString)
  String id;

  @JsonKey(fromJson: dynamicToString)
  String userId;

  List<TopicContent> content;
  String title;
  String wxTitle;
  String mainTitle;
  String startText;
  String summary;
  String adInfo;
  String recomdTitle;
  String recomdContent;

  int addTime;
  int pubTime;
  int updateTime;

  int cover;
  int headPic;
  int status;
  int seriesId;
  int categoryId;
  double hotScore;

  String auditor;
  int auditTime;
  int auditStatus;
  String delReason;

  int number;
  int readCount;

  int rectanglePic;

  List<String> tags;

  bool reward;
  bool fromBackend;
  bool showRelated;
  bool showComment;
  bool pubImmidiatly;

  Topic();

  factory Topic.fromJson(Map<String, dynamic> json) => _$TopicFromJson(json);

  Map<String, dynamic> toJson() => _$TopicToJson(this);
}

@JsonSerializable()
class TopicItem2 {
  @JsonKey(fromJson: dynamicToString)
  String id;

  Topic topic;

  NeteaseUserInfo creator;

  int number;
  int shareCount;
  int commentCount;
  int likedCount;
  int readCount;
  int rewardCount;
  double rewardMoney;

  String rectanglePicUrl;
  String coverUrl;

  int seriesId;
  int categoryId;
  String categoryName;

  String url;
  String wxTitle;
  String mainTitle;
  String title;
  String summary;
  String shareContent;
  String recmdTitle;
  String recmdContent;

  List<String> tags;

  int addTime;

  String commentThreadId;

  bool showRelated;
  bool showComment;
  bool reward;
  bool liked;

  TopicItem2();

  factory TopicItem2.fromJson(Map<String, dynamic> json) =>
      _$TopicItem2FromJson(json);

  Map<String, dynamic> toJson() => _$TopicItem2ToJson(this);
}

@JsonSerializable()
class TopicItem {
  @JsonKey(fromJson: dynamicToString)
  String actId;

  String title;

  List<String> text;

  String reason;

  String sharePicUrl;

  int participateCount;

  //featured TopicQualityScore
  String alg;

  TopicItem();

  factory TopicItem.fromJson(Map<String, dynamic> json) =>
      _$TopicItemFromJson(json);

  Map<String, dynamic> toJson() => _$TopicItemToJson(this);
}

@JsonSerializable()
class TopicHotListWrap extends ServerStatusBean {
  List<TopicItem> hot;

  TopicHotListWrap();

  factory TopicHotListWrap.fromJson(Map<String, dynamic> json) =>
      _$TopicHotListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$TopicHotListWrapToJson(this);
}

@JsonSerializable()
class SimpleResourceInfo {
  @JsonKey(fromJson: dynamicToString)
  String songId;

  String threadId;

  String songCoverUrl;

  String name;

  Song song;

  SimpleResourceInfo();

  factory SimpleResourceInfo.fromJson(Map<String, dynamic> json) =>
      _$SimpleResourceInfoFromJson(json);

  Map<String, dynamic> toJson() => _$SimpleResourceInfoToJson(this);
}

@JsonSerializable()
class HotwallCommentItem {
  @JsonKey(fromJson: dynamicToString)
  String id;

  String threadId;

  String content;

  int time;

  bool liked;

  int likedCount;
  int replyCount;

  NeteaseSimpleUserInfo simpleUserInfo;

  SimpleResourceInfo simpleResourceInfo;

  HotwallCommentItem();

  factory HotwallCommentItem.fromJson(Map<String, dynamic> json) =>
      _$HotwallCommentItemFromJson(json);

  Map<String, dynamic> toJson() => _$HotwallCommentItemToJson(this);
}

@JsonSerializable()
class HotwallCommentListWrap extends ServerStatusBean {
  List<HotwallCommentItem> data;

  HotwallCommentListWrap();

  factory HotwallCommentListWrap.fromJson(Map<String, dynamic> json) =>
      _$HotwallCommentListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$HotwallCommentListWrapToJson(this);
}

@JsonSerializable()
class Comment {
  @JsonKey(fromJson: dynamicToString)
  String commentId;

  NeteaseUserInfo user;
  NeteaseUserInfo beRepliedUser;

  String expressionUrl;

  int commentLocationType;

  int time;

  String content;

  Comment();

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  Map<String, dynamic> toJson() => _$CommentToJson(this);
}

@JsonSerializable()
class CommentWrap extends ServerStatusBean {
  Comment comment;

  CommentWrap();

  factory CommentWrap.fromJson(Map<String, dynamic> json) =>
      _$CommentWrapFromJson(json);

  Map<String, dynamic> toJson() => _$CommentWrapToJson(this);
}

@JsonSerializable()
class MsgPromotion {
  @JsonKey(fromJson: dynamicToString)
  String id;

  String title;
  String coverUrl;
  String text;
  String url;

  int addTime;

  MsgPromotion();

  factory MsgPromotion.fromJson(Map<String, dynamic> json) =>
      _$MsgPromotionFromJson(json);

  Map<String, dynamic> toJson() => _$MsgPromotionToJson(this);
}

@JsonSerializable()
class MsgGeneral {
  String title;
  String subTitle;
  String tag;
  String subTag;
  String noticeMsg;
  String inboxBriefContent;
  String webUrl;
  String nativeUrl;
  String cover;
  String resName;

  int channel;
  int subType;
  bool canPlay;

  MsgGeneral();

  factory MsgGeneral.fromJson(Map<String, dynamic> json) =>
      _$MsgGeneralFromJson(json);

  Map<String, dynamic> toJson() => _$MsgGeneralToJson(this);
}

@JsonSerializable()
class MsgContent {
  String msg;
  String title;
  String pushMsg;
  int type;
  int resType;

  bool newPub;

  // type={6} ~

  //type={12}
  MsgPromotion promotionUrl;

  //type={23}
  MsgGeneral generalMsg;

  //type={7}
  Mv3 mv;

  MsgContent();

  factory MsgContent.fromJson(Map<String, dynamic> json) =>
      _$MsgContentFromJson(json);

  Map<String, dynamic> toJson() => _$MsgContentToJson(this);
}

@JsonSerializable()
class Msg {
  NeteaseUserInfo fromUser;
  NeteaseUserInfo toUser;

  String lastMsg;

  bool noticeAccountFlag;

  int lastMsgTime;
  int newMsgCount;

  MsgContent get msgObj {
    return MsgContent.fromJson(jsonDecode(lastMsg));
  }

  Msg();

  factory Msg.fromJson(Map<String, dynamic> json) => _$MsgFromJson(json);

  Map<String, dynamic> toJson() => _$MsgToJson(this);
}

@JsonSerializable()
class Msg2 {
  @JsonKey(fromJson: dynamicToString)
  String id;

  NeteaseUserInfo fromUser;
  NeteaseUserInfo toUser;

  String msg;

  int time;
  int batchId;

  MsgContent get msgObj {
    return MsgContent.fromJson(jsonDecode(msg));
  }

  Msg2();

  factory Msg2.fromJson(Map<String, dynamic> json) => _$Msg2FromJson(json);

  Map<String, dynamic> toJson() => _$Msg2ToJson(this);
}

@JsonSerializable()
class UsersMsgListWrap extends ServerStatusBean {
  List<Msg> msgs;

  UsersMsgListWrap();

  factory UsersMsgListWrap.fromJson(Map<String, dynamic> json) =>
      _$UsersMsgListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$UsersMsgListWrapToJson(this);
}

@JsonSerializable()
class UserMsgListWrap extends ServerStatusBean {
  List<Msg2> msgs;

  bool isArtist;
  bool isSubed;
  bool more;

  UserMsgListWrap();

  factory UserMsgListWrap.fromJson(Map<String, dynamic> json) =>
      _$UserMsgListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$UserMsgListWrapToJson(this);
}

@JsonSerializable()
class UserMsgListWrap2 extends ServerStatusBean {
  @JsonKey(fromJson: dynamicToString)
  String id;

  List<Msg2> newMsgs;

  //sendblacklist
  //blacklist

  UserMsgListWrap2();

  factory UserMsgListWrap2.fromJson(Map<String, dynamic> json) =>
      _$UserMsgListWrap2FromJson(json);

  Map<String, dynamic> toJson() => _$UserMsgListWrap2ToJson(this);
}
