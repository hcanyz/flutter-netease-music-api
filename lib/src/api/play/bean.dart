import 'package:json_annotation/json_annotation.dart';
import 'package:netease_music_api/src/api/bean.dart';
import 'package:netease_music_api/src/api/user/bean.dart';

part 'bean.g.dart';

@JsonSerializable()
class Music {
  @JsonKey(fromJson: dynamicToString)
  String id;

  String name;

  int size;
  String extension;

  int sr;
  int dfsId;
  int bitrate;
  int playTime;
  double volumeDelta;

  Music();

  factory Music.fromJson(Map<String, dynamic> json) => _$MusicFromJson(json);

  Map<String, dynamic> toJson() => _$MusicToJson(this);
}

@JsonSerializable()
class Privilege {
  @JsonKey(fromJson: dynamicToString)
  String id;

  int fee;

  int payed;
  int st;
  int pl;
  int dl;
  int sp;
  int cp;
  int subp;
  bool cs;
  int maxbr;
  int fl;
  bool toast;
  int flag;
  bool preSell;

  Privilege();

  factory Privilege.fromJson(Map<String, dynamic> json) =>
      _$PrivilegeFromJson(json);

  Map<String, dynamic> toJson() => _$PrivilegeToJson(this);
}

@JsonSerializable()
class Artists {
  @JsonKey(fromJson: dynamicToString)
  String id;

  String name;

  //TODO
  String picUrl;

  int img1v1Id;
  int albumSize;
  int musicSize;
  int topicPerson;

  Artists();

  factory Artists.fromJson(Map<String, dynamic> json) =>
      _$ArtistsFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistsToJson(this);
}

@JsonSerializable()
class Album {
  @JsonKey(fromJson: dynamicToString)
  String id;

  String name;

  String type;
  String subType;

  int size;

  //TODO
  String picUrl;

  String tags;

  int companyId;
  String company;

  String description;
  String briefDesc;

  Artists artist;
  List<Artists> artists;

  Album();

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumToJson(this);
}

@JsonSerializable()
class Song {
  @JsonKey(fromJson: dynamicToString)
  String id;

  String name;

  int copyrightId;

  String disc;
  int no;
  int fee;
  int status;

  bool starred;
  int starredNum;
  double popularity;
  int score;

  int duration;
  int playedNum;
  int dayPlays;
  int hearTime;

  String ringtone;
  String copyFrom;

  String commentThreadId;

  List<Artists> artists;

  Album album;

  Privilege privilege;

  int copyright;

  String transName;

  int mark;
  int rtype;
  int mvid;

  String alg;

  String reason;

  Music hMusic;
  Music mMusic;
  Music lMusic;
  Music bMusic;

  String noCopyrightRcmd;

  Song();

  factory Song.fromJson(Map<String, dynamic> json) => _$SongFromJson(json);

  Map<String, dynamic> toJson() => _$SongToJson(this);
}

@JsonSerializable()
class PlayItem {
  @JsonKey(fromJson: dynamicToString)
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

  String commentThreadId;

  // 歌单类型: TODO 待补充
  // 0: 自建?
  // 5: 我喜欢的音乐
  int specialType;

  PlayListCreator creator;

  List<PlayListSubscriber> subscribers;

  PlayItem();

  @override
  String toString() {
    return 'PlayItem{id: $id, name: $name}';
  }

  factory PlayItem.fromJson(Map<String, dynamic> json) =>
      _$PlayItemFromJson(json);

  Map<String, dynamic> toJson() => _$PlayItemToJson(this);
}

@JsonSerializable()
class MultiPlayListWrap extends ServerStatusBean {
  List<PlayItem> playlists;

  MultiPlayListWrap();

  factory MultiPlayListWrap.fromJson(Map<String, dynamic> json) =>
      _$MultiPlayListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$MultiPlayListWrapToJson(this);
}

@JsonSerializable()
class MultiPlayListWrap2 extends ServerStatusBean {
  List<PlayItem> playlist;

  MultiPlayListWrap2();

  factory MultiPlayListWrap2.fromJson(Map<String, dynamic> json) =>
      _$MultiPlayListWrap2FromJson(json);

  Map<String, dynamic> toJson() => _$MultiPlayListWrap2ToJson(this);
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
  PlayItem playlist;

  SinglePlayListWrap();

  factory SinglePlayListWrap.fromJson(Map<String, dynamic> json) =>
      _$SinglePlayListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$SinglePlayListWrapToJson(this);
}

@JsonSerializable()
class RecommendSongListWrap extends ServerStatusBean {
  List<Song> recommend;

  RecommendSongListWrap();

  factory RecommendSongListWrap.fromJson(Map<String, dynamic> json) =>
      _$RecommendSongListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$RecommendSongListWrapToJson(this);
}

@JsonSerializable()
class PlaymodeIntelligenceItem {
  @JsonKey(fromJson: dynamicToString)
  String id;

  bool recommended;

  String alg;

  Song songInfo;

  PlaymodeIntelligenceItem();

  factory PlaymodeIntelligenceItem.fromJson(Map<String, dynamic> json) =>
      _$PlaymodeIntelligenceItemFromJson(json);

  Map<String, dynamic> toJson() => _$PlaymodeIntelligenceItemToJson(this);
}

@JsonSerializable()
class PlaymodeIntelligenceListWrap extends ServerStatusBean {
  List<PlaymodeIntelligenceItem> data;

  PlaymodeIntelligenceListWrap();

  factory PlaymodeIntelligenceListWrap.fromJson(Map<String, dynamic> json) =>
      _$PlaymodeIntelligenceListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$PlaymodeIntelligenceListWrapToJson(this);
}
