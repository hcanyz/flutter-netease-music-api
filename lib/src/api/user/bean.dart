import 'package:json_annotation/json_annotation.dart';
import 'package:netease_music_api/src/api/bean.dart';
import 'package:netease_music_api/src/api/login/bean.dart';
import 'package:netease_music_api/src/api/play/bean.dart';

part 'bean.g.dart';

@JsonSerializable()
class UserSetting {
  @JsonKey(fromJson: dynamicToString)
  late String userId;

  late int profileSetting;
  late int ageSetting;
  late int areaSetting;
  late int collegeSetting;
  late int villageAgeSetting;
  late int followSingerSetting;
  late int personalServiceSetting;
  late int concertSetting;
  late int socialSetting;
  late int shareSetting;
  late int playRecordSetting;
  late int broadcastSetting;
  late int commentSetting;

  //newSongDiskSetting

  late bool phoneFriendSetting;
  late bool allowFollowedCanSeeMyPlayRecord;
  late bool finishedFollowGuide;
  late bool allowOfflinePrivateMessageNotify;
  late bool allowOfflineForwardNotify;
  late bool allowOfflineCommentNotify;
  late bool allowOfflineCommentReplyNotify;
  late bool allowOfflineNotify;
  late bool allowVideoSubscriptionNotify;
  late bool sendMiuiMsg;
  late bool allowImportDoubanPlaylist;
  late bool importedDoubanPlaylist;
  late bool importedXiamiPlaylist;
  late bool allowImportXiamiPlaylist;
  late bool allowSubscriptionNotify;
  late bool allowLikedNotify;
  late bool allowNewFollowerNotify;
  late bool needRcmdEvent;
  late bool allowPlaylistShareNotify;
  late bool allowDJProgramShareNotify;
  late bool allowDJRadioSubscriptionNotify;
  late bool allowPeopleCanSeeMyPlaynNotify;
  late bool peopleNearbyCanSeeMe;
  late bool allowDJProgramSubscriptionNotify;

  UserSetting();

  factory UserSetting.fromJson(Map<String, dynamic> json) =>
      _$UserSettingFromJson(json);

  Map<String, dynamic> toJson() => _$UserSettingToJson(this);
}

@JsonSerializable()
class UserSettingWrap extends ServerStatusBean {
  late UserSetting setting;

  UserSettingWrap();

  factory UserSettingWrap.fromJson(Map<String, dynamic> json) =>
      _$UserSettingWrapFromJson(json);

  Map<String, dynamic> toJson() => _$UserSettingWrapToJson(this);
}

@JsonSerializable()
class NeteaseSimpleUserInfo {
  @JsonKey(fromJson: dynamicToString)
  late String userId;
  late String nickname;
  late String avatar;

  late bool followed;

  NeteaseSimpleUserInfo();

  factory NeteaseSimpleUserInfo.fromJson(Map<String, dynamic> json) =>
      _$NeteaseSimpleUserInfoFromJson(json);

  Map<String, dynamic> toJson() => _$NeteaseSimpleUserInfoToJson(this);
}

@JsonSerializable()
class NeteaseUserInfo {
  @JsonKey(fromJson: dynamicToString)
  late String userId;
  late String nickname;
  late String avatarUrl;
  late String backgroundUrl;
  late String signature;
  late String description;
  late String detailDescription;
  String? recommendReason;

  //性别 0:保密 1:男性 2:女性
  late int gender;

  late int authority;

  //出生日期,时间戳 unix timestamp
  late int birthday;

  late int city;
  late int province;
  late int vipType;
  int? authenticationTypes;
  late int authStatus;
  late int djStatus;
  late int accountStatus;

  List<String>? expertTags;

  String? alg;

  late bool followed;
  late bool mutual;
  bool? anchor;
  late bool defaultAvatar;

  NeteaseUserInfo();

  factory NeteaseUserInfo.fromJson(Map<String, dynamic> json) =>
      _$NeteaseUserInfoFromJson(json);

  Map<String, dynamic> toJson() => _$NeteaseUserInfoToJson(this);
}

@JsonSerializable()
class NeteaseUserDetail extends ServerStatusBean {
  late int createTime;
  late int createDays;

  late NeteaseAccountProfile profile;

  NeteaseUserDetail();

  factory NeteaseUserDetail.fromJson(Map<String, dynamic> json) =>
      _$NeteaseUserDetailFromJson(json);

  Map<String, dynamic> toJson() => _$NeteaseUserDetailToJson(this);
}

@JsonSerializable()
class NeteaseUserSubcount extends ServerStatusBean {
  late int programCount;
  late int djRadioCount;
  late int mvCount;
  late int artistCount;
  late int newProgramCount;
  late int createDjRadioCount;
  late int createdPlaylistCount;
  late int subPlaylistCount;

