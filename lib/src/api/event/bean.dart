import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:netease_music_api/netease_music_api.dart';
import 'package:netease_music_api/src/api/bean.dart';
import 'package:netease_music_api/src/api/login/bean.dart';

part 'bean.g.dart';

@JsonSerializable()
class CommentThread {
  @JsonKey(fromJson: dynamicToString)
  late String id;

  late int resourceType;
  late int commentCount;
  late int likedCount;
  late int shareCount;
  late int hotCount;

  late int resourceId;
  late int resourceOwnerId;
  late String resourceTitle;

  CommentThread();

  factory CommentThread.fromJson(Map<String, dynamic> json) =>
      _$CommentThreadFromJson(json);

  Map<String, dynamic> toJson() => _$CommentThreadToJson(this);
}

@JsonSerializable()
class EventItemInfo {
  late String threadId;

  late int resourceId;
  late int resourceType;

  late bool liked;
  late int commentCount;
  late int likedCount;
  late int shareCount;

  late CommentThread commentThread;

  EventItemInfo();

  factory EventItemInfo.fromJson(Map<String, dynamic> json) =>
      _$EventItemInfoFromJson(json);

  Map<String, dynamic> toJson() => _$EventItemInfoToJson(this);
}

@JsonSerializable()
class EventItem {
  @JsonKey(fromJson: dynamicToString)
  late String id;

  late String actName;
  late String json;

  late int type;

  late int actId;
  late int eventTime;
  late int expireTime;
  late int showTime;
  late int forwardCount;
  late int sic;

  late int insiteForwardCount;

  late bool topEvent;

  late NeteaseAccountProfile user;

  late EventItemInfo info;

  EventItem();

  factory EventItem.fromJson(Map<String, dynamic> json) =>
      _$EventItemFromJson(json);

  Map<String, dynamic> toJson() => _$EventItemToJson(this);
}

@JsonSerializable()
class EventListWrap extends ServerStatusBean {
  late List<EventItem> events;

  late int lasttime;

  EventListWrap();

  factory EventListWrap.fromJson(Map<String, dynamic> json) =>
      _$EventListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$EventListWrapToJson(this);
}

@JsonSerializable()
class EventListWrap2 extends ServerStatusBean {
  late List<EventItem> event;

  late int lasttime;

  EventListWrap2();

  factory EventListWrap2.fromJson(Map<String, dynamic> json) =>
      _$EventListWrap2FromJson(json);

  Map<String, dynamic> toJson() => _$EventListWrap2ToJson(this);
}

@JsonSerializable()
class EventSingleWrap extends ServerStatusBean {
  late EventItem event;

  EventSingleWrap();

  factory EventSingleWrap.fromJson(Map<String, dynamic> json) =>
      _$EventSingleWrapFromJson(json);

  Map<String, dynamic> toJson() => _$EventSingleWrapToJson(this);
}

@JsonSerializable()
class CommentItemBase {
  @JsonKey(fromJson: dynamicToString)
  late String commentId;

  @JsonKey(fromJson: dynamicToString)
  late String parentCommentId;

  late NeteaseUserInfo user;

  late List<BeRepliedCommentItem> beReplied;

  late String content;

  late int time;

  late int likedCount;
  late bool liked;

  // beReplied

  late int status;
  late int commentLocationType;

  CommentItemBase();

  factory CommentItemBase.fromJson(Map<String, dynamic> json) =>
      _$CommentItemBaseFromJson(json);

  Map<String, dynamic> toJson() => _$CommentItemBaseToJson(this);
}

@JsonSerializable()
class CommentItem extends CommentItemBase {
  late List<BeRepliedCommentItem> beReplied;

  CommentItem();

  factory CommentItem.fromJson(Map<String, dynamic> json) =>
      _$CommentItemFromJson(json);

  Map<String, dynamic> toJson() => _$CommentItemToJson(this);
}

@JsonSerializable()
class BeRepliedCommentItem extends CommentItemBase {
  @JsonKey(fromJson: dynamicToString)
  late String beRepliedCommentId;

