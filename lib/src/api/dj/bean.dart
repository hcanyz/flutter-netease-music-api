import 'package:json_annotation/json_annotation.dart';
import 'package:netease_music_api/src/api/bean.dart';
import 'package:netease_music_api/src/netease_bean.dart';

part 'bean.g.dart';

@JsonSerializable()
class Dj {
  @JsonKey(fromJson: dynamicToString)
  String id;

  String nickName;
  String avatarUrl;
  int userType;

  int rank;
  int lastRank;
  int score;

  Dj();

  factory Dj.fromJson(Map<String, dynamic> json) => _$DjFromJson(json);

  Map<String, dynamic> toJson() => _$DjToJson(this);
}

@JsonSerializable()
class DjRadio {
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

  DjRadio();

  factory DjRadio.fromJson(Map<String, dynamic> json) =>
      _$DjRadioFromJson(json);

  Map<String, dynamic> toJson() => _$DjRadioToJson(this);
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

  DjRadio radio;

  Song mainSong;

  NeteaseAccountProfile dj;

  DjProgram();

  factory DjProgram.fromJson(Map<String, dynamic> json) =>
      _$DjProgramFromJson(json);

  Map<String, dynamic> toJson() => _$DjProgramToJson(this);
}

@JsonSerializable()
class DjRadioCategory {
  @JsonKey(fromJson: dynamicToString)
  String id;
  String name;

  String picMacUrl;
  String picWebUrl;
  String picUWPUrl;
  String picIPadUrl;
  String picPCBlackUrl;
  String picPCWhiteUrl;
  String pic56x56Url;
  String pic84x84IdUrl;
  String pic96x96Url;

  DjRadioCategory();

  factory DjRadioCategory.fromJson(Map<String, dynamic> json) =>
      _$DjRadioCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$DjRadioCategoryToJson(this);
}

@JsonSerializable()
class DjRadioCategory2 {
  @JsonKey(fromJson: dynamicToString)
  String categoryId;
  String categoryName;

  List<DjRadio> radios;

  DjRadioCategory2();

  factory DjRadioCategory2.fromJson(Map<String, dynamic> json) =>
      _$DjRadioCategory2FromJson(json);

  Map<String, dynamic> toJson() => _$DjRadioCategory2ToJson(this);
}

@JsonSerializable()
class DjRadioCategoryWrap extends ServerStatusBean {
  List<DjRadioCategory> categories;

  DjRadioCategoryWrap();

  factory DjRadioCategoryWrap.fromJson(Map<String, dynamic> json) =>
      _$DjRadioCategoryWrapFromJson(json);

  Map<String, dynamic> toJson() => _$DjRadioCategoryWrapToJson(this);
}

@JsonSerializable()
class DjRadioCategoryWrap2 extends ServerStatusBean {
  List<DjRadioCategory2> data;

  DjRadioCategoryWrap2();

  factory DjRadioCategoryWrap2.fromJson(Map<String, dynamic> json) =>
      _$DjRadioCategoryWrap2FromJson(json);

  Map<String, dynamic> toJson() => _$DjRadioCategoryWrap2ToJson(this);
}

@JsonSerializable()
class DjRadioListWrap extends ServerStatusListBean {
  List<DjRadio> djRadios;

  String name;

  int subCount;

  DjRadioListWrap();

  factory DjRadioListWrap.fromJson(Map<String, dynamic> json) =>
      _$DjRadioListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$DjRadioListWrapToJson(this);
}

@JsonSerializable()
class DjTopListListWrap {
  List<Dj> list;

  int total;
  int updateTime;

  DjTopListListWrap();

  factory DjTopListListWrap.fromJson(Map<String, dynamic> json) =>
      _$DjTopListListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$DjTopListListWrapToJson(this);
}

@JsonSerializable()
class DjTopListListWrapX extends ServerStatusBean {
  DjTopListListWrap data;

  DjTopListListWrapX();

  factory DjTopListListWrapX.fromJson(Map<String, dynamic> json) =>
      _$DjTopListListWrapXFromJson(json);

  Map<String, dynamic> toJson() => _$DjTopListListWrapXToJson(this);
}

@JsonSerializable()
class DjRadioTopListItem {
  @JsonKey(fromJson: dynamicToString)
  String id;
  String name;
  String picUrl;
  String creatorName;

  int rank;
  int lastRank;
  int score;

