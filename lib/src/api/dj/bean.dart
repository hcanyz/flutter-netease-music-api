import 'package:json_annotation/json_annotation.dart';
import 'package:netease_music_api/src/api/bean.dart';
import 'package:netease_music_api/src/netease_bean.dart';

part 'bean.g.dart';

@JsonSerializable()
class Dj {
  @JsonKey(fromJson: dynamicToString)
  String id;

  String name;

  NeteaseAccountProfile dj;

  String picUrl;
  String desc;

  int subCount;
  int commentCount;
  int programCount;
  int shareCount;
  int likedCount;

  int createTime;
  int categoryId;
  String category;

  int radioFeeType;
  int feeScope;

  bool buyed;
  bool finished;
  bool underShelf;

  int purchaseCount;
  int price;
  int originalPrice;
  int lastProgramCreateTime;
  String lastProgramName;
  int lastProgramId;

  bool composeVideo;

  String alg;

  Dj();

  factory Dj.fromJson(Map<String, dynamic> json) => _$DjFromJson(json);

  Map<String, dynamic> toJson() => _$DjToJson(this);
}

@JsonSerializable()
class DjProgram {
  @JsonKey(fromJson: dynamicToString)
  String id;

  String name;
  String programDesc;

  String coverUrl;
  String blurCoverUrl;
  String description;
  String alg;
  String commentThreadId;

  int mainTrackId;
  int pubStatus;
  int bdAuditStatus;
  int serialNum;
  int duration;
  int auditStatus;
  int score;
  int createTime;
  int feeScope;
  int listenerCount;
  int subscribedCount;
  int programFeeType;
  int trackCount;
  int smallLanguageAuditStatus;
  int shareCount;
  int likedCount;
  int commentCount;

  bool buyed;
  bool isPublish;
  bool subscribed;
  bool canReward;
  bool reward;

  Dj radio;

  Song mainSong;

  NeteaseAccountProfile dj;

  DjProgram();

  factory DjProgram.fromJson(Map<String, dynamic> json) =>
      _$DjProgramFromJson(json);

  Map<String, dynamic> toJson() => _$DjProgramToJson(this);
}

@JsonSerializable()
class DjListWrap extends ServerStatusListBean {
  List<Dj> djRadios;

  int subCount;
  int count;

  DjListWrap();

  factory DjListWrap.fromJson(Map<String, dynamic> json) =>
      _$DjListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$DjListWrapToJson(this);
}

@JsonSerializable()
class DjPayTopListItem {
  @JsonKey(fromJson: dynamicToString)
  String id;
  String name;
  String picUrl;
  String creatorName;

  int rank;
  int lastRank;
  int score;

  DjPayTopListItem();

  factory DjPayTopListItem.fromJson(Map<String, dynamic> json) =>
      _$DjPayTopListItemFromJson(json);

  Map<String, dynamic> toJson() => _$DjPayTopListItemToJson(this);
}

@JsonSerializable()
class DjPayTopListListWrap {
  List<DjPayTopListItem> list;

  int total;
  int updateTime;

  DjPayTopListListWrap();

  factory DjPayTopListListWrap.fromJson(Map<String, dynamic> json) =>
      _$DjPayTopListListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$DjPayTopListListWrapToJson(this);
}

@JsonSerializable()
class DjPayTopListListWrapX extends ServerStatusBean {
  DjPayTopListListWrap data;

  DjPayTopListListWrapX();

  factory DjPayTopListListWrapX.fromJson(Map<String, dynamic> json) =>
      _$DjPayTopListListWrapXFromJson(json);

  Map<String, dynamic> toJson() => _$DjPayTopListListWrapXToJson(this);
}

@JsonSerializable()
class DjProgramsListWrap extends ServerStatusListBean {
  List<DjProgram> programs;

  String name;

  DjProgramsListWrap();

  factory DjProgramsListWrap.fromJson(Map<String, dynamic> json) =>
      _$DjProgramsListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$DjProgramsListWrapToJson(this);
}

@JsonSerializable()
class DjProgramsTopListItem {
  DjProgram program;

  int rank;
  int lastRank;
  int score;
  int programFeeType;

  DjProgramsTopListItem();

  factory DjProgramsTopListItem.fromJson(Map<String, dynamic> json) =>
      _$DjProgramsTopListItemFromJson(json);

  Map<String, dynamic> toJson() => _$DjProgramsTopListItemToJson(this);
}

@JsonSerializable()
class DjProgramsTopListListWrap extends ServerStatusBean {
  List<DjProgramsTopListItem> toplist;

  int updateTime;

  DjProgramsTopListListWrap();

  factory DjProgramsTopListListWrap.fromJson(Map<String, dynamic> json) =>
      _$DjProgramsTopListListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$DjProgramsTopListListWrapToJson(this);
}

@JsonSerializable()
class PersonalizedDjItem {
  @JsonKey(fromJson: dynamicToString)
  String id;

  String name;
  String copywriter;
  String picUrl;

  bool canDislike;

  int type;

  DjProgram program;

  PersonalizedDjItem();

  factory PersonalizedDjItem.fromJson(Map<String, dynamic> json) =>
      _$PersonalizedDjItemFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalizedDjItemToJson(this);
}

@JsonSerializable()
class PersonalizedDjListWrap extends ServerStatusBean {
  int category;

  List<PersonalizedDjItem> result;

  PersonalizedDjListWrap();

  factory PersonalizedDjListWrap.fromJson(Map<String, dynamic> json) =>
      _$PersonalizedDjListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalizedDjListWrapToJson(this);
}