  BeRepliedCommentItem();

  factory BeRepliedCommentItem.fromJson(Map<String, dynamic> json) =>
      _$BeRepliedCommentItemFromJson(json);

  Map<String, dynamic> toJson() => _$BeRepliedCommentItemToJson(this);
}

@JsonSerializable()
class CommentListWrap extends ServerStatusListBean {
  late bool moreHot;
  late int cnum;
  late bool isMusician;

  @JsonKey(fromJson: dynamicToString)
  late String userId;

  late List<CommentItem> topComments;
  late List<CommentItem> hotComments;
  late List<CommentItem> comments;

  CommentListWrap();

  factory CommentListWrap.fromJson(Map<String, dynamic> json) =>
      _$CommentListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$CommentListWrapToJson(this);
}

@JsonSerializable()
class CommentHistoryData {
  late bool hasMore;
  late bool reminder;

  late int commentCount;

  late List<CommentItem> hotComments;
  late List<CommentItem> comments;

  CommentHistoryData();

  factory CommentHistoryData.fromJson(Map<String, dynamic> json) =>
      _$CommentHistoryDataFromJson(json);

  Map<String, dynamic> toJson() => _$CommentHistoryDataToJson(this);
}

@JsonSerializable()
class CommentHistoryWrap extends ServerStatusBean {
  late CommentHistoryData data;

  CommentHistoryWrap();

  factory CommentHistoryWrap.fromJson(Map<String, dynamic> json) =>
      _$CommentHistoryWrapFromJson(json);

  Map<String, dynamic> toJson() => _$CommentHistoryWrapToJson(this);
}

@JsonSerializable()
class CommentList2DataSortType {
  late int sortType;
  late String sortTypeName;
  late String target;

  CommentList2DataSortType();

  factory CommentList2DataSortType.fromJson(Map<String, dynamic> json) =>
      _$CommentList2DataSortTypeFromJson(json);

  Map<String, dynamic> toJson() => _$CommentList2DataSortTypeToJson(this);
}

@JsonSerializable()
class CommentList2Data {
  late bool hasMore;

  late String cursor;
  late int totalCount;
  late int sortType;
  late List<CommentList2DataSortType> sortTypeList;

  late List<CommentItem> comments;
  late CommentItem currentComment;

  CommentList2Data();

  factory CommentList2Data.fromJson(Map<String, dynamic> json) =>
      _$CommentList2DataFromJson(json);

  Map<String, dynamic> toJson() => _$CommentList2DataToJson(this);
}

@JsonSerializable()
class CommentList2Wrap extends ServerStatusBean {
  late CommentList2Data data;

  CommentList2Wrap();

  factory CommentList2Wrap.fromJson(Map<String, dynamic> json) =>
      _$CommentList2WrapFromJson(json);

  Map<String, dynamic> toJson() => _$CommentList2WrapToJson(this);
}

@JsonSerializable()
class HugComment {
  late NeteaseUserInfo user;
  late String hugContent;

  HugComment();

  factory HugComment.fromJson(Map<String, dynamic> json) =>
      _$HugCommentFromJson(json);

  Map<String, dynamic> toJson() => _$HugCommentToJson(this);
}

@JsonSerializable()
class HugCommentListData {
  late bool hasMore;

  late String cursor;
  late int idCursor;
  late int hugTotalCounts;

  late List<HugComment> hugComments;
  late CommentItem currentComment;

  HugCommentListData();

  factory HugCommentListData.fromJson(Map<String, dynamic> json) =>
      _$HugCommentListDataFromJson(json);

  Map<String, dynamic> toJson() => _$HugCommentListDataToJson(this);
}

@JsonSerializable()
class HugCommentListWrap extends ServerStatusBean {
  late HugCommentListData data;

  HugCommentListWrap();

  factory HugCommentListWrap.fromJson(Map<String, dynamic> json) =>
      _$HugCommentListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$HugCommentListWrapToJson(this);
}

