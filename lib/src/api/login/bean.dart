import 'package:json_annotation/json_annotation.dart';
import 'package:netease_music_api/netease_music_api.dart';
import 'package:netease_music_api/src/api/bean.dart';

part 'bean.g.dart';

@JsonSerializable()
class NeteaseAccount {
  @JsonKey(fromJson: dynamicToString)
  String id;
  String userName;

  int type;
  int status;

  int createTime;

  int vipType;
  int viptypeVersion;

  bool anonimousUser;

  NeteaseAccount();

  factory NeteaseAccount.fromJson(Map<String, dynamic> json) =>
      _$NeteaseAccountFromJson(json);

  Map<String, dynamic> toJson() => _$NeteaseAccountToJson(this);
}

@JsonSerializable()
class NeteaseAccountProfile extends NeteaseUserInfo {
  int follows;
  int playlistCount;

  NeteaseAccountProfile();

  factory NeteaseAccountProfile.fromJson(Map<String, dynamic> json) =>
      _$NeteaseAccountProfileFromJson(json);

  Map<String, dynamic> toJson() => _$NeteaseAccountProfileToJson(this);
}

@JsonSerializable()
class NeteaseAccountInfoWrap extends ServerStatusBean {
  int loginType;

  NeteaseAccount account;

  NeteaseAccountProfile profile;

  NeteaseAccountInfoWrap();

  factory NeteaseAccountInfoWrap.fromJson(Map<String, dynamic> json) =>
      _$NeteaseAccountInfoWrapFromJson(json);

  Map<String, dynamic> toJson() => _$NeteaseAccountInfoWrapToJson(this);
}
