import 'package:json_annotation/json_annotation.dart';
import 'package:netease_music_api/netease_music_api.dart';
import 'package:netease_music_api/src/api/bean.dart';
import 'package:netease_music_api/src/api/user/bean.dart';

part 'bean.g.dart';

@JsonSerializable()
class Music {
  @JsonKey(fromJson: dynamicToString)
  late String id;

  late String name;

  late int size;
  late String extension;

  late int sr;
  late int dfsId;
  late int bitrate;
  late int playTime;
  late double volumeDelta;

  Music();

  factory Music.fromJson(Map<String, dynamic> json) => _$MusicFromJson(json);

  Map<String, dynamic> toJson() => _$MusicToJson(this);
}

@JsonSerializable()
class Music2 {
  late int br;
  late int fid;
  late int size;
  late double vd;

  Music2();

  factory Music2.fromJson(Map<String, dynamic> json) => _$Music2FromJson(json);

  Map<String, dynamic> toJson() => _$Music2ToJson(this);
}

@JsonSerializable()
class Lyrics {
  late String txt;

  Lyrics();

  factory Lyrics.fromJson(Map<String, dynamic> json) => _$LyricsFromJson(json);

  Map<String, dynamic> toJson() => _$LyricsToJson(this);
}

@JsonSerializable()
class Lyrics2 {
  late String lyric;

  late int version;

  Lyrics2();

  factory Lyrics2.fromJson(Map<String, dynamic> json) =>
      _$Lyrics2FromJson(json);

  Map<String, dynamic> toJson() => _$Lyrics2ToJson(this);
}

@JsonSerializable()
class Privilege {
  @JsonKey(fromJson: dynamicToString)
  late String id;

  late int fee;

  late int payed;
  late int st;
  late int pl;
  late int dl;
  late int sp;
  late int cp;
  late int subp;
  late bool cs;
  late int maxbr;
  late int fl;
  late bool toast;
  late int flag;
  late bool preSell;

  Privilege();

  factory Privilege.fromJson(Map<String, dynamic> json) =>
      _$PrivilegeFromJson(json);

  Map<String, dynamic> toJson() => _$PrivilegeToJson(this);
}

@JsonSerializable()
class Song {
  @JsonKey(fromJson: dynamicToString)
  late String id;

  late String name;

  late int copyrightId;

  late String disc;
  late int no;
  late int fee;
  late int status;

  late bool starred;
  late int starredNum;
  late double popularity;
  late int score;

  late int duration;
  late int playedNum;
  late int dayPlays;
  late int hearTime;

  late String ringtone;
  late String copyFrom;

  late String commentThreadId;

  late List<Artists> artists;

  late Album album;

  // Lyrics String[]
  dynamic lyrics;

  late Privilege privilege;

  late int copyright;

  late String transName;

  late int mark;
  late int rtype;
  late int mvid;

  late String alg;

  late String reason;

  late Music hMusic;
  late Music mMusic;
  late Music lMusic;
  late Music bMusic;

  // {type: 2, typeDesc: 其它版本可播, songId: null}
  // String noCopyrightRcmd;

  Song();

  factory Song.fromJson(Map<String, dynamic> json) => _$SongFromJson(json);

  Map<String, dynamic> toJson() => _$SongToJson(this);
}

@JsonSerializable()
class Song2 {
  @JsonKey(fromJson: dynamicToString)
  late String id;

  late String name;

  late int pst;
  late int t;

  late List<Artists> ar;

  late double pop;
  late int st;

  late String rt;

  late int fee;
  late int v;
  late String cf;

  late Album al;

  late int dt;

  late Music2 h;
  late Music2 m;
  late Music2 l;
  late Music2 a;

  late int mark;
  late int mv;
  late int rtype;
  late int mst;
  late int cp;
  late int publishTime;
  late String reason;

  late Privilege privilege;

  Song2();

  factory Song2.fromJson(Map<String, dynamic> json) => _$Song2FromJson(json);

  Map<String, dynamic> toJson() => _$Song2ToJson(this);
}

@JsonSerializable()
class SongDetailWrap extends ServerStatusBean {
  late List<Song2> songs;

  late List<Privilege> privileges;

  SongDetailWrap();

  factory SongDetailWrap.fromJson(Map<String, dynamic> json) =>
      _$SongDetailWrapFromJson(json);

  Map<String, dynamic> toJson() => _$SongDetailWrapToJson(this);
}

@JsonSerializable()
class SongUrl {
  @JsonKey(fromJson: dynamicToString)
  late String id;

  late String url;

  //码率
  late int br;
  late int size;
  late int code;
  late int expi;
  late double gain;
  late int fee;
  late int payed;
  late int flag;

  late bool canExtend;

  late String md5;

  SongUrl();

  factory SongUrl.fromJson(Map<String, dynamic> json) =>
      _$SongUrlFromJson(json);

