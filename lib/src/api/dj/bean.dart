import 'package:json_annotation/json_annotation.dart';
import 'package:netease_music_api/src/api/bean.dart';
import 'package:netease_music_api/src/netease_bean.dart';

part 'bean.g.dart';

@JsonSerializable()
class Dj {
  @JsonKey(fromJson: dynamicToString)
  late String id;

  late String nickName;
  late String avatarUrl;
  late int userType;

  late int rank;
  late int lastRank;
  late int score;

  Dj();

  factory Dj.fromJson(Map<String, dynamic> json) => _$DjFromJson(json);

  Map<String, dynamic> toJson() => _$DjToJson(this);
}

@JsonSerializable()
class DjRadio {
  @JsonKey(fromJson: dynamicToString)
  late String id;

  late String name;

  late NeteaseAccountProfile dj;

  late String picUrl;
  late String desc;

  late int subCount;
  late int commentCount;
  late int programCount;
  late int shareCount;
  late int likedCount;

  late int createTime;
  late int categoryId;
  late String category;

  late int radioFeeType;
  late int feeScope;

  late bool buyed;
  late bool finished;
  late bool underShelf;

  late int purchaseCount;
  late int price;
  late int originalPrice;
  late int lastProgramCreateTime;
  late String lastProgramName;
  late int lastProgramId;

  late bool composeVideo;

  late String alg;

  DjRadio();

  factory DjRadio.fromJson(Map<String, dynamic> json) =>
      _$DjRadioFromJson(json);

  Map<String, dynamic> toJson() => _$DjRadioToJson(this);
}

@JsonSerializable()
class DjProgram {
  @JsonKey(fromJson: dynamicToString)
  late String id;

  late String name;
  late String programDesc;

  late String coverUrl;
  late String blurCoverUrl;
  late String description;
  late String alg;
  late String commentThreadId;

  late int mainTrackId;
  late int pubStatus;
  late int bdAuditStatus;
  late int serialNum;
  late int duration;
  late int auditStatus;
  late int score;
  late int createTime;
  late int feeScope;
  late int listenerCount;
  late int subscribedCount;
  late int programFeeType;
  late int trackCount;
  late int smallLanguageAuditStatus;
  late int shareCount;
  late int likedCount;
  late int commentCount;

  late bool buyed;
  late bool isPublish;
  late bool subscribed;
  late bool canReward;
  late bool reward;

  late DjRadio radio;

  late Song mainSong;

  late NeteaseAccountProfile dj;

  DjProgram();

  factory DjProgram.fromJson(Map<String, dynamic> json) =>
      _$DjProgramFromJson(json);

  Map<String, dynamic> toJson() => _$DjProgramToJson(this);
}

@JsonSerializable()
class DjRadioCategory {
  @JsonKey(fromJson: dynamicToString)
  late String id;
  late String name;

  late String picMacUrl;
  late String picWebUrl;
  late String picUWPUrl;
  late String picIPadUrl;
  late String picPCBlackUrl;
  late String picPCWhiteUrl;
  late String pic56x56Url;
  late String pic84x84IdUrl;
  late String pic96x96Url;

  DjRadioCategory();

  factory DjRadioCategory.fromJson(Map<String, dynamic> json) =>
      _$DjRadioCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$DjRadioCategoryToJson(this);
}

@JsonSerializable()
class DjRadioCategory2 {
  @JsonKey(fromJson: dynamicToString)
  late String categoryId;
  late String categoryName;

  late List<DjRadio> radios;

  DjRadioCategory2();

  factory DjRadioCategory2.fromJson(Map<String, dynamic> json) =>
      _$DjRadioCategory2FromJson(json);

  Map<String, dynamic> toJson() => _$DjRadioCategory2ToJson(this);
}

@JsonSerializable()
class DjRadioCategoryWrap extends ServerStatusBean {
  late List<DjRadioCategory> categories;

  DjRadioCategoryWrap();

  factory DjRadioCategoryWrap.fromJson(Map<String, dynamic> json) =>
      _$DjRadioCategoryWrapFromJson(json);

