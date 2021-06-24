import 'package:json_annotation/json_annotation.dart';
import 'package:netease_music_api/netease_music_api.dart';
import 'package:netease_music_api/src/api/bean.dart';

part 'bean.g.dart';

@JsonSerializable()
class NeteaseAccount {
  @JsonKey(fromJson: dynamicToString)
  late String id;
  late String userName;

  late int type;
  late int status;

  late int createTime;

  late int vipType;
  late int viptypeVersion;

  late bool anonimousUser;

  NeteaseAccount();

  factory NeteaseAccount.fromJson(Map<String, dynamic> json) =>
      _$NeteaseAccountFromJson(json);

  Map<String, dynamic> toJson() => _$NeteaseAccountToJson(this);
}

@JsonSerializable()
class NeteaseAccountProfile extends NeteaseUserInfo {
  late int follows;
  late int playlistCount;

  NeteaseAccountProfile();

  factory NeteaseAccountProfile.fromJson(Map<String, dynamic> json) =>
      _$NeteaseAccountProfileFromJson(json);

  Map<String, dynamic> toJson() => _$NeteaseAccountProfileToJson(this);
}

@JsonSerializable()
class NeteaseAccountInfoWrap extends ServerStatusBean {
  late int loginType;

  late NeteaseAccount account;

  late NeteaseAccountProfile profile;

  NeteaseAccountInfoWrap();

  factory NeteaseAccountInfoWrap.fromJson(Map<String, dynamic> json) =>
      _$NeteaseAccountInfoWrapFromJson(json);

  Map<String, dynamic> toJson() => _$NeteaseAccountInfoWrapToJson(this);
}

@JsonSerializable()
class NeteaseAccountBinding {
  @JsonKey(fromJson: dynamicToString)
  late String id;
  @JsonKey(fromJson: dynamicToString)
  late String userId;

  late String tokenJsonStr;
  late String url;
  late int type;
  late int expiresIn;
  late int refreshTime;
  late int bindingTime;
  late bool expired;

  NeteaseAccountBinding();

  factory NeteaseAccountBinding.fromJson(Map<String, dynamic> json) =>
      _$NeteaseAccountBindingFromJson(json);

  Map<String, dynamic> toJson() => _$NeteaseAccountBindingToJson(this);
}

@JsonSerializable()
class NeteaseAccountBindingWrap extends ServerStatusBean {
  late List<NeteaseAccountBinding> bindings;

  NeteaseAccountBindingWrap();

  factory NeteaseAccountBindingWrap.fromJson(Map<String, dynamic> json) =>
      _$NeteaseAccountBindingWrapFromJson(json);

  Map<String, dynamic> toJson() => _$NeteaseAccountBindingWrapToJson(this);
}

@JsonSerializable()
class CellPhoneCheckExistenceRet extends ServerStatusBean {
  // 1: 存在   -1: 不存在
  late int exist;

  late String nickname;

  late bool hasPassword;

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
  late String userId;

  AnonimousLoginRet();

  factory AnonimousLoginRet.fromJson(Map<String, dynamic> json) =>
      _$AnonimousLoginRetFromJson(json);

  Map<String, dynamic> toJson() => _$AnonimousLoginRetToJson(this);
}

@JsonSerializable()
class QrCodeLoginKey extends ServerStatusBean {
  late String unikey;

  QrCodeLoginKey();

  factory QrCodeLoginKey.fromJson(Map<String, dynamic> json) =>
      _$QrCodeLoginKeyFromJson(json);

  Map<String, dynamic> toJson() => _$QrCodeLoginKeyToJson(this);
}
