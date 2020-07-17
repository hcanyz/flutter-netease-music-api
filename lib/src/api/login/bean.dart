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

@JsonSerializable()
class CellPhoneCheckExistenceRet extends ServerStatusBean {
  // 1: 存在   -1: 不存在
  int exist;

  String nickname;

  bool hasPassword;

  /// 账号不存在 或者 没有密码 需要短信登录
  bool get needUseSms => exist != 1 || !hasPassword;

  CellPhoneCheckExistenceRet();

  factory CellPhoneCheckExistenceRet.fromJson(Map<String, dynamic> json) =>
      _$CellPhoneCheckExistenceRetFromJson(json);

  Map<String, dynamic> toJson() => _$CellPhoneCheckExistenceRetToJson(this);
}

@JsonSerializable()
class AnonimousLoginRet extends ServerStatusBean {
  @JsonKey(fromJson: dynamicToString)
  String userId;

  AnonimousLoginRet();

  factory AnonimousLoginRet.fromJson(Map<String, dynamic> json) =>
      _$AnonimousLoginRetFromJson(json);

  Map<String, dynamic> toJson() => _$AnonimousLoginRetToJson(this);
}