  NeteaseUserSubcount();

  factory NeteaseUserSubcount.fromJson(Map<String, dynamic> json) =>
      _$NeteaseUserSubcountFromJson(json);

  Map<String, dynamic> toJson() => _$NeteaseUserSubcountToJson(this);
}

@JsonSerializable()
class NeteaseUserLevel {
  late String info;
  late double progress;
  late int nextPlayCount;
  late int nextLoginCount;
  late int nowPlayCount;
  late int nowLoginCount;
  late int level;

  NeteaseUserLevel();

  factory NeteaseUserLevel.fromJson(Map<String, dynamic> json) =>
      _$NeteaseUserLevelFromJson(json);

  Map<String, dynamic> toJson() => _$NeteaseUserLevelToJson(this);
}

@JsonSerializable()
class NeteaseUserLevelWrap extends ServerStatusBean {
  late bool full;

  late NeteaseUserLevel data;

  NeteaseUserLevelWrap();

  factory NeteaseUserLevelWrap.fromJson(Map<String, dynamic> json) =>
      _$NeteaseUserLevelWrapFromJson(json);

  Map<String, dynamic> toJson() => _$NeteaseUserLevelWrapToJson(this);
}

@JsonSerializable()
class UserFollowListWrap extends ServerStatusBean {
  late List<NeteaseAccountProfile> follow;

  UserFollowListWrap();

  factory UserFollowListWrap.fromJson(Map<String, dynamic> json) =>
      _$UserFollowListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$UserFollowListWrapToJson(this);
}

@JsonSerializable()
class UserFollowedListWrap extends ServerStatusBean {
  late List<NeteaseAccountProfile> followeds;

  UserFollowedListWrap();

  factory UserFollowedListWrap.fromJson(Map<String, dynamic> json) =>
      _$UserFollowedListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$UserFollowedListWrapToJson(this);
}

@JsonSerializable()
class UserListWrap extends ServerStatusBean {
  late List<NeteaseUserInfo> userprofiles;

  UserListWrap();

  factory UserListWrap.fromJson(Map<String, dynamic> json) =>
      _$UserListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$UserListWrapToJson(this);
}

@JsonSerializable()
class ArtistsSubListWrap extends ServerStatusListBean {
  late List<Artists> data;

  ArtistsSubListWrap();

  factory ArtistsSubListWrap.fromJson(Map<String, dynamic> json) =>
      _$ArtistsSubListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistsSubListWrapToJson(this);
}

@JsonSerializable()
class MvSubListWrap extends ServerStatusListBean {
  late List<Mv2> data;

  MvSubListWrap();

  factory MvSubListWrap.fromJson(Map<String, dynamic> json) =>
      _$MvSubListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$MvSubListWrapToJson(this);
}

@JsonSerializable()
class AlbumSubListWrap extends ServerStatusListBean {
  late List<Album> data;

  late int paidCount;

  AlbumSubListWrap();

  factory AlbumSubListWrap.fromJson(Map<String, dynamic> json) =>
      _$AlbumSubListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumSubListWrapToJson(this);
}

@JsonSerializable()
class PlayRecordItem {
  late int playCount;
  late int score;

  late Song song;

  PlayRecordItem();

  factory PlayRecordItem.fromJson(Map<String, dynamic> json) =>
      _$PlayRecordItemFromJson(json);

  Map<String, dynamic> toJson() => _$PlayRecordItemToJson(this);
}

@JsonSerializable()
class PlayRecordListWrap extends ServerStatusBean {
  late List<PlayRecordItem> allData;

  PlayRecordListWrap();

  factory PlayRecordListWrap.fromJson(Map<String, dynamic> json) =>
      _$PlayRecordListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$PlayRecordListWrapToJson(this);
}

@JsonSerializable()
class PlaylistCreateWrap extends ServerStatusBean {
  @JsonKey(fromJson: dynamicToString)
  late String id;

  late Play playlist;

  PlaylistCreateWrap();

  factory PlaylistCreateWrap.fromJson(Map<String, dynamic> json) =>
      _$PlaylistCreateWrapFromJson(json);

  Map<String, dynamic> toJson() => _$PlaylistCreateWrapToJson(this);
}

@JsonSerializable()
class PlaylistSubscribersWrap extends ServerStatusBean {
  late List<NeteaseUserInfo> subscribers;

  PlaylistSubscribersWrap();

  factory PlaylistSubscribersWrap.fromJson(Map<String, dynamic> json) =>
      _$PlaylistSubscribersWrapFromJson(json);

  Map<String, dynamic> toJson() => _$PlaylistSubscribersWrapToJson(this);
}
