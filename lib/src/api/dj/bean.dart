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

  Song mainSong;

  NeteaseAccountProfile dj;

  DjProgram();

  factory DjProgram.fromJson(Map<String, dynamic> json) =>
      _$DjProgramFromJson(json);

  Map<String, dynamic> toJson() => _$DjProgramToJson(this);
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