  // [djRadioPayGiftTopList] 这个api独有数据
  String rcmdText;
  int radioFeeType;
  int feeScope;
  int programCount;
  int originalPrice;
  String alg;
  String lastProgramName;

  DjRadioTopListItem();

  factory DjRadioTopListItem.fromJson(Map<String, dynamic> json) =>
      _$DjRadioTopListItemFromJson(json);

  Map<String, dynamic> toJson() => _$DjRadioTopListItemToJson(this);
}

@JsonSerializable()
class DjRadioTopListListWrap {
  List<DjRadioTopListItem> list;

  int total;
  int updateTime;

  DjRadioTopListListWrap();

  factory DjRadioTopListListWrap.fromJson(Map<String, dynamic> json) =>
      _$DjRadioTopListListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$DjRadioTopListListWrapToJson(this);
}

@JsonSerializable()
class DjRadioTopListListWrapX extends ServerStatusBean {
  DjRadioTopListListWrap data;

  DjRadioTopListListWrapX();

  factory DjRadioTopListListWrapX.fromJson(Map<String, dynamic> json) =>
      _$DjRadioTopListListWrapXFromJson(json);

  Map<String, dynamic> toJson() => _$DjRadioTopListListWrapXToJson(this);
}

@JsonSerializable()
class DjRadioTopListListWrapX2 extends ServerStatusBean {
  List<DjRadio> toplist;

  int updateTime;

  DjRadioTopListListWrapX2();

  factory DjRadioTopListListWrapX2.fromJson(Map<String, dynamic> json) =>
      _$DjRadioTopListListWrapX2FromJson(json);

  Map<String, dynamic> toJson() => _$DjRadioTopListListWrapX2ToJson(this);
}

@JsonSerializable()
class DjProgramListWrap extends ServerStatusListBean {
  List<DjProgram> programs;

  String name;

  DjProgramListWrap();

  factory DjProgramListWrap.fromJson(Map<String, dynamic> json) =>
      _$DjProgramListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$DjProgramListWrapToJson(this);
}

@JsonSerializable()
class DjProgramTopListItem {
  DjProgram program;

  int rank;
  int lastRank;
  int score;
  int programFeeType;

  DjProgramTopListItem();

  factory DjProgramTopListItem.fromJson(Map<String, dynamic> json) =>
      _$DjProgramTopListItemFromJson(json);

  Map<String, dynamic> toJson() => _$DjProgramTopListItemToJson(this);
}

@JsonSerializable()
class DjProgramTopListListWrap2 extends ServerStatusBean {
  List<DjProgramTopListItem> toplist;

  int updateTime;

  DjProgramTopListListWrap2();

  factory DjProgramTopListListWrap2.fromJson(Map<String, dynamic> json) =>
      _$DjProgramTopListListWrap2FromJson(json);

  Map<String, dynamic> toJson() => _$DjProgramTopListListWrap2ToJson(this);
}

@JsonSerializable()
class PersonalizedDjProgramItem {
  @JsonKey(fromJson: dynamicToString)
  String id;

  String name;
  String copywriter;
  String picUrl;

  bool canDislike;

  int type;

  DjProgram program;

  PersonalizedDjProgramItem();

  factory PersonalizedDjProgramItem.fromJson(Map<String, dynamic> json) =>
      _$PersonalizedDjProgramItemFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalizedDjProgramItemToJson(this);
}

@JsonSerializable()
class DjProgramTopListListWrap {
  List<DjProgramTopListItem> list;

  int total;
  int updateTime;

  DjProgramTopListListWrap();

  factory DjProgramTopListListWrap.fromJson(Map<String, dynamic> json) =>
      _$DjProgramTopListListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$DjProgramTopListListWrapToJson(this);
}

@JsonSerializable()
class DjProgramTopListListWrapX extends ServerStatusBean {
  DjProgramTopListListWrap data;

  DjProgramTopListListWrapX();

  factory DjProgramTopListListWrapX.fromJson(Map<String, dynamic> json) =>
      _$DjProgramTopListListWrapXFromJson(json);

  Map<String, dynamic> toJson() => _$DjProgramTopListListWrapXToJson(this);
}

@JsonSerializable()
class PersonalizedDjProgramListWrap extends ServerStatusBean {
  int category;

  List<PersonalizedDjProgramItem> result;

  PersonalizedDjProgramListWrap();

  factory PersonalizedDjProgramListWrap.fromJson(Map<String, dynamic> json) =>
      _$PersonalizedDjProgramListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalizedDjProgramListWrapToJson(this);
}
