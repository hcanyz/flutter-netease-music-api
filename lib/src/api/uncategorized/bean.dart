import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:netease_music_api/src/api/bean.dart';
import 'package:netease_music_api/src/api/event/bean.dart';
import 'package:netease_music_api/src/api/play/bean.dart';
import 'package:netease_music_api/src/api/user/bean.dart';
import 'package:netease_music_api/src/dio_ext.dart';

part 'bean.g.dart';

@JsonSerializable()
class BannerItem {
  late String bannerId;

  late String pic;

  late int targetId;
  late int targetType;

  late String titleColor;
  late String typeTitle;
  late String url;
  late String adurlV2;

  late bool exclusive;

  late String encodeId;

  late Song2 song;

  late String alg;
  late String scm;
  late String requestId;

  late bool showAdTag;

  BannerItem();

  factory BannerItem.fromJson(Map<String, dynamic> json) =>
      _$BannerItemFromJson(json);

  Map<String, dynamic> toJson() => _$BannerItemToJson(this);
}

@JsonSerializable()
class BannerListWrap extends ServerStatusBean {
  late List<BannerItem> banners;

  BannerListWrap();

  factory BannerListWrap.fromJson(Map<String, dynamic> json) =>
      _$BannerListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$BannerListWrapToJson(this);
}

@JsonSerializable()
class BannerListWrap2 extends ServerStatusBean {
  late List<BannerItem> data;

  BannerListWrap2();

  factory BannerListWrap2.fromJson(Map<String, dynamic> json) =>
      _$BannerListWrap2FromJson(json);

  Map<String, dynamic> toJson() => _$BannerListWrap2ToJson(this);
}

@JsonSerializable()
class PageConfig {
  late String title;

  late String refreshToast;
  late String nodataToast;
  late int refreshInterval;
  late int songLabelMarkLimit;

  late bool fullscreen;

  late List<String> songLabelMarkPriority;
  late List<String> abtest;

  PageConfig();

  factory PageConfig.fromJson(Map<String, dynamic> json) =>
      _$PageConfigFromJson(json);

  Map<String, dynamic> toJson() => _$PageConfigToJson(this);
}

@JsonSerializable()
class HomeBlockPageUiElementTitle {
  late String title;

  HomeBlockPageUiElementTitle();

  factory HomeBlockPageUiElementTitle.fromJson(Map<String, dynamic> json) =>
      _$HomeBlockPageUiElementTitleFromJson(json);

  Map<String, dynamic> toJson() => _$HomeBlockPageUiElementTitleToJson(this);
}

@JsonSerializable()
class HomeBlockPageUiElementButton {
  late String action;
  late String actionType;
  late String text;
  late String iconUrl;

  HomeBlockPageUiElementButton();

  factory HomeBlockPageUiElementButton.fromJson(Map<String, dynamic> json) =>
      _$HomeBlockPageUiElementButtonFromJson(json);

  Map<String, dynamic> toJson() => _$HomeBlockPageUiElementButtonToJson(this);
}

@JsonSerializable()
class HomeBlockPageUiElementImage {
  late String imageUrl;

  HomeBlockPageUiElementImage();

  factory HomeBlockPageUiElementImage.fromJson(Map<String, dynamic> json) =>
      _$HomeBlockPageUiElementImageFromJson(json);

  Map<String, dynamic> toJson() => _$HomeBlockPageUiElementImageToJson(this);
}

@JsonSerializable()
class HomeBlockPageUiElement {
  late HomeBlockPageUiElementTitle mainTitle;
  late HomeBlockPageUiElementTitle subTitle;
  late HomeBlockPageUiElementButton button;
  late HomeBlockPageUiElementImage image;

  late List<String> labelTexts;

  HomeBlockPageUiElement();

  factory HomeBlockPageUiElement.fromJson(Map<String, dynamic> json) =>
      _$HomeBlockPageUiElementFromJson(json);

  Map<String, dynamic> toJson() => _$HomeBlockPageUiElementToJson(this);
}

@JsonSerializable()
class HomeBlockPageResourceExt {
  late List<Artists> artists;
  late Song songData;
  late Privilege songPrivilege;
  late CommentSimple commentSimpleData;

  late bool highQuality;
  late int playCount;

  HomeBlockPageResourceExt();

  factory HomeBlockPageResourceExt.fromJson(Map<String, dynamic> json) =>
      _$HomeBlockPageResourceExtFromJson(json);

  Map<String, dynamic> toJson() => _$HomeBlockPageResourceExtToJson(this);
}

@JsonSerializable()
class HomeBlockPageResource {
  late String resourceType;

  late String resourceId;

  late String resourceUrl;

  late String action;
  late String actionType;

  late HomeBlockPageUiElement uiElement;