  Map<String, dynamic> toJson() => _$SongUrlToJson(this);
}

@JsonSerializable()
class SongUrlListWrap extends ServerStatusBean {
  late List<SongUrl> data;

  SongUrlListWrap();

  factory SongUrlListWrap.fromJson(Map<String, dynamic> json) =>
      _$SongUrlListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$SongUrlListWrapToJson(this);
}

@JsonSerializable()
class SongLyricWrap extends ServerStatusBean {
  late bool sgc;
  late bool sfy;
  late bool qfy;

  late Lyrics2 lrc;
  late Lyrics2 klyric;
  late Lyrics2 tlyric;

  SongLyricWrap();

  factory SongLyricWrap.fromJson(Map<String, dynamic> json) =>
      _$SongLyricWrapFromJson(json);

  Map<String, dynamic> toJson() => _$SongLyricWrapToJson(this);
}

@JsonSerializable()
class SongListWrap extends ServerStatusBean {
  late List<Song> songs;

  SongListWrap();

  factory SongListWrap.fromJson(Map<String, dynamic> json) =>
      _$SongListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$SongListWrapToJson(this);
}

@JsonSerializable()
class SongListWrap2 extends ServerStatusBean {
  late List<Song> data;

  SongListWrap2();

  factory SongListWrap2.fromJson(Map<String, dynamic> json) =>
      _$SongListWrap2FromJson(json);

  Map<String, dynamic> toJson() => _$SongListWrap2ToJson(this);
}

@JsonSerializable()
class PersonalizedSongItem {
  @JsonKey(fromJson: dynamicToString)
  late String id;
  late String name;
  late String picUrl;
  late String copywriter;

  late bool canDislike;

  late String alg;

  late int type;

  late Song song;

  PersonalizedSongItem();

  factory PersonalizedSongItem.fromJson(Map<String, dynamic> json) =>
      _$PersonalizedSongItemFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalizedSongItemToJson(this);
}

@JsonSerializable()
class PersonalizedSongListWrap extends ServerStatusBean {
  late List<PersonalizedSongItem> result;

  late int category;

  PersonalizedSongListWrap();

  factory PersonalizedSongListWrap.fromJson(Map<String, dynamic> json) =>
      _$PersonalizedSongListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalizedSongListWrapToJson(this);
}

@JsonSerializable()
class LikeSongListWrap extends ServerStatusBean {
  late int checkPoint;

  late List<int> ids;

  LikeSongListWrap();

  factory LikeSongListWrap.fromJson(Map<String, dynamic> json) =>
      _$LikeSongListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$LikeSongListWrapToJson(this);
}

@JsonSerializable()
class CloudSongItem {
  late Song2 simpleSong;

  @JsonKey(fromJson: dynamicToString)
  late String songId;
  late String songName;
  late String fileName;

  late int cover;
  late int fileSize;
  late int addTime;
  late int version;
  late String coverId;
  late String lyricId;

  late String album;
  late String artist;

  late int bitrate;

  CloudSongItem();

  factory CloudSongItem.fromJson(Map<String, dynamic> json) =>
      _$CloudSongItemFromJson(json);

  Map<String, dynamic> toJson() => _$CloudSongItemToJson(this);
}

@JsonSerializable()
class CloudSongListWrap extends ServerStatusListBean {
  late String size;
  late String maxSize;
  late int upgradeSign;

  late List<CloudSongItem> data;

  CloudSongListWrap();

  factory CloudSongListWrap.fromJson(Map<String, dynamic> json) =>
      _$CloudSongListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$CloudSongListWrapToJson(this);
}

@JsonSerializable()
class RecommendSongReason {
  @JsonKey(fromJson: dynamicToString)
  late String songId;

  late String reason;

  RecommendSongReason();

  factory RecommendSongReason.fromJson(Map<String, dynamic> json) =>
      _$RecommendSongReasonFromJson(json);

  Map<String, dynamic> toJson() => _$RecommendSongReasonToJson(this);
}

@JsonSerializable()
class RecommendSongListWrap {
  late List<Song2> dailySongs;
  late List<Song2> orderSongs;
  late List<RecommendSongReason> recommendReasons;

  RecommendSongListWrap();

  factory RecommendSongListWrap.fromJson(Map<String, dynamic> json) =>
      _$RecommendSongListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$RecommendSongListWrapToJson(this);
}

@JsonSerializable()
class RecommendSongListWrapX extends ServerStatusBean {
  late RecommendSongListWrap data;

  RecommendSongListWrapX();

  factory RecommendSongListWrapX.fromJson(Map<String, dynamic> json) =>
      _$RecommendSongListWrapXFromJson(json);

  Map<String, dynamic> toJson() => _$RecommendSongListWrapXToJson(this);
}

@JsonSerializable()
class RecommendSongListHistoryWrap {
  late List<String> dates;

  late String purchaseUrl;