@JsonSerializable()
class FloorCommentDetail {
  late List<CommentItem> comments;

  late bool hasMore;
  late int totalCount;
  late int time;

  late CommentItem ownerComment;

  FloorCommentDetail();

  factory FloorCommentDetail.fromJson(Map<String, dynamic> json) =>
      _$FloorCommentDetailFromJson(json);

  Map<String, dynamic> toJson() => _$FloorCommentDetailToJson(this);
}

@JsonSerializable()
class FloorCommentDetailWrap extends ServerStatusBean {
  late FloorCommentDetail data;

  FloorCommentDetailWrap();

  factory FloorCommentDetailWrap.fromJson(Map<String, dynamic> json) =>
      _$FloorCommentDetailWrapFromJson(json);

  Map<String, dynamic> toJson() => _$FloorCommentDetailWrapToJson(this);
}

@JsonSerializable()
class EventForwardRet {
  late String msg;
  late int eventId;
  late int eventTime;

  EventForwardRet();

  factory EventForwardRet.fromJson(Map<String, dynamic> json) =>
      _$EventForwardRetFromJson(json);

  Map<String, dynamic> toJson() => _$EventForwardRetToJson(this);
}

@JsonSerializable()
class EventForwardRetWrap extends ServerStatusBean {
  late EventForwardRet data;

  EventForwardRetWrap();

  factory EventForwardRetWrap.fromJson(Map<String, dynamic> json) =>
      _$EventForwardRetWrapFromJson(json);

  Map<String, dynamic> toJson() => _$EventForwardRetWrapToJson(this);
}

@JsonSerializable()
class TopicContent {
  @JsonKey(fromJson: dynamicToString)
  late String id;

  late int type;

  late String content;

  TopicContent();

  factory TopicContent.fromJson(Map<String, dynamic> json) =>
      _$TopicContentFromJson(json);

  Map<String, dynamic> toJson() => _$TopicContentToJson(this);
}

@JsonSerializable()
class Topic {
  @JsonKey(fromJson: dynamicToString)
  late String id;

  @JsonKey(fromJson: dynamicToString)
  late String userId;

  late List<TopicContent> content;
  late String title;
  late String wxTitle;
  late String mainTitle;
  late String startText;
  late String summary;
  late String adInfo;
  late String recomdTitle;
  late String recomdContent;

  late int addTime;
  late int pubTime;
  late int updateTime;

  late int cover;
  late int headPic;
  late int status;
  late int seriesId;
  late int categoryId;
  late double hotScore;

  late String auditor;
  late int auditTime;
  late int auditStatus;
  late String delReason;

  late int number;
  late int readCount;

  late int rectanglePic;

  late List<String> tags;

  late bool reward;
  late bool fromBackend;
  late bool showRelated;
  late bool showComment;
  late bool pubImmidiatly;

  Topic();

  factory Topic.fromJson(Map<String, dynamic> json) => _$TopicFromJson(json);

  Map<String, dynamic> toJson() => _$TopicToJson(this);
}

@JsonSerializable()
class TopicItem2 {
  @JsonKey(fromJson: dynamicToString)
  late String id;

  late Topic topic;

  late NeteaseUserInfo creator;

  late int number;
  late int shareCount;
  late int commentCount;
  late int likedCount;
  late int readCount;
  late int rewardCount;
  late double rewardMoney;

  late String rectanglePicUrl;
  late String coverUrl;

  late int seriesId;
  late int categoryId;
  late String categoryName;

  late String url;
  late String wxTitle;
  late String mainTitle;
  late String title;
  late String summary;
  late String shareContent;
  late String recmdTitle;
  late String recmdContent;

  late List<String> tags;

  late int addTime;

  late String commentThreadId;

  late bool showRelated;
  late bool showComment;
  late bool reward;
  late bool liked;

  TopicItem2();

  factory TopicItem2.fromJson(Map<String, dynamic> json) =>
      _$TopicItem2FromJson(json);