  late HomeBlockPageResourceExt resourceExtInfo;

  late String alg;

  late bool valid;

  HomeBlockPageResource();

  factory HomeBlockPageResource.fromJson(Map<String, dynamic> json) =>
      _$HomeBlockPageResourceFromJson(json);

  Map<String, dynamic> toJson() => _$HomeBlockPageResourceToJson(this);
}

@JsonSerializable()
class HomeBlockPageCreative {
  late String creativeType;

  late String creativeId;

  late String action;
  late String actionType;

  late HomeBlockPageUiElement uiElement;

  late List<HomeBlockPageResource> resources;

  late String alg;

  late int position;

  HomeBlockPageCreative();

  factory HomeBlockPageCreative.fromJson(Map<String, dynamic> json) =>
      _$HomeBlockPageCreativeFromJson(json);

  Map<String, dynamic> toJson() => _$HomeBlockPageCreativeToJson(this);
}

@JsonSerializable()
class HomeBlockPageItem {
  late String blockCode;

  // HOMEPAGE_SLIDE_PLAYLIST  HOMEPAGE_SLIDE_SONGLIST_ALIGN
  late String showType;

  late HomeBlockPageUiElement uiElement;

  late List<HomeBlockPageCreative> creatives;

  dynamic extInfo;

  // orpheus://playlistCollection?referLog=HOMEPAGE_BLOCK_PLAYLIST_RCMD
  late String action;

  // scheme
  late String actionType;

  late bool canClose;

  HomeBlockPageItem();

  factory HomeBlockPageItem.fromJson(Map<String, dynamic> json) =>
      _$HomeBlockPageItemFromJson(json);

  Map<String, dynamic> toJson() => _$HomeBlockPageItemToJson(this);
}

@JsonSerializable()
class HomeBlockPageCursor {
  late int offset;

  late List<String> blockCodeOrderList;

  HomeBlockPageCursor();

  factory HomeBlockPageCursor.fromJson(Map<String, dynamic> json) =>
      _$HomeBlockPageCursorFromJson(json);

  Map<String, dynamic> toJson() => _$HomeBlockPageCursorToJson(this);
}

@JsonSerializable()
class HomeBlockPage {
  late bool hasMore;

  @JsonKey(fromJson: _stringToHomeBlockPageCursor)
  late HomeBlockPageCursor cursor;

  late PageConfig pageConfig;

  late List<HomeBlockPageItem> blocks;

  HomeBlockPage();

  factory HomeBlockPage.fromJson(Map<String, dynamic> json) =>
      _$HomeBlockPageFromJson(json);

  Map<String, dynamic> toJson() => _$HomeBlockPageToJson(this);
}

HomeBlockPageCursor _stringToHomeBlockPageCursor(String value) =>
    HomeBlockPageCursor?.fromJson(json.decode(value));

@JsonSerializable()
class HomeBlockPageWrap extends ServerStatusBean {
  late HomeBlockPage data;

  HomeBlockPageWrap();

  factory HomeBlockPageWrap.fromJson(Map<String, dynamic> json) =>
      _$HomeBlockPageWrapFromJson(json);

  Map<String, dynamic> toJson() => _$HomeBlockPageWrapToJson(this);
}

@JsonSerializable()
class HomeDragonBallItem {
  late int id;
  late String name;

  late String iconUrl;

  late String url;

  late bool skinSupport;

  HomeDragonBallItem();

  factory HomeDragonBallItem.fromJson(Map<String, dynamic> json) =>
      _$HomeDragonBallItemFromJson(json);

  Map<String, dynamic> toJson() => _$HomeDragonBallItemToJson(this);
}

@JsonSerializable()
class HomeDragonBallWrap extends ServerStatusBean {
  late List<HomeDragonBallItem> data;

  HomeDragonBallWrap();

  factory HomeDragonBallWrap.fromJson(Map<String, dynamic> json) =>
      _$HomeDragonBallWrapFromJson(json);

  Map<String, dynamic> toJson() => _$HomeDragonBallWrapToJson(this);
}

@JsonSerializable()
class CountriesCodeItem {
  late String zh;
  late String en;
  late String locale;
  late String code;

  CountriesCodeItem();

  factory CountriesCodeItem.fromJson(Map<String, dynamic> json) =>
      _$CountriesCodeItemFromJson(json);

  Map<String, dynamic> toJson() => _$CountriesCodeItemToJson(this);
}

@JsonSerializable()
class CountriesCodeIndex {
  late String label;
  late List<CountriesCodeItem> countryList;

  CountriesCodeIndex();

  factory CountriesCodeIndex.fromJson(Map<String, dynamic> json) =>
      _$CountriesCodeIndexFromJson(json);

  Map<String, dynamic> toJson() => _$CountriesCodeIndexToJson(this);
}