  late String description;

  late String noHistoryMessage;

  late List<Song2> songs;

  RecommendSongListHistoryWrap();

  factory RecommendSongListHistoryWrap.fromJson(Map<String, dynamic> json) =>
      _$RecommendSongListHistoryWrapFromJson(json);

  Map<String, dynamic> toJson() => _$RecommendSongListHistoryWrapToJson(this);
}

@JsonSerializable()
class RecommendSongListHistoryWrapX extends ServerStatusBean {
  late RecommendSongListHistoryWrap data;

  RecommendSongListHistoryWrapX();

  factory RecommendSongListHistoryWrapX.fromJson(Map<String, dynamic> json) =>
      _$RecommendSongListHistoryWrapXFromJson(json);

  Map<String, dynamic> toJson() => _$RecommendSongListHistoryWrapXToJson(this);
}

@JsonSerializable()
class ArtistSongListWrap extends ServerStatusBean {
  late List<Song2> songs;

  ArtistSongListWrap();

  factory ArtistSongListWrap.fromJson(Map<String, dynamic> json) =>
      _$ArtistSongListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistSongListWrapToJson(this);
}

@JsonSerializable()
class ArtistNewSongListData {
  late bool hasMore;
  late int newSongCount;
  late List<Song2> newWorks;

  ArtistNewSongListData();

  factory ArtistNewSongListData.fromJson(Map<String, dynamic> json) =>
      _$ArtistNewSongListDataFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistNewSongListDataToJson(this);
}

@JsonSerializable()
class ArtistNewSongListWrap extends ServerStatusBean {
  late ArtistNewSongListData data;

  ArtistNewSongListWrap();

  factory ArtistNewSongListWrap.fromJson(Map<String, dynamic> json) =>
      _$ArtistNewSongListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistNewSongListWrapToJson(this);
}

@JsonSerializable()
class ArtistDetailAndSongListWrap extends ServerStatusBean {
  late List<Song2> hotSongs;

  late Artists artist;

  ArtistDetailAndSongListWrap();

  factory ArtistDetailAndSongListWrap.fromJson(Map<String, dynamic> json) =>
      _$ArtistDetailAndSongListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistDetailAndSongListWrapToJson(this);
}

@JsonSerializable()
class Play {
  @JsonKey(fromJson: dynamicToString)
  late String id;

  @JsonKey(fromJson: dynamicToString)
  late String userId;

  //歌单名
  late String name;
  late String description;
  late String coverImgUrl;

  late String tag;
  late List<String> tags;
  late String copywriter;

  late int createTime;
  late int updateTime;

  @JsonKey(fromJson: dynamicToInt)
  late int playCount;
  late int subscribedCount;
  late int shareCount;
  late int commentCount;

  late int trackCount;
  late int trackNumberUpdateTime;

  late String commentThreadId;

  late String alg;

  // 歌单类型:
  // 0: 自建?
  // 5: 我喜欢的音乐
  late int specialType;

  late NeteaseUserInfo creator;

  late List<NeteaseUserInfo> subscribers;

  late List<PlayTrack> tracks;
  late List<PlayTrackId> trackIds;

  Play();

  @override
  String toString() {
    return 'Play{id: $id, name: $name}';
  }

  factory Play.fromJson(Map<String, dynamic> json) => _$PlayFromJson(json);

  Map<String, dynamic> toJson() => _$PlayToJson(this);
}

@JsonSerializable()
class PlayTrack {
  @JsonKey(fromJson: dynamicToString)
  late String id;

  late String name;
  late int pst;
  late int t;

  late List<Artists> ar;
  late double pop;
  late int st;
  late String rt;
  late int fee;
  late int v;
  late String cf;
  late Album al;
  late int dt;
  late Music2 h;
  late Music2 m;
  late Music2 l;
  late Music2 a;
  late String cd;
  late int no;
  late int ftype;
  late List<dynamic> rtUrls;
  late int djId;
  late int copyright;
  late int s_id;
  late int mark;
  late int originCoverType;
  late int single;
  late int rtype;
  late int mst;
  late int cp;
  late int mv;
  late int publishTime;

  PlayTrack();

  factory PlayTrack.fromJson(Map<String, dynamic> json) =>
      _$PlayTrackFromJson(json);

  Map<String, dynamic> toJson() => _$PlayTrackToJson(this);
}

@JsonSerializable()
class PlayTrackId {
  @JsonKey(fromJson: dynamicToString)
  late String id;

  late int v;
  late int t;
  late int at;
  late int lr;

  PlayTrackId();

  factory PlayTrackId.fromJson(Map<String, dynamic> json) =>
      _$PlayTrackIdFromJson(json);

  Map<String, dynamic> toJson() => _$PlayTrackIdToJson(this);
}

@JsonSerializable()
class MultiPlayListWrap extends ServerStatusBean {
  late List<Play> playlists;

