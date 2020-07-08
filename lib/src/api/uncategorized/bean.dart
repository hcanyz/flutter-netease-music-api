import 'package:json_annotation/json_annotation.dart';
import 'package:netease_music_api/src/api/bean.dart';
import 'package:netease_music_api/src/api/play/bean.dart';
import 'package:netease_music_api/src/api/user/bean.dart';

part 'bean.g.dart';

@JsonSerializable()
class BannerItem {
  String bannerId;

  String pic;

  int targetId;
  int targetType;

  String titleColor;
  String typeTitle;
  String url;
  String adurlV2;

  bool exclusive;

  String encodeId;

  Song2 song;

  String alg;
  String scm;
  String requestId;

  bool showAdTag;

  BannerItem();

  factory BannerItem.fromJson(Map<String, dynamic> json) =>
      _$BannerItemFromJson(json);

  Map<String, dynamic> toJson() => _$BannerItemToJson(this);
}

@JsonSerializable()
class BannerListWrap extends ServerStatusBean {
  List<BannerItem> banners;

  BannerListWrap();

  factory BannerListWrap.fromJson(Map<String, dynamic> json) =>
      _$BannerListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$BannerListWrapToJson(this);
}

@JsonSerializable()
class BannerListWrap2 extends ServerStatusBean {
  List<BannerItem> data;

  BannerListWrap2();

  factory BannerListWrap2.fromJson(Map<String, dynamic> json) =>
      _$BannerListWrap2FromJson(json);

  Map<String, dynamic> toJson() => _$BannerListWrap2ToJson(this);
}

@JsonSerializable()
class CountriesCodeItem {
  String zh;
  String en;
  String locale;
  String code;

  CountriesCodeItem();

  factory CountriesCodeItem.fromJson(Map<String, dynamic> json) =>
      _$CountriesCodeItemFromJson(json);

  Map<String, dynamic> toJson() => _$CountriesCodeItemToJson(this);
}

@JsonSerializable()
class CountriesCodeIndex {
  String label;
  List<CountriesCodeItem> countryList;

  CountriesCodeIndex();

  factory CountriesCodeIndex.fromJson(Map<String, dynamic> json) =>
      _$CountriesCodeIndexFromJson(json);

  Map<String, dynamic> toJson() => _$CountriesCodeIndexToJson(this);
}

@JsonSerializable()
class CountriesCodeListWrap extends ServerStatusBean {
  List<CountriesCodeIndex> data;

  CountriesCodeListWrap();

  factory CountriesCodeListWrap.fromJson(Map<String, dynamic> json) =>
      _$CountriesCodeListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$CountriesCodeListWrapToJson(this);
}

@JsonSerializable()
class PersonalizedPrivateContentItem {
  @JsonKey(fromJson: dynamicToString)
  String id;
  String name;
  String picUrl;
  String sPicUrl;
  String copywriter;

  String alg;

  int type;

  PersonalizedPrivateContentItem();

  factory PersonalizedPrivateContentItem.fromJson(Map<String, dynamic> json) =>
      _$PersonalizedPrivateContentItemFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalizedPrivateContentItemToJson(this);
}

@JsonSerializable()
class PersonalizedPrivateContentListWrap extends ServerStatusBean {
  List<PersonalizedPrivateContentItem> result;

  PersonalizedPrivateContentListWrap();

  factory PersonalizedPrivateContentListWrap.fromJson(
          Map<String, dynamic> json) =>
      _$PersonalizedPrivateContentListWrapFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PersonalizedPrivateContentListWrapToJson(this);
}

@JsonSerializable()
class TopListTrack {
  String first;
  String second;

  TopListTrack();

  factory TopListTrack.fromJson(Map<String, dynamic> json) =>
      _$TopListTrackFromJson(json);

  Map<String, dynamic> toJson() => _$TopListTrackToJson(this);
}

@JsonSerializable()
class TopList {
  @JsonKey(fromJson: dynamicToString)
  String id;

  @JsonKey(fromJson: dynamicToString)
  String userId;

  List<NeteaseUserInfo> subscribers;

  List<TopListTrack> tracks;

  String name;
  String englishTitle;
  String titleImageUrl;
  String updateFrequency;
  String backgroundCoverUrl;
  String coverImgUrl;
  String description;
  String commentThreadId;
  String ToplistType;

  int adType;
  int status;
  int privacy;
  int subscribedCount;
  int playCount;
  int createTime;
  int updateTime;
  int totalDuration;
  int specialType;

  int cloudTrackCount;
  int trackNumberUpdateTime;
  int trackUpdateTime;
  int trackCount;

  bool opRecommend;
  String recommendInfo;
  bool ordered;
  bool highQuality;
  bool newImported;
  bool anonimous;

  List<String> tags;

  TopList();

  factory TopList.fromJson(Map<String, dynamic> json) =>
      _$TopListFromJson(json);

  Map<String, dynamic> toJson() => _$TopListToJson(this);
}

@JsonSerializable()
class ArtistTopListArtists {
  String first;
  String second;

  int third;

  ArtistTopListArtists();

  factory ArtistTopListArtists.fromJson(Map<String, dynamic> json) =>
      _$ArtistTopListArtistsFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistTopListArtistsToJson(this);
}

@JsonSerializable()
class ArtistTopList {
  int position;

  String coverUrl;
  String name;
  String upateFrequency;
  String updateFrequency;

  List<ArtistTopListArtists> artists;

  ArtistTopList();

  factory ArtistTopList.fromJson(Map<String, dynamic> json) =>
      _$ArtistTopListFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistTopListToJson(this);
}

@JsonSerializable()
class RewardTopList {
  int position;

  String coverUrl;

  List<Song> songs;

  RewardTopList();

  factory RewardTopList.fromJson(Map<String, dynamic> json) =>
      _$RewardTopListFromJson(json);

  Map<String, dynamic> toJson() => _$RewardTopListToJson(this);
}

@JsonSerializable()
class TopListWrap extends ServerStatusBean {
  List<TopList> list;
  ArtistTopList artistToplist;

  TopListWrap();

  factory TopListWrap.fromJson(Map<String, dynamic> json) =>
      _$TopListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$TopListWrapToJson(this);
}

@JsonSerializable()
class TopListDetailWrap extends ServerStatusBean {
  List<TopList> list;
  ArtistTopList artistToplist;
  RewardTopList rewardToplist;

  TopListDetailWrap();

  factory TopListDetailWrap.fromJson(Map<String, dynamic> json) =>
      _$TopListDetailWrapFromJson(json);

  Map<String, dynamic> toJson() => _$TopListDetailWrapToJson(this);
}