@JsonSerializable()
class CountriesCodeListWrap extends ServerStatusBean {
  late List<CountriesCodeIndex> data;

  CountriesCodeListWrap();

  factory CountriesCodeListWrap.fromJson(Map<String, dynamic> json) =>
      _$CountriesCodeListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$CountriesCodeListWrapToJson(this);
}

@JsonSerializable()
class PersonalizedPrivateContentItem {
  @JsonKey(fromJson: dynamicToString)
  late String id;
  late String name;
  late String picUrl;
  late String sPicUrl;
  late String copywriter;

  late String alg;

  late int type;

  PersonalizedPrivateContentItem();

  factory PersonalizedPrivateContentItem.fromJson(Map<String, dynamic> json) =>
      _$PersonalizedPrivateContentItemFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalizedPrivateContentItemToJson(this);
}

@JsonSerializable()
class PersonalizedPrivateContentListWrap extends ServerStatusBean {
  late List<PersonalizedPrivateContentItem> result;

  PersonalizedPrivateContentListWrap();

  factory PersonalizedPrivateContentListWrap.fromJson(
          Map<String, dynamic> json) =>
      _$PersonalizedPrivateContentListWrapFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PersonalizedPrivateContentListWrapToJson(this);
}

@JsonSerializable()
class TopListTrack {
  late String first;
  late String second;

  TopListTrack();

  factory TopListTrack.fromJson(Map<String, dynamic> json) =>
      _$TopListTrackFromJson(json);

  Map<String, dynamic> toJson() => _$TopListTrackToJson(this);
}

@JsonSerializable()
class TopList {
  @JsonKey(fromJson: dynamicToString)
  late String id;

  @JsonKey(fromJson: dynamicToString)
  late String userId;

  late List<NeteaseUserInfo> subscribers;

  late List<TopListTrack> tracks;

  late String name;
  late String englishTitle;
  late String titleImageUrl;
  late String updateFrequency;
  late String backgroundCoverUrl;
  late String coverImgUrl;
  late String description;
  late String commentThreadId;
  late String ToplistType;

  late int adType;
  late int status;
  late int privacy;
  late int subscribedCount;
  late int playCount;
  late int createTime;
  late int updateTime;
  late int totalDuration;
  late int specialType;

  late int cloudTrackCount;
  late int trackNumberUpdateTime;
  late int trackUpdateTime;
  late int trackCount;

  late bool opRecommend;
  late String recommendInfo;
  late bool ordered;
  late bool highQuality;
  late bool newImported;
  late bool anonimous;

  late List<String> tags;

  TopList();

  factory TopList.fromJson(Map<String, dynamic> json) =>
      _$TopListFromJson(json);

  Map<String, dynamic> toJson() => _$TopListToJson(this);
}

@JsonSerializable()
class ArtistTopListArtists {
  late String first;
  late String second;

  late int third;

  ArtistTopListArtists();

  factory ArtistTopListArtists.fromJson(Map<String, dynamic> json) =>
      _$ArtistTopListArtistsFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistTopListArtistsToJson(this);
}

@JsonSerializable()
class ArtistTopList {
  late int position;

  late String coverUrl;
  late String name;
  late String upateFrequency;
  late String updateFrequency;

  late List<ArtistTopListArtists> artists;

  ArtistTopList();

  factory ArtistTopList.fromJson(Map<String, dynamic> json) =>
      _$ArtistTopListFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistTopListToJson(this);
}

@JsonSerializable()
class RewardTopList {
  late int position;

  late String coverUrl;

  late List<Song> songs;

  RewardTopList();

  factory RewardTopList.fromJson(Map<String, dynamic> json) =>
      _$RewardTopListFromJson(json);

  Map<String, dynamic> toJson() => _$RewardTopListToJson(this);
}

@JsonSerializable()
class TopListWrap extends ServerStatusBean {
  late List<TopList> list;
  late ArtistTopList artistToplist;

  TopListWrap();

  factory TopListWrap.fromJson(Map<String, dynamic> json) =>
      _$TopListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$TopListWrapToJson(this);
}

@JsonSerializable()
class TopListDetailWrap extends ServerStatusBean {
  late List<TopList> list;
  late ArtistTopList artistToplist;
  late RewardTopList rewardToplist;

  TopListDetailWrap();

  factory TopListDetailWrap.fromJson(Map<String, dynamic> json) =>
      _$TopListDetailWrapFromJson(json);

  Map<String, dynamic> toJson() => _$TopListDetailWrapToJson(this);
}

@JsonSerializable()
class McalendarDetailEvent {
  late String id;
  late String eventType;
  late int onlineTime;
  late int offlineTime;
  late String imgUrl;
  late String targetUrl;
  late String tag;
  late String title;
  late bool canRemind;
  late bool reminded;
  late String remindText;
  late String resourceId;
  late String resourceType;
  late String eventStatus;
  late String remindedText;