  MultiPlayListWrap();

  factory MultiPlayListWrap.fromJson(Map<String, dynamic> json) =>
      _$MultiPlayListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$MultiPlayListWrapToJson(this);
}

@JsonSerializable()
class MultiPlayListWrap2 extends ServerStatusBean {
  late List<Play> playlist;

  MultiPlayListWrap2();

  factory MultiPlayListWrap2.fromJson(Map<String, dynamic> json) =>
      _$MultiPlayListWrap2FromJson(json);

  Map<String, dynamic> toJson() => _$MultiPlayListWrap2ToJson(this);
}

@JsonSerializable()
class RecommendPlayListWrap extends ServerStatusBean {
  late List<Play> recommend;

  late bool featureFirst;
  late bool haveRcmdSongs;

  RecommendPlayListWrap();

  factory RecommendPlayListWrap.fromJson(Map<String, dynamic> json) =>
      _$RecommendPlayListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$RecommendPlayListWrapToJson(this);
}

@JsonSerializable()
class PersonalizedPlayListWrap extends ServerStatusBean {
  late List<Play> result;

  late bool hasTaste;
  late int category;

  PersonalizedPlayListWrap();

  factory PersonalizedPlayListWrap.fromJson(Map<String, dynamic> json) =>
      _$PersonalizedPlayListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalizedPlayListWrapToJson(this);
}

@JsonSerializable()
class PlaylistCatalogueItem {
  late String name;
  late int resourceCount;
  late String imgUrl;

  late int type;
  late int category;
  late int resourceType;
  late bool hot;
  late bool activity;

  PlaylistCatalogueItem();

  factory PlaylistCatalogueItem.fromJson(Map<String, dynamic> json) =>
      _$PlaylistCatalogueItemFromJson(json);

  Map<String, dynamic> toJson() => _$PlaylistCatalogueItemToJson(this);
}

@JsonSerializable()
class PlaylistCatalogueWrap extends ServerStatusBean {
  late PlaylistCatalogueItem all;
  late List<PlaylistCatalogueItem> sub;

  late Map<int, String> categories;

  PlaylistCatalogueWrap();

  factory PlaylistCatalogueWrap.fromJson(Map<String, dynamic> json) =>
      _$PlaylistCatalogueWrapFromJson(json);

  Map<String, dynamic> toJson() => _$PlaylistCatalogueWrapToJson(this);
}

@JsonSerializable()
class PlaylistHotTag {
  @JsonKey(fromJson: dynamicToString)
  late String id;

  late String name;

  late int category;

  late int usedCount;

  late int type;

  late int position;
  late int highQuality;
  late int highQualityPos;
  late int officialPos;

  late int createTime;

  PlaylistHotTag();

  factory PlaylistHotTag.fromJson(Map<String, dynamic> json) =>
      _$PlaylistHotTagFromJson(json);

  Map<String, dynamic> toJson() => _$PlaylistHotTagToJson(this);
}

@JsonSerializable()
class PlaylistHotTagsItem {
  @JsonKey(fromJson: dynamicToString)
  late String id;

  late String name;

  late bool activity;
  late bool hot;

  late int position;
  late int category;
  late int createTime;

  late int type;

  late PlaylistHotTag playlistTag;

  PlaylistHotTagsItem();

  factory PlaylistHotTagsItem.fromJson(Map<String, dynamic> json) =>
      _$PlaylistHotTagsItemFromJson(json);

  Map<String, dynamic> toJson() => _$PlaylistHotTagsItemToJson(this);
}

@JsonSerializable()
class PlaylistHotTagsWrap extends ServerStatusBean {
  late List<PlaylistHotTagsItem> tags;

  PlaylistHotTagsWrap();

  factory PlaylistHotTagsWrap.fromJson(Map<String, dynamic> json) =>
      _$PlaylistHotTagsWrapFromJson(json);

  Map<String, dynamic> toJson() => _$PlaylistHotTagsWrapToJson(this);
}