  Map<String, dynamic> toJson() => _$TopicItem2ToJson(this);
}

@JsonSerializable()
class TopicItem {
  @JsonKey(fromJson: dynamicToString)
  late String actId;

  late String title;

  late List<String> text;

  late String reason;

  late int participateCount;

  late bool isDefaultImg;

  //featured TopicQualityScore
  late String alg;

  late int startTime;

  late int endTime;

  late int resourceType;

  late int videoType;

  late int topicType;

  late int meetingBeginTime;

  late int meetingEndTime;

  late String coverPCLongUrl;

  late String sharePicUrl;

  late String coverPCUrl;

  late String coverMobileUrl;

  late String coverPCListUrl;

  TopicItem();

  factory TopicItem.fromJson(Map<String, dynamic> json) =>
      _$TopicItemFromJson(json);

  Map<String, dynamic> toJson() => _$TopicItemToJson(this);
}

@JsonSerializable()
class TopicHotListWrap extends ServerStatusBean {
  late List<TopicItem> hot;

  TopicHotListWrap();

  factory TopicHotListWrap.fromJson(Map<String, dynamic> json) =>
      _$TopicHotListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$TopicHotListWrapToJson(this);
}

@JsonSerializable()
class TopicDetailWrap extends ServerStatusBean {
  late TopicItem act;

  late bool needBeginNotify;

  TopicDetailWrap();

  factory TopicDetailWrap.fromJson(Map<String, dynamic> json) =>
      _$TopicDetailWrapFromJson(json);

  Map<String, dynamic> toJson() => _$TopicDetailWrapToJson(this);
}

@JsonSerializable()
class SimpleResourceInfo {
  @JsonKey(fromJson: dynamicToString)
  late String songId;

  late String threadId;

  late String songCoverUrl;

  late String name;

  late Song song;

  SimpleResourceInfo();

  factory SimpleResourceInfo.fromJson(Map<String, dynamic> json) =>
      _$SimpleResourceInfoFromJson(json);

  Map<String, dynamic> toJson() => _$SimpleResourceInfoToJson(this);
}

@JsonSerializable()
class HotwallCommentItem {
  @JsonKey(fromJson: dynamicToString)
  late String id;

  late String threadId;

  late String content;

  late int time;

  late bool liked;

  late int likedCount;
  late int replyCount;

  late NeteaseSimpleUserInfo simpleUserInfo;

  late SimpleResourceInfo simpleResourceInfo;

  HotwallCommentItem();

  factory HotwallCommentItem.fromJson(Map<String, dynamic> json) =>
      _$HotwallCommentItemFromJson(json);

  Map<String, dynamic> toJson() => _$HotwallCommentItemToJson(this);
}

@JsonSerializable()
class HotwallCommentListWrap extends ServerStatusBean {
  late List<HotwallCommentItem> data;

  HotwallCommentListWrap();

  factory HotwallCommentListWrap.fromJson(Map<String, dynamic> json) =>
      _$HotwallCommentListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$HotwallCommentListWrapToJson(this);
}

@JsonSerializable()
class CommentSimple {
  @JsonKey(fromJson: dynamicToString)
  late String commentId;

  late String content;

  late String threadId;

  @JsonKey(fromJson: dynamicToString)
  late String userId;

  late String userName;

  CommentSimple();

  factory CommentSimple.fromJson(Map<String, dynamic> json) =>
      _$CommentSimpleFromJson(json);

  Map<String, dynamic> toJson() => _$CommentSimpleToJson(this);
}

@JsonSerializable()
class Comment {
  @JsonKey(fromJson: dynamicToString)
  late String commentId;

  late NeteaseUserInfo user;
  late NeteaseUserInfo beRepliedUser;

  late String expressionUrl;

  late int commentLocationType;

  late int time;

  late String content;

  Comment();

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  Map<String, dynamic> toJson() => _$CommentToJson(this);
}

@JsonSerializable()
class CommentWrap extends ServerStatusBean {
  late Comment comment;