  Map<String, dynamic> toJson() => _$DjRadioCategoryWrapToJson(this);
}

@JsonSerializable()
class DjRadioCategoryWrap2 extends ServerStatusBean {
  late List<DjRadioCategory2> data;

  DjRadioCategoryWrap2();

  factory DjRadioCategoryWrap2.fromJson(Map<String, dynamic> json) =>
      _$DjRadioCategoryWrap2FromJson(json);

  Map<String, dynamic> toJson() => _$DjRadioCategoryWrap2ToJson(this);
}

@JsonSerializable()
class DjRadioCategoryWrap3 extends ServerStatusBean {
  late List<DjRadioCategory> data;

  DjRadioCategoryWrap3();

  factory DjRadioCategoryWrap3.fromJson(Map<String, dynamic> json) =>
      _$DjRadioCategoryWrap3FromJson(json);

  Map<String, dynamic> toJson() => _$DjRadioCategoryWrap3ToJson(this);
}

@JsonSerializable()
class DjRadioListWrap extends ServerStatusListBean {
  late List<DjRadio> djRadios;

  late String name;

  late int subCount;

  DjRadioListWrap();

  factory DjRadioListWrap.fromJson(Map<String, dynamic> json) =>
      _$DjRadioListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$DjRadioListWrapToJson(this);
}

@JsonSerializable()
class DjRadioListWrap2 extends ServerStatusBean {
  late List<DjRadio> data;

  DjRadioListWrap2();

  factory DjRadioListWrap2.fromJson(Map<String, dynamic> json) =>
      _$DjRadioListWrap2FromJson(json);

  Map<String, dynamic> toJson() => _$DjRadioListWrap2ToJson(this);
}

@JsonSerializable()
class DjTopListListWrap {
  late List<Dj> list;

  late int total;
  late int updateTime;

  DjTopListListWrap();

  factory DjTopListListWrap.fromJson(Map<String, dynamic> json) =>
      _$DjTopListListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$DjTopListListWrapToJson(this);
}

@JsonSerializable()
class DjTopListListWrapX extends ServerStatusBean {
  late DjTopListListWrap data;

  DjTopListListWrapX();

  factory DjTopListListWrapX.fromJson(Map<String, dynamic> json) =>
      _$DjTopListListWrapXFromJson(json);

  Map<String, dynamic> toJson() => _$DjTopListListWrapXToJson(this);
}

@JsonSerializable()
class DjRadioTopListItem {
  @JsonKey(fromJson: dynamicToString)
  late String id;
  late String name;
  late String picUrl;
  late String creatorName;

  late int rank;
  late int lastRank;
  late int score;

  // [djRadioPayGiftTopList] 这个api独有数据
  late String rcmdText;
  late int radioFeeType;
  late int feeScope;
  late int programCount;
  late int originalPrice;
  late String alg;
  late String lastProgramName;

  DjRadioTopListItem();

  factory DjRadioTopListItem.fromJson(Map<String, dynamic> json) =>
      _$DjRadioTopListItemFromJson(json);

  Map<String, dynamic> toJson() => _$DjRadioTopListItemToJson(this);
}

@JsonSerializable()
class DjRadioTopListListWrap {
  late List<DjRadioTopListItem> list;

  late int total;
  late int updateTime;

  DjRadioTopListListWrap();

  factory DjRadioTopListListWrap.fromJson(Map<String, dynamic> json) =>
      _$DjRadioTopListListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$DjRadioTopListListWrapToJson(this);
}

@JsonSerializable()
class DjRadioTopListListWrapX extends ServerStatusBean {
  late DjRadioTopListListWrap data;

  DjRadioTopListListWrapX();

  factory DjRadioTopListListWrapX.fromJson(Map<String, dynamic> json) =>
      _$DjRadioTopListListWrapXFromJson(json);

  Map<String, dynamic> toJson() => _$DjRadioTopListListWrapXToJson(this);
}