const PLAYLIST_CATEGORY = [
  {'name': '云音乐新歌榜', 'id': '3779629'},
  {'name': '云音乐热歌榜', 'id': '3778678'},
  {'name': '云音乐原创榜', 'id': '2884035'},
  {'name': '云音乐飙升榜', 'id': '19723756'},
  {'name': '云音乐电音榜', 'id': '10520166'},
  {'name': 'UK排行榜周榜', 'id': '180106'},
  {'name': '美国Billboard周榜', 'id': '60198'},
  {'name': 'KTV嗨榜', 'id': '21845217'},
  {'name': 'iTunes榜', 'id': '11641012'},
  {'name': 'Hit FM Top榜', 'id': '120001'},
  {'name': '日本Oricon周榜', 'id': '60131'},
  {'name': '韩国Melon排行榜周榜', 'id': '3733003'},
  {'name': '韩国Mnet排行榜周榜', 'id': '60255'},
  {'name': '韩国Melon原声周榜', 'id': '46772709'},
  {'name': '中国TOP排行榜(港台榜)', 'id': '112504'},
  {'name': '中国TOP排行榜(内地榜)', 'id': '64016'},
  {'name': '香港电台中文歌曲龙虎榜', 'id': '10169002'},
  {'name': '华语金曲榜', 'id': '4395559'},
  {'name': '中国嘻哈榜', 'id': '1899724'},
  {'name': '法国 NRJ EuroHot 30周榜', 'id': '27135204'},
  {'name': '台湾Hito排行榜', 'id': '112463'},
  {'name': 'Beatport全球电子舞曲榜', 'id': '3812895'},
  {'name': '云音乐ACG音乐榜', 'id': '71385702'},
  {'name': '云音乐说唱榜,', 'id': '991319590'},
  {'name': '云音乐古典音乐榜', 'id': '71384707'},
  {'name': '云音乐电音榜', 'id': '1978921795'},
  {'name': '抖音排行榜', 'id': '2250011882'},
  {'name': '新声榜', 'id': '2617766278'},
  {'name': '云音乐韩语榜', 'id': '745956260'},
  {'name': '英国Q杂志中文版周榜', 'id': '2023401535'},
  {'name': '电竞音乐榜', 'id': '2006508653'},
  {'name': '云音乐欧美热歌榜', 'id': '2809513713'},
  {'name': '云音乐欧美新歌榜', 'id': '2809577409'},
  {'name': '说唱TOP榜', 'id': '2847251561'},
  {'name': '云音乐ACG动画榜', 'id': '3001835560'},
  {'name': '云音乐ACG游戏榜', 'id': '3001795926'},
  {'name': '云音乐ACG VOCALOID榜', 'id': '3001890046'}
];

@JsonSerializable()
class SinglePlayListWrap extends ServerStatusBean {
  late Play playlist;

  SinglePlayListWrap();

  factory SinglePlayListWrap.fromJson(Map<String, dynamic> json) =>
      _$SinglePlayListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$SinglePlayListWrapToJson(this);
}

@JsonSerializable()
class PlayListDetailDynamicWrap extends ServerStatusBean {
  late int commentCount;
  late int shareCount;
  late int playCount;
  late int bookedCount;

  late bool subscribed;

  late String remarkName;

  late bool followed;

  PlayListDetailDynamicWrap();

  factory PlayListDetailDynamicWrap.fromJson(Map<String, dynamic> json) =>
      _$PlayListDetailDynamicWrapFromJson(json);

  Map<String, dynamic> toJson() => _$PlayListDetailDynamicWrapToJson(this);
}

@JsonSerializable()
class PlaymodeIntelligenceItem {
  @JsonKey(fromJson: dynamicToString)
  late String id;

  late bool recommended;

  late String alg;

  late Song songInfo;

  PlaymodeIntelligenceItem();

  factory PlaymodeIntelligenceItem.fromJson(Map<String, dynamic> json) =>
      _$PlaymodeIntelligenceItemFromJson(json);

  Map<String, dynamic> toJson() => _$PlaymodeIntelligenceItemToJson(this);
}

@JsonSerializable()
class PlaymodeIntelligenceListWrap extends ServerStatusBean {
  late List<PlaymodeIntelligenceItem> data;

  PlaymodeIntelligenceListWrap();

  factory PlaymodeIntelligenceListWrap.fromJson(Map<String, dynamic> json) =>
      _$PlaymodeIntelligenceListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$PlaymodeIntelligenceListWrapToJson(this);
}

@JsonSerializable()
class Artists {
  @JsonKey(fromJson: dynamicToString)
  late String id;
  @JsonKey(fromJson: dynamicToString)
  late String accountId;

  late String name;

  late String picUrl;

  late int img1v1Id;
  late String img1v1Url;
  late String cover;

  late int albumSize;
  late int musicSize;
  late int mvSize;
  late int topicPerson;

  late String trans;
  late String briefDesc;

  late bool followed;

  late int publishTime;

  Artists();

  factory Artists.fromJson(Map<String, dynamic> json) =>
      _$ArtistsFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistsToJson(this);
}

@JsonSerializable()
class ArtistsListWrap extends ServerStatusBean {
  late List<Artists> artists;

  ArtistsListWrap();

  factory ArtistsListWrap.fromJson(Map<String, dynamic> json) =>
      _$ArtistsListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistsListWrapToJson(this);
}

@JsonSerializable()
class ArtistsTopListWrap {
  late List<Artists> artists;

  late int type;
  late int updateTime;

  ArtistsTopListWrap();

  factory ArtistsTopListWrap.fromJson(Map<String, dynamic> json) =>
      _$ArtistsTopListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistsTopListWrapToJson(this);
}

@JsonSerializable()
class ArtistsTopListWrapX extends ServerStatusBean {
  late ArtistsTopListWrap list;