  CommentWrap();

  factory CommentWrap.fromJson(Map<String, dynamic> json) =>
      _$CommentWrapFromJson(json);

  Map<String, dynamic> toJson() => _$CommentWrapToJson(this);
}

@JsonSerializable()
class MsgPromotion {
  @JsonKey(fromJson: dynamicToString)
  late String id;

  late String title;
  late String coverUrl;
  late String text;
  late String url;

  late int addTime;

  MsgPromotion();

  factory MsgPromotion.fromJson(Map<String, dynamic> json) =>
      _$MsgPromotionFromJson(json);

  Map<String, dynamic> toJson() => _$MsgPromotionToJson(this);
}

@JsonSerializable()
class MsgGeneral {
  late String title;
  late String subTitle;
  late String tag;
  late String subTag;
  late String noticeMsg;
  late String inboxBriefContent;
  late String webUrl;
  late String nativeUrl;
  late String cover;
  late String resName;

  late int channel;
  late int subType;
  late bool canPlay;

  MsgGeneral();

  factory MsgGeneral.fromJson(Map<String, dynamic> json) =>
      _$MsgGeneralFromJson(json);

  Map<String, dynamic> toJson() => _$MsgGeneralToJson(this);
}

@JsonSerializable()
class MsgContent {
  late String msg;
  late String title;
  late String pushMsg;
  late int type;
  late int resType;

  late bool newPub;

  // type={6} ~

  //type={12}
  late MsgPromotion promotionUrl;

  //type={23}
  late MsgGeneral generalMsg;

  //type={7}
  late Mv3 mv;

  MsgContent();

  factory MsgContent.fromJson(Map<String, dynamic> json) =>
      _$MsgContentFromJson(json);

  Map<String, dynamic> toJson() => _$MsgContentToJson(this);
}

@JsonSerializable()
class Msg {
  late NeteaseUserInfo fromUser;
  late NeteaseUserInfo toUser;

  late String lastMsg;

  late bool noticeAccountFlag;

  late int lastMsgTime;
  late int newMsgCount;

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
  late String id;

  late NeteaseUserInfo fromUser;
  late NeteaseUserInfo toUser;

  late String msg;

  late int time;
  late int batchId;

  MsgContent get msgObj {
    return MsgContent.fromJson(jsonDecode(msg));
  }

  Msg2();

  factory Msg2.fromJson(Map<String, dynamic> json) => _$Msg2FromJson(json);

  Map<String, dynamic> toJson() => _$Msg2ToJson(this);
}

@JsonSerializable()
class UsersMsgListWrap extends ServerStatusBean {
  late List<Msg> msgs;

  UsersMsgListWrap();

  factory UsersMsgListWrap.fromJson(Map<String, dynamic> json) =>
      _$UsersMsgListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$UsersMsgListWrapToJson(this);
}

@JsonSerializable()
class RecentContactUsersData {
  late List<NeteaseAccountProfile> follow;

  RecentContactUsersData();

  factory RecentContactUsersData.fromJson(Map<String, dynamic> json) =>
      _$RecentContactUsersDataFromJson(json);

  Map<String, dynamic> toJson() => _$RecentContactUsersDataToJson(this);
}

@JsonSerializable()
class RecentContactUsersWrap extends ServerStatusBean {
  late RecentContactUsersData data;

  RecentContactUsersWrap();

  factory RecentContactUsersWrap.fromJson(Map<String, dynamic> json) =>
      _$RecentContactUsersWrapFromJson(json);

  Map<String, dynamic> toJson() => _$RecentContactUsersWrapToJson(this);
}

@JsonSerializable()
class UserMsgListWrap extends ServerStatusBean {
  late List<Msg2> msgs;

  late bool isArtist;
  late bool isSubed;
  late bool more;

  UserMsgListWrap();

  factory UserMsgListWrap.fromJson(Map<String, dynamic> json) =>
      _$UserMsgListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$UserMsgListWrapToJson(this);
}

