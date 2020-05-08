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