  ArtistsTopListWrapX();

  factory ArtistsTopListWrapX.fromJson(Map<String, dynamic> json) =>
      _$ArtistsTopListWrapXFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistsTopListWrapXToJson(this);
}

@JsonSerializable()
class ArtistIntroduction {
  late String ti;
  late String txt;

  ArtistIntroduction();

  factory ArtistIntroduction.fromJson(Map<String, dynamic> json) =>
      _$ArtistIntroductionFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistIntroductionToJson(this);
}

@JsonSerializable()
class ArtistDescWrap extends ServerStatusBean {
  late List<ArtistIntroduction> introduction;

  late String briefDesc;

  late int count;

  late List<TopicItem2> topicData;

  ArtistDescWrap();

  factory ArtistDescWrap.fromJson(Map<String, dynamic> json) =>
      _$ArtistDescWrapFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistDescWrapToJson(this);
}

@JsonSerializable()
class ArtistDetailData {
  late bool blacklist;
  late bool showPriMsg;
  late int videoCount;

  late Artists artist;

  ArtistDetailData();

  factory ArtistDetailData.fromJson(Map<String, dynamic> json) =>
      _$ArtistDetailDataFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistDetailDataToJson(this);
}

@JsonSerializable()
class ArtistDetailWrap extends ServerStatusBean {
  late ArtistDetailData data;

  ArtistDetailWrap();

  factory ArtistDetailWrap.fromJson(Map<String, dynamic> json) =>
      _$ArtistDetailWrapFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistDetailWrapToJson(this);
}

@JsonSerializable()
class Album {
  @JsonKey(fromJson: dynamicToString)
  late String id;

  late String name;

  late String type;
  late String subType;

  late int mark;
  late int size;
  late int publishTime;

  late String picUrl;

  late String tags;

  late int copyrightId;
  late int companyId;
  late String company;

  late String description;
  late String briefDesc;

  late Artists artist;
  late List<Artists> artists;

  late bool isSub;
  late bool paid;
  late bool onSale;

  Album();

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumToJson(this);
}

@JsonSerializable()
class AlbumDetailWrap extends ServerStatusBean {
  late List<Song2> songs;

  late Album album;

  AlbumDetailWrap();

  factory AlbumDetailWrap.fromJson(Map<String, dynamic> json) =>
      _$AlbumDetailWrapFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumDetailWrapToJson(this);
}

@JsonSerializable()
class AlbumDetailDynamicWrap extends ServerStatusBean {
  late bool onSale;
  late bool isSub;

  late int subTime;

  late int commentCount;
  late int likedCount;
  late int shareCount;
  late int subCount;

  AlbumDetailDynamicWrap();

  factory AlbumDetailDynamicWrap.fromJson(Map<String, dynamic> json) =>
      _$AlbumDetailDynamicWrapFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumDetailDynamicWrapToJson(this);
}

@JsonSerializable()
class AlbumListWrap extends ServerStatusListBean {
  late List<Album> albums;

  AlbumListWrap();

  factory AlbumListWrap.fromJson(Map<String, dynamic> json) =>
      _$AlbumListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumListWrapToJson(this);
}

@JsonSerializable()
class ArtistAlbumListWrap extends ServerStatusListBean {
  late int time;

  late List<Album> hotAlbums;

  late Artists artist;

  ArtistAlbumListWrap();

  factory ArtistAlbumListWrap.fromJson(Map<String, dynamic> json) =>
      _$ArtistAlbumListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistAlbumListWrapToJson(this);
}

@JsonSerializable()
class MvCreator {
  @JsonKey(fromJson: dynamicToString)
  late String userId;

  late String userName;

  MvCreator();

  factory MvCreator.fromJson(Map<String, dynamic> json) =>
      _$MvCreatorFromJson(json);

  Map<String, dynamic> toJson() => _$MvCreatorToJson(this);
}

@JsonSerializable()
class Mv {
  @JsonKey(fromJson: dynamicToString)
  late String id;

  late String name;

  late String cover;

  late int playCount;
  late String briefDesc;
  late String desc;

  late String arTransName;

  late String artisAlias;
  late String artisTransName;
  late String artistName;
  late String artistImgUrl;
  late int artistId;

  late int mvId;
  late String mvName;
  late String mvCoverUrl;

  late int duration;
  late int publishTime;
  late String publishDate;
  late int mark;

  late String alg;

  late List<Artists> artists;

  Mv();

  factory Mv.fromJson(Map<String, dynamic> json) => _$MvFromJson(json);

  Map<String, dynamic> toJson() => _$MvToJson(this);
}

@JsonSerializable()
class Mv2 {
  late int type;

  late String title;
  late int durationms;

  late int playTime;

  late String vid;
  late String coverUrl;

  late String aliaName;
  late String transName;

  late List<MvCreator> creator;

  Mv2();

