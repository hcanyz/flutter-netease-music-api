import 'package:json_annotation/json_annotation.dart';
import 'package:netease_music_api/src/api/bean.dart';

part 'bean.g.dart';

@JsonSerializable()
class NeteaseUserInfo {
  @JsonKey(fromJson: dynamicToString)
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
