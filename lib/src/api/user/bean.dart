import 'package:json_annotation/json_annotation.dart';
import 'package:netease_music_api/src/api/bean.dart';
import 'package:netease_music_api/src/api/login/bean.dart';
import 'package:netease_music_api/src/api/play/bean.dart';

part 'bean.g.dart';

@JsonSerializable()
class NeteaseSimpleUserInfo {
  @JsonKey(fromJson: dynamicToString)
  String userId;
  String nickname;
  String avatar;

  bool followed;

  NeteaseSimpleUserInfo();

  factory NeteaseSimpleUserInfo.fromJson(Map<String, dynamic> json) =>
      _$NeteaseSimpleUserInfoFromJson(json);

  Map<String, dynamic> toJson() => _$NeteaseSimpleUserInfoToJson(this);
}

@JsonSerializable()
class NeteaseUserInfo {
  @JsonKey(fromJson: dynamicToString)
  String userId;
  String nickname;
  String avatarUrl;
  String backgroundUrl;
  String signature;
  String description;
  String detailDescription;
  String recommendReason;

  //性别 0:保密 1:男性 2:女性
  int gender;

  int authority;

  //出生日期,时间戳 unix timestamp
  int birthday;

  int city;
  int province;
  int vipType;
  int authenticationTypes;
  int authStatus;
  int djStatus;
  int accountStatus;

  List<String> expertTags;

  String alg;

  bool followed;
  bool mutual;
  bool anchor;
  bool defaultAvatar;

  NeteaseUserInfo();

  factory NeteaseUserInfo.fromJson(Map<String, dynamic> json) =>
      _$NeteaseUserInfoFromJson(json);

  Map<String, dynamic> toJson() => _$NeteaseUserInfoToJson(this);
}

@JsonSerializable()
class NeteaseUserDetail extends ServerStatusBean {
  int createTime;
  int createDays;

  NeteaseAccountProfile profile;

  NeteaseUserDetail();

  factory NeteaseUserDetail.fromJson(Map<String, dynamic> json) =>
      _$NeteaseUserDetailFromJson(json);

  Map<String, dynamic> toJson() => _$NeteaseUserDetailToJson(this);
}

@JsonSerializable()
class NeteaseUserSubcount extends ServerStatusBean {
  int programCount;
  int djRadioCount;
  int mvCount;
  int artistCount;
  int newProgramCount;
  int createDjRadioCount;
  int createdPlaylistCount;
  int subPlaylistCount;

  NeteaseUserSubcount();

  factory NeteaseUserSubcount.fromJson(Map<String, dynamic> json) =>
      _$NeteaseUserSubcountFromJson(json);

  Map<String, dynamic> toJson() => _$NeteaseUserSubcountToJson(this);
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
class UserFollowListWrap extends ServerStatusBean {
  List<NeteaseAccountProfile> follow;

  UserFollowListWrap();

  factory UserFollowListWrap.fromJson(Map<String, dynamic> json) =>
      _$UserFollowListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$UserFollowListWrapToJson(this);
}

@JsonSerializable()
class UserFollowedListWrap extends ServerStatusBean {
  List<NeteaseAccountProfile> followeds;

  UserFollowedListWrap();

  factory UserFollowedListWrap.fromJson(Map<String, dynamic> json) =>
      _$UserFollowedListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$UserFollowedListWrapToJson(this);
}

@JsonSerializable()
class UserListWrap extends ServerStatusBean {
  List<NeteaseUserInfo> userprofiles;

  UserListWrap();

  factory UserListWrap.fromJson(Map<String, dynamic> json) =>
      _$UserListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$UserListWrapToJson(this);
}

@JsonSerializable()
class ArtistsSubListWrap extends ServerStatusListBean {
  List<Artists> data;

  ArtistsSubListWrap();

  factory ArtistsSubListWrap.fromJson(Map<String, dynamic> json) =>
      _$ArtistsSubListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistsSubListWrapToJson(this);
}

@JsonSerializable()
class MvSubListWrap extends ServerStatusListBean {
  List<Mv2> data;

  MvSubListWrap();

  factory MvSubListWrap.fromJson(Map<String, dynamic> json) =>
      _$MvSubListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$MvSubListWrapToJson(this);
}

@JsonSerializable()
class AlbumSubListWrap extends ServerStatusListBean {
  List<Album> data;

  int paidCount;

  AlbumSubListWrap();

  factory AlbumSubListWrap.fromJson(Map<String, dynamic> json) =>
      _$AlbumSubListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumSubListWrapToJson(this);
}

@JsonSerializable()
class PlayRecordItem {
  int playCount;
  int score;

  Song song;

  PlayRecordItem();

  factory PlayRecordItem.fromJson(Map<String, dynamic> json) =>
      _$PlayRecordItemFromJson(json);

  Map<String, dynamic> toJson() => _$PlayRecordItemToJson(this);
}

@JsonSerializable()
class PlayRecordListWrap extends ServerStatusBean {
  List<PlayRecordItem> allData;

  PlayRecordListWrap();

  factory PlayRecordListWrap.fromJson(Map<String, dynamic> json) =>
      _$PlayRecordListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$PlayRecordListWrapToJson(this);
}

@JsonSerializable()
class PlaylistCreateWrap extends ServerStatusBean {
  @JsonKey(fromJson: dynamicToString)
  String id;

  PlayItem playlist;

  PlaylistCreateWrap();

  factory PlaylistCreateWrap.fromJson(Map<String, dynamic> json) =>
      _$PlaylistCreateWrapFromJson(json);

  Map<String, dynamic> toJson() => _$PlaylistCreateWrapToJson(this);
}

@JsonSerializable()
class PlaylistSubscribersWrap extends ServerStatusBean {
  List<NeteaseUserInfo> subscribers;

  PlaylistSubscribersWrap();

  factory PlaylistSubscribersWrap.fromJson(Map<String, dynamic> json) =>
      _$PlaylistSubscribersWrapFromJson(json);

  Map<String, dynamic> toJson() => _$PlaylistSubscribersWrapToJson(this);
}