  factory Mv2.fromJson(Map<String, dynamic> json) => _$Mv2FromJson(json);

  Map<String, dynamic> toJson() => _$Mv2ToJson(this);
}

@JsonSerializable()
class Mv3 {
  @JsonKey(fromJson: dynamicToString)
  late String id;

  late String name;
  late String artistName;
  late String imgurl;
  late String imgurl16v9;

  late int status;

  late Artists artist;

  Mv3();

  factory Mv3.fromJson(Map<String, dynamic> json) => _$Mv3FromJson(json);

  Map<String, dynamic> toJson() => _$Mv3ToJson(this);
}

@JsonSerializable()
class MvListWrap extends ServerStatusListBean {
  late List<Mv> mvs;

  MvListWrap();

  factory MvListWrap.fromJson(Map<String, dynamic> json) =>
      _$MvListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$MvListWrapToJson(this);
}

@JsonSerializable()
class MvListWrap2 extends ServerStatusListBean {
  late List<Mv> data;

  late int updateTime;

  MvListWrap2();

  factory MvListWrap2.fromJson(Map<String, dynamic> json) =>
      _$MvListWrap2FromJson(json);

  Map<String, dynamic> toJson() => _$MvListWrap2ToJson(this);
}

@JsonSerializable()
class PersonalizedMvListWrap extends ServerStatusBean {
  late List<Mv> result;

  late int category;

  PersonalizedMvListWrap();

  factory PersonalizedMvListWrap.fromJson(Map<String, dynamic> json) =>
      _$PersonalizedMvListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalizedMvListWrapToJson(this);
}

@JsonSerializable()
class ArtistMvListWrap extends MvListWrap {
  late int time;

  ArtistMvListWrap();

  factory ArtistMvListWrap.fromJson(Map<String, dynamic> json) =>
      _$ArtistMvListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistMvListWrapToJson(this);
}

@JsonSerializable()
class ArtistNewMvListData {
  late bool hasMore;
  late List<Mv> newWorks;

  ArtistNewMvListData();

  factory ArtistNewMvListData.fromJson(Map<String, dynamic> json) =>
      _$ArtistNewMvListDataFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistNewMvListDataToJson(this);
}

@JsonSerializable()
class ArtistNewMvListWrap extends ServerStatusBean {
  late ArtistNewMvListData data;

  ArtistNewMvListWrap();

  factory ArtistNewMvListWrap.fromJson(Map<String, dynamic> json) =>
      _$ArtistNewMvListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistNewMvListWrapToJson(this);
}

@JsonSerializable()
class MvDetailWrap extends ServerStatusBean {
  late String loadingPic;
  late String bufferPic;
  late String loadingPicFS;
  late String bufferPicFS;

  late bool subed;

  late Mv data;

  MvDetailWrap();

  factory MvDetailWrap.fromJson(Map<String, dynamic> json) =>
      _$MvDetailWrapFromJson(json);

  Map<String, dynamic> toJson() => _$MvDetailWrapToJson(this);
}

@JsonSerializable()
class MvDetailInfoWrap extends ServerStatusBean {
  late int likedCount;
  late int shareCount;
  late int commentCount;

  late bool liked;

  MvDetailInfoWrap();

  factory MvDetailInfoWrap.fromJson(Map<String, dynamic> json) =>
      _$MvDetailInfoWrapFromJson(json);

  Map<String, dynamic> toJson() => _$MvDetailInfoWrapToJson(this);
}

@JsonSerializable()
class MvUrl {
  @JsonKey(fromJson: dynamicToString)
  late String id;

  late String url;
  late String md5;
  late String msg;

  late int r;
  late int size;
  late int expi;
  late int fee;
  late int mvFee;
  late int st;

  MvUrl();

  factory MvUrl.fromJson(Map<String, dynamic> json) => _$MvUrlFromJson(json);

  Map<String, dynamic> toJson() => _$MvUrlToJson(this);
}

@JsonSerializable()
class MvUrlWrap extends ServerStatusBean {
  late MvUrl data;

  MvUrlWrap();

  factory MvUrlWrap.fromJson(Map<String, dynamic> json) =>
      _$MvUrlWrapFromJson(json);

  Map<String, dynamic> toJson() => _$MvUrlWrapToJson(this);
}

@JsonSerializable()
class VideoResolution {
  late int resolution;
  late int size;

  VideoResolution();

  factory VideoResolution.fromJson(Map<String, dynamic> json) =>
      _$VideoResolutionFromJson(json);

  Map<String, dynamic> toJson() => _$VideoResolutionToJson(this);
}

@JsonSerializable()
class VideoUrlInfo {
  late String id;
  late String url;
  late int size;
  late int validityTime;
  late bool needPay;
  late int r;

  VideoUrlInfo();

  factory VideoUrlInfo.fromJson(Map<String, dynamic> json) =>
      _$VideoUrlInfoFromJson(json);