@JsonSerializable()
class UserMsgListWrap2 extends ServerStatusBean {
  @JsonKey(fromJson: dynamicToString)
  late String id;

  late List<Msg2> newMsgs;

  //sendblacklist
  //blacklist

  UserMsgListWrap2();

  factory UserMsgListWrap2.fromJson(Map<String, dynamic> json) =>
      _$UserMsgListWrap2FromJson(json);

  Map<String, dynamic> toJson() => _$UserMsgListWrap2ToJson(this);
}

@JsonSerializable()
class Cover {
  late int width;
  late int height;
  late String url;

  Cover();

  factory Cover.fromJson(Map<String, dynamic> json) => _$CoverFromJson(json);

  Map<String, dynamic> toJson() => _$CoverToJson(this);
}

@JsonSerializable()
class Talk {
  @JsonKey(fromJson: dynamicToString)
  late String talkId;
  late String talkName;
  late String talkDes;
  late Cover shareCover;
  late Cover showCover;

  late int status;
  late int mlogCount;
  late int follows;
  late int participations;
  late int showParticipations;
  late bool isFollow;

  late String alg;

  Talk();

  factory Talk.fromJson(Map<String, dynamic> json) => _$TalkFromJson(json);

  Map<String, dynamic> toJson() => _$TalkToJson(this);
}

@JsonSerializable()
class MyLogBaseData {
  @JsonKey(fromJson: dynamicToString)
  late String id;

  late int pubTime;
  late int type;

  late String coverUrl;
  late int coverWidth;
  late int coverHeight;
  late int coverColor;

  late Talk talk;

  late String text;

  MyLogBaseData();

  factory MyLogBaseData.fromJson(Map<String, dynamic> json) =>
      _$MyLogBaseDataFromJson(json);

  Map<String, dynamic> toJson() => _$MyLogBaseDataToJson(this);
}

@JsonSerializable()
class MyLogResourceExt {
  late int likedCount;
  late int commentCount;

  MyLogResourceExt();

  factory MyLogResourceExt.fromJson(Map<String, dynamic> json) =>
      _$MyLogResourceExtFromJson(json);

  Map<String, dynamic> toJson() => _$MyLogResourceExtToJson(this);
}

@JsonSerializable()
class MyLogResource {
  late MyLogBaseData mlogBaseData;
  late MyLogResourceExt mlogExtVO;
  late NeteaseAccountProfile userProfile;

  late int status;
  late String shareUrl;

  MyLogResource();

  factory MyLogResource.fromJson(Map<String, dynamic> json) =>
      _$MyLogResourceFromJson(json);

  Map<String, dynamic> toJson() => _$MyLogResourceToJson(this);
}

@JsonSerializable()
class MyLog {
  @JsonKey(fromJson: dynamicToString)
  late String id;

  late int type;

  late MyLogResource resource;

  late String alg;
  late String reason;
  late int matchField;
  late String matchFieldContent;
  late bool sameCity;

  MyLog();

  factory MyLog.fromJson(Map<String, dynamic> json) => _$MyLogFromJson(json);

  Map<String, dynamic> toJson() => _$MyLogToJson(this);
}

@JsonSerializable()
class MyLogMyLikeData extends ServerStatusBean {
  late List<MyLogResource> feeds;

  late int time;
  late bool more;

  MyLogMyLikeData();

  factory MyLogMyLikeData.fromJson(Map<String, dynamic> json) =>
      _$MyLogMyLikeDataFromJson(json);

  Map<String, dynamic> toJson() => _$MyLogMyLikeDataToJson(this);
}

@JsonSerializable()
class MyLogMyLikeWrap extends ServerStatusBean {
  late MyLogMyLikeData data;

  MyLogMyLikeWrap();

  factory MyLogMyLikeWrap.fromJson(Map<String, dynamic> json) =>
      _$MyLogMyLikeWrapFromJson(json);

  Map<String, dynamic> toJson() => _$MyLogMyLikeWrapToJson(this);
}
