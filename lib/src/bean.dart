import 'package:json_annotation/json_annotation.dart';

part 'bean.g.dart';

@JsonSerializable()
class PlayListItem {
  @JsonKey(fromJson: _dynamicToString)
  String id;

  //歌单名
  String name;
  String description;
  String coverImgUrl;

  String tag;
  List<String> tags;
  String copywriter;

  int createTime;
  int updateTime;

  int playCount;
  int subscribedCount;
  int shareCount;
  int commentCount;

  int trackCount;
  int trackNumberUpdateTime;

  PlayListCreator creator;

  List<PlayListSubscriber> subscribers;

  PlayListItem();

  factory PlayListItem.fromJson(Map<String, dynamic> json) =>
      _$PlayListItemFromJson(json);

  Map<String, dynamic> toJson() => _$PlayListItemToJson(this);
}

@JsonSerializable()
class NeteaseUserInfo {
  @JsonKey(fromJson: _dynamicToString)
  String userId;
  String nickname;
  String avatarUrl;
  String signature;

  int city;
  int province;

  String backgroundUrl;

  List<String> expertTags;

  NeteaseUserInfo();

  factory NeteaseUserInfo.fromJson(Map<String, dynamic> json) =>
      _$NeteaseUserInfoFromJson(json);

  Map<String, dynamic> toJson() => _$NeteaseUserInfoToJson(this);
}

@JsonSerializable()
class PlayListCreator extends NeteaseUserInfo {
  PlayListCreator();

  factory PlayListCreator.fromJson(Map<String, dynamic> json) =>
      _$PlayListCreatorFromJson(json);

  Map<String, dynamic> toJson() => _$PlayListCreatorToJson(this);
}

@JsonSerializable()
class PlayListSubscriber extends NeteaseUserInfo {
  PlayListSubscriber();

  factory PlayListSubscriber.fromJson(Map<String, dynamic> json) =>
      _$PlayListSubscriberFromJson(json);

  Map<String, dynamic> toJson() => _$PlayListSubscriberToJson(this);
}

@JsonSerializable()
class HighqualityPlayListWrap extends ServerStatusBean {
  List<PlayListItem> playlists;

  HighqualityPlayListWrap();

  factory HighqualityPlayListWrap.fromJson(Map<String, dynamic> json) =>
      _$HighqualityPlayListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$HighqualityPlayListWrapToJson(this);
}

@JsonSerializable()
class CategoryPlayListWrap extends ServerStatusBean {
  PlayListItem playlist;

  CategoryPlayListWrap();

  factory CategoryPlayListWrap.fromJson(Map<String, dynamic> json) =>
      _$CategoryPlayListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryPlayListWrapToJson(this);
}

String _dynamicToString(dynamic value) => value?.toString();

@JsonSerializable()
class ServerStatusBean {
  int code;

  ServerStatusBean();

  factory ServerStatusBean.fromJson(Map<String, dynamic> json) =>
      _$ServerStatusBeanFromJson(json);

  Map<String, dynamic> toJson() => _$ServerStatusBeanToJson(this);
}