  Map<String, dynamic> toJson() => _$VideoUrlInfoToJson(this);
}

@JsonSerializable()
class VideoBase {
  late String vid;
  late String title;
  late String description;
  late String scm;
  late String alg;
  late String threadId;
  late String coverUrl;
  late String previewUrl;

  late int width;
  late int height;
  late int praisedCount;
  late int playTime;
  late int durationms;
  late int previewDurationms;

  late int commentCount;
  late int shareCount;

  late bool praised;
  late bool subscribed;
  late bool hasRelatedGameAd;

  late List<VideoResolution> resolutions;

  late VideoUrlInfo urlInfo;
  late List<VideoMetaItem> videoGroup;
  late List<Song> relateSong;

  VideoBase();

  factory VideoBase.fromJson(Map<String, dynamic> json) =>
      _$VideoBaseFromJson(json);

  Map<String, dynamic> toJson() => _$VideoBaseToJson(this);
}

@JsonSerializable()
class Video extends VideoBase {
  late NeteaseUserInfo creator;

  Video();

  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);

  Map<String, dynamic> toJson() => _$VideoToJson(this);
}

@JsonSerializable()
class Video2 extends VideoBase {
  late List<NeteaseUserInfo> creator;

  Video2();

  factory Video2.fromJson(Map<String, dynamic> json) => _$Video2FromJson(json);

  Map<String, dynamic> toJson() => _$Video2ToJson(this);
}

@JsonSerializable()
class VideoMetaItem {
  @JsonKey(fromJson: dynamicToString)
  late String id;

  late String name;
  late String url;
  late String relatedVideoType;

  late bool selectTab;

  VideoMetaItem();

  factory VideoMetaItem.fromJson(Map<String, dynamic> json) =>
      _$VideoMetaItemFromJson(json);

  Map<String, dynamic> toJson() => _$VideoMetaItemToJson(this);
}

@JsonSerializable()
class VideoMetaListWrap extends ServerStatusBean {
  late List<VideoMetaItem> data;

  VideoMetaListWrap();

  factory VideoMetaListWrap.fromJson(Map<String, dynamic> json) =>
      _$VideoMetaListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$VideoMetaListWrapToJson(this);
}

@JsonSerializable()
class VideoWrap {
  late int type;
  late bool displayed;
  late String alg;
  late String extAlg;

  late Video data;

  VideoWrap();

  factory VideoWrap.fromJson(Map<String, dynamic> json) =>
      _$VideoWrapFromJson(json);

  Map<String, dynamic> toJson() => _$VideoWrapToJson(this);
}

@JsonSerializable()
class VideoListWrapX extends ServerStatusListBean {
  late List<VideoWrap> datas;

  late int rcmdLimit;

  VideoListWrapX();

  factory VideoListWrapX.fromJson(Map<String, dynamic> json) =>
      _$VideoListWrapXFromJson(json);

  Map<String, dynamic> toJson() => _$VideoListWrapXToJson(this);
}

@JsonSerializable()
class VideoListWrap extends ServerStatusBean {
  late List<Video2> data;

  VideoListWrap();

  factory VideoListWrap.fromJson(Map<String, dynamic> json) =>
      _$VideoListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$VideoListWrapToJson(this);
}

@JsonSerializable()
class VideoDetailWrap extends ServerStatusBean {
  late Video data;

  VideoDetailWrap();

  factory VideoDetailWrap.fromJson(Map<String, dynamic> json) =>
      _$VideoDetailWrapFromJson(json);

  Map<String, dynamic> toJson() => _$VideoDetailWrapToJson(this);
}

@JsonSerializable()
class VideoDetailInfoWrap extends ServerStatusBean {
  late int likedCount;
  late int shareCount;
  late int commentCount;

  late bool liked;

  VideoDetailInfoWrap();

  factory VideoDetailInfoWrap.fromJson(Map<String, dynamic> json) =>
      _$VideoDetailInfoWrapFromJson(json);

  Map<String, dynamic> toJson() => _$VideoDetailInfoWrapToJson(this);
}

@JsonSerializable()
class VideoUrl {
  @JsonKey(fromJson: dynamicToString)
  late String id;

  late String url;
  late int size;
  late int validityTime;

  late bool needPay;

  late int r;

  VideoUrl();

  factory VideoUrl.fromJson(Map<String, dynamic> json) =>
      _$VideoUrlFromJson(json);

  Map<String, dynamic> toJson() => _$VideoUrlToJson(this);
}

@JsonSerializable()
class VideoUrlWrap extends ServerStatusBean {
  late List<VideoUrl> urls;

  VideoUrlWrap();

  factory VideoUrlWrap.fromJson(Map<String, dynamic> json) =>
      _$VideoUrlWrapFromJson(json);

  Map<String, dynamic> toJson() => _$VideoUrlWrapToJson(this);
}