@JsonSerializable()
class DjRadioDetail extends ServerStatusBean {
  late DjRadio data;

  DjRadioDetail();

  factory DjRadioDetail.fromJson(Map<String, dynamic> json) =>
      _$DjRadioDetailFromJson(json);

  Map<String, dynamic> toJson() => _$DjRadioDetailToJson(this);
}

@JsonSerializable()
class DjRadioTopListListWrapX2 extends ServerStatusBean {
  late List<DjRadio> toplist;

  late int updateTime;

  DjRadioTopListListWrapX2();

  factory DjRadioTopListListWrapX2.fromJson(Map<String, dynamic> json) =>
      _$DjRadioTopListListWrapX2FromJson(json);

  Map<String, dynamic> toJson() => _$DjRadioTopListListWrapX2ToJson(this);
}

@JsonSerializable()
class DjProgramListWrap extends ServerStatusListBean {
  late List<DjProgram> programs;

  late String name;

  DjProgramListWrap();

  factory DjProgramListWrap.fromJson(Map<String, dynamic> json) =>
      _$DjProgramListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$DjProgramListWrapToJson(this);
}

@JsonSerializable()
class DjProgramTopListItem {
  late DjProgram program;

  late int rank;
  late int lastRank;
  late int score;
  late int programFeeType;

  DjProgramTopListItem();

  factory DjProgramTopListItem.fromJson(Map<String, dynamic> json) =>
      _$DjProgramTopListItemFromJson(json);

  Map<String, dynamic> toJson() => _$DjProgramTopListItemToJson(this);
}

@JsonSerializable()
class DjProgramTopListListWrap2 extends ServerStatusBean {
  late List<DjProgramTopListItem> toplist;

  late int updateTime;

  DjProgramTopListListWrap2();

  factory DjProgramTopListListWrap2.fromJson(Map<String, dynamic> json) =>
      _$DjProgramTopListListWrap2FromJson(json);

  Map<String, dynamic> toJson() => _$DjProgramTopListListWrap2ToJson(this);
}

@JsonSerializable()
class PersonalizedDjProgramItem {
  @JsonKey(fromJson: dynamicToString)
  late String id;

  late String name;
  late String copywriter;
  late String picUrl;

  late bool canDislike;

  late int type;

  late DjProgram program;

  PersonalizedDjProgramItem();

  factory PersonalizedDjProgramItem.fromJson(Map<String, dynamic> json) =>
      _$PersonalizedDjProgramItemFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalizedDjProgramItemToJson(this);
}

@JsonSerializable()
class DjProgramTopListListWrap {
  late List<DjProgramTopListItem> list;

  late int total;
  late int updateTime;

  DjProgramTopListListWrap();

  factory DjProgramTopListListWrap.fromJson(Map<String, dynamic> json) =>
      _$DjProgramTopListListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$DjProgramTopListListWrapToJson(this);
}

@JsonSerializable()
class DjProgramTopListListWrapX extends ServerStatusBean {
  late DjProgramTopListListWrap data;

  DjProgramTopListListWrapX();

  factory DjProgramTopListListWrapX.fromJson(Map<String, dynamic> json) =>
      _$DjProgramTopListListWrapXFromJson(json);

  Map<String, dynamic> toJson() => _$DjProgramTopListListWrapXToJson(this);
}

@JsonSerializable()
class PersonalizedDjProgramListWrap extends ServerStatusBean {
  late int category;

  late List<PersonalizedDjProgramItem> result;

  PersonalizedDjProgramListWrap();

  factory PersonalizedDjProgramListWrap.fromJson(Map<String, dynamic> json) =>
      _$PersonalizedDjProgramListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalizedDjProgramListWrapToJson(this);
}

@JsonSerializable()
class DjProgramDetail extends ServerStatusBean {
  late DjProgram program;

  DjProgramDetail();

  factory DjProgramDetail.fromJson(Map<String, dynamic> json) =>
      _$DjProgramDetailFromJson(json);

  Map<String, dynamic> toJson() => _$DjProgramDetailToJson(this);
}