  McalendarDetailEvent();

  factory McalendarDetailEvent.fromJson(Map<String, dynamic> json) =>
      _$McalendarDetailEventFromJson(json);

  Map<String, dynamic> toJson() => _$McalendarDetailEventToJson(this);
}

@JsonSerializable()
class McalendarDetail {
  late List<McalendarDetailEvent> calendarEvents;

  McalendarDetail();

  factory McalendarDetail.fromJson(Map<String, dynamic> json) =>
      _$McalendarDetailFromJson(json);

  Map<String, dynamic> toJson() => _$McalendarDetailToJson(this);
}

@JsonSerializable()
class McalendarDetailWrap extends ServerStatusBean {
  late McalendarDetail data;

  McalendarDetailWrap();

  factory McalendarDetailWrap.fromJson(Map<String, dynamic> json) =>
      _$McalendarDetailWrapFromJson(json);

  Map<String, dynamic> toJson() => _$McalendarDetailWrapToJson(this);
}

@JsonSerializable()
class AudioMatchResult {
  late int startTime;
  late Song song;

  AudioMatchResult();

  factory AudioMatchResult.fromJson(Map<String, dynamic> json) =>
      _$AudioMatchResultFromJson(json);

  Map<String, dynamic> toJson() => _$AudioMatchResultToJson(this);
}

@JsonSerializable()
class AudioMatchResultData {
  late int type;

  late List<AudioMatchResult> result;

  AudioMatchResultData();

  factory AudioMatchResultData.fromJson(Map<String, dynamic> json) =>
      _$AudioMatchResultDataFromJson(json);

  Map<String, dynamic> toJson() => _$AudioMatchResultDataToJson(this);
}

@JsonSerializable()
class AudioMatchResultWrap extends ServerStatusBean {
  late AudioMatchResultData data;

  AudioMatchResultWrap();

  factory AudioMatchResultWrap.fromJson(Map<String, dynamic> json) =>
      _$AudioMatchResultWrapFromJson(json);

  Map<String, dynamic> toJson() => _$AudioMatchResultWrapToJson(this);
}

@JsonSerializable()
class ListenTogetherStatusData {
  late bool inRoom;
  dynamic roomInfo;
  dynamic status;

  ListenTogetherStatusData();

  factory ListenTogetherStatusData.fromJson(Map<String, dynamic> json) =>
      _$ListenTogetherStatusDataFromJson(json);

  Map<String, dynamic> toJson() => _$ListenTogetherStatusDataToJson(this);
}

@JsonSerializable()
class ListenTogetherStatusWrap extends ServerStatusBean {
  late ListenTogetherStatusData data;

  ListenTogetherStatusWrap();

  factory ListenTogetherStatusWrap.fromJson(Map<String, dynamic> json) =>
      _$ListenTogetherStatusWrapFromJson(json);

  Map<String, dynamic> toJson() => _$ListenTogetherStatusWrapToJson(this);
}

@JsonSerializable()
class UploadImageAlloc {
  late String bucket;
  late String docId;
  late String objectKey;
  late String token;

  UploadImageAlloc();

  factory UploadImageAlloc.fromJson(Map<String, dynamic> json) =>
      _$UploadImageAllocFromJson(json);

  Map<String, dynamic> toJson() => _$UploadImageAllocToJson(this);
}

@JsonSerializable()
class UploadImageAllocWrap extends ServerStatusBean {
  late UploadImageAlloc result;

  UploadImageAllocWrap();

  factory UploadImageAllocWrap.fromJson(Map<String, dynamic> json) =>
      _$UploadImageAllocWrapFromJson(json);

  Map<String, dynamic> toJson() => _$UploadImageAllocWrapToJson(this);
}

@JsonSerializable()
class UploadImageResult extends ServerStatusBean {
  @JsonKey(fromJson: dynamicToString)
  late String id;

  late String url;

  UploadImageResult();

  factory UploadImageResult.fromJson(Map<String, dynamic> json) =>
      _$UploadImageResultFromJson(json);

  Map<String, dynamic> toJson() => _$UploadImageResultToJson(this);
}

class BatchApiWrap extends ServerStatusBean {
  late Map<String, dynamic> data;

  BatchApiWrap();

  dynamic findResponseData<T>(DioMetaData metaData) {
    return data[metaData.uri.path];
  }

  factory BatchApiWrap.fromJson(Map<String, dynamic> json) {
    return BatchApiWrap()
      ..code = json['code'] as int
      ..message = json['message'] as String
      ..msg = json['msg'] as String
      ..data = json;
  }
}
