import 'package:json_annotation/json_annotation.dart';
import 'package:netease_music_api/src/api/bean.dart';
import 'package:netease_music_api/src/api/dj/bean.dart';
import 'package:netease_music_api/src/api/play/bean.dart';
import 'package:netease_music_api/src/api/user/bean.dart';

part 'bean.g.dart';

@JsonSerializable()
class SearchSongWrap {
  List<Song> songs;

  SearchSongWrap();

  factory SearchSongWrap.fromJson(Map<String, dynamic> json) =>
      _$SearchSongWrapFromJson(json);

  Map<String, dynamic> toJson() => _$SearchSongWrapToJson(this);
}

@JsonSerializable()
class SearchSongWrapX extends ServerStatusBean {
  SearchSongWrap result;

  SearchSongWrapX();

  factory SearchSongWrapX.fromJson(Map<String, dynamic> json) =>
      _$SearchSongWrapXFromJson(json);

  Map<String, dynamic> toJson() => _$SearchSongWrapXToJson(this);
}

@JsonSerializable()
class SearchAlbumsWrap {
  List<Album> albums;

  SearchAlbumsWrap();

  factory SearchAlbumsWrap.fromJson(Map<String, dynamic> json) =>
      _$SearchAlbumsWrapFromJson(json);

  Map<String, dynamic> toJson() => _$SearchAlbumsWrapToJson(this);
}

@JsonSerializable()
class SearchAlbumsWrapX extends ServerStatusBean {
  SearchAlbumsWrap result;

  SearchAlbumsWrapX();

  factory SearchAlbumsWrapX.fromJson(Map<String, dynamic> json) =>
      _$SearchAlbumsWrapXFromJson(json);

  Map<String, dynamic> toJson() => _$SearchAlbumsWrapXToJson(this);
}

@JsonSerializable()
class SearchArtistsWrap {
  List<Artists> artists;

  SearchArtistsWrap();

  factory SearchArtistsWrap.fromJson(Map<String, dynamic> json) =>
      _$SearchArtistsWrapFromJson(json);

  Map<String, dynamic> toJson() => _$SearchArtistsWrapToJson(this);
}

@JsonSerializable()
class SearchArtistsWrapX extends ServerStatusBean {
  SearchArtistsWrap result;

  SearchArtistsWrapX();

  factory SearchArtistsWrapX.fromJson(Map<String, dynamic> json) =>
      _$SearchArtistsWrapXFromJson(json);

  Map<String, dynamic> toJson() => _$SearchArtistsWrapXToJson(this);
}

@JsonSerializable()
class SearchPlaylistWrap {
  List<PlayItem> playlists;

  SearchPlaylistWrap();

  factory SearchPlaylistWrap.fromJson(Map<String, dynamic> json) =>
      _$SearchPlaylistWrapFromJson(json);

  Map<String, dynamic> toJson() => _$SearchPlaylistWrapToJson(this);
}

@JsonSerializable()
class SearchPlaylistWrapX extends ServerStatusBean {
  SearchPlaylistWrap result;

  SearchPlaylistWrapX();

  factory SearchPlaylistWrapX.fromJson(Map<String, dynamic> json) =>
      _$SearchPlaylistWrapXFromJson(json);

  Map<String, dynamic> toJson() => _$SearchPlaylistWrapXToJson(this);
}

@JsonSerializable()
class SearchUserWrap {
  List<NeteaseUserInfo> userprofiles;

  SearchUserWrap();

  factory SearchUserWrap.fromJson(Map<String, dynamic> json) =>
      _$SearchUserWrapFromJson(json);

  Map<String, dynamic> toJson() => _$SearchUserWrapToJson(this);
}

@JsonSerializable()
class SearchUserWrapX extends ServerStatusBean {
  SearchUserWrap result;

  SearchUserWrapX();

  factory SearchUserWrapX.fromJson(Map<String, dynamic> json) =>
      _$SearchUserWrapXFromJson(json);

  Map<String, dynamic> toJson() => _$SearchUserWrapXToJson(this);
}

@JsonSerializable()
class SearchMvWrap {
  List<Mv> mvs;

  SearchMvWrap();

  factory SearchMvWrap.fromJson(Map<String, dynamic> json) =>
      _$SearchMvWrapFromJson(json);

  Map<String, dynamic> toJson() => _$SearchMvWrapToJson(this);
}

@JsonSerializable()
class SearchMvWrapX extends ServerStatusBean {
  SearchMvWrap result;

  SearchMvWrapX();

  factory SearchMvWrapX.fromJson(Map<String, dynamic> json) =>
      _$SearchMvWrapXFromJson(json);

  Map<String, dynamic> toJson() => _$SearchMvWrapXToJson(this);
}

@JsonSerializable()
class SearchLyricsWrap {
  List<Song> songs;

  SearchLyricsWrap();

  factory SearchLyricsWrap.fromJson(Map<String, dynamic> json) =>
      _$SearchLyricsWrapFromJson(json);

  Map<String, dynamic> toJson() => _$SearchLyricsWrapToJson(this);
}

@JsonSerializable()
class SearchLyricsWrapX extends ServerStatusBean {
  SearchLyricsWrap result;

  SearchLyricsWrapX();

  factory SearchLyricsWrapX.fromJson(Map<String, dynamic> json) =>
      _$SearchLyricsWrapXFromJson(json);

  Map<String, dynamic> toJson() => _$SearchLyricsWrapXToJson(this);
}

@JsonSerializable()
class SearchDjradiorap {
  List<Dj> djRadios;

  SearchDjradiorap();

  factory SearchDjradiorap.fromJson(Map<String, dynamic> json) =>
      _$SearchDjradiorapFromJson(json);

  Map<String, dynamic> toJson() => _$SearchDjradiorapToJson(this);
}

@JsonSerializable()
class SearchDjradioWrapX extends ServerStatusBean {
  SearchDjradiorap result;

  SearchDjradioWrapX();

  factory SearchDjradioWrapX.fromJson(Map<String, dynamic> json) =>
      _$SearchDjradioWrapXFromJson(json);

  Map<String, dynamic> toJson() => _$SearchDjradioWrapXToJson(this);
}

@JsonSerializable()
class SearchVideoWrap {
  List<Mv2> videos;

  SearchVideoWrap();

  factory SearchVideoWrap.fromJson(Map<String, dynamic> json) =>
      _$SearchVideoWrapFromJson(json);

  Map<String, dynamic> toJson() => _$SearchVideoWrapToJson(this);
}

@JsonSerializable()
class SearchVideoWrapX extends ServerStatusBean {
  SearchVideoWrap result;

  SearchVideoWrapX();

  factory SearchVideoWrapX.fromJson(Map<String, dynamic> json) =>
      _$SearchVideoWrapXFromJson(json);

  Map<String, dynamic> toJson() => _$SearchVideoWrapXToJson(this);
}

@JsonSerializable()
class SearchComplexSong {
  List<Song> songs;

  String moreText;

  String highText;

  bool more;

  List<int> resourceIds;

  SearchComplexSong();

  factory SearchComplexSong.fromJson(Map<String, dynamic> json) =>
      _$SearchComplexSongFromJson(json);

  Map<String, dynamic> toJson() => _$SearchComplexSongToJson(this);
}

@JsonSerializable()
class SearchComplexMlog {
  //? mlogs;

  String moreText;

  bool more;

  List<int> resourceIds;

  SearchComplexMlog();

  factory SearchComplexMlog.fromJson(Map<String, dynamic> json) =>
      _$SearchComplexMlogFromJson(json);

  Map<String, dynamic> toJson() => _$SearchComplexMlogToJson(this);
}

@JsonSerializable()
class SearchComplexPlaylist {
  List<PlayItem> playLists;

  String moreText;

  String highText;

  bool more;

  List<int> resourceIds;

  SearchComplexPlaylist();

  factory SearchComplexPlaylist.fromJson(Map<String, dynamic> json) =>
      _$SearchComplexPlaylistFromJson(json);

  Map<String, dynamic> toJson() => _$SearchComplexPlaylistToJson(this);
}

@JsonSerializable()
class SearchComplexArtist {
  List<Artists> artists;

  String moreText;

  String highText;

  bool more;

  List<int> resourceIds;

  SearchComplexArtist();

  factory SearchComplexArtist.fromJson(Map<String, dynamic> json) =>
      _$SearchComplexArtistFromJson(json);

  Map<String, dynamic> toJson() => _$SearchComplexArtistToJson(this);
}

@JsonSerializable()
class SearchComplexAlbum {
  List<Album> albums;

  String moreText;

  String highText;

  bool more;

  List<int> resourceIds;

  SearchComplexAlbum();

  factory SearchComplexAlbum.fromJson(Map<String, dynamic> json) =>
      _$SearchComplexAlbumFromJson(json);

  Map<String, dynamic> toJson() => _$SearchComplexAlbumToJson(this);
}

@JsonSerializable()
class SearchComplexWrap {
  //TODO
  SearchComplexSong song;
  SearchComplexMlog mlog;
  SearchComplexPlaylist playList;
  SearchComplexArtist artist;
  SearchComplexAlbum album;

  SearchComplexWrap();

  factory SearchComplexWrap.fromJson(Map<String, dynamic> json) =>
      _$SearchComplexWrapFromJson(json);

  Map<String, dynamic> toJson() => _$SearchComplexWrapToJson(this);
}

@JsonSerializable()
class SearchComplexWrapX extends ServerStatusBean {
  SearchComplexWrap result;

  SearchComplexWrapX();

  factory SearchComplexWrapX.fromJson(Map<String, dynamic> json) =>
      _$SearchComplexWrapXFromJson(json);

  Map<String, dynamic> toJson() => _$SearchComplexWrapXToJson(this);
}

@JsonSerializable()
class SearchSearchKey {
  String showKeyword;
  int action;
  String realkeyword;
  int searchType;
  String alg;
  int gap;

  SearchSearchKey();

  factory SearchSearchKey.fromJson(Map<String, dynamic> json) =>
      _$SearchSearchKeyFromJson(json);

  Map<String, dynamic> toJson() => _$SearchSearchKeyToJson(this);
}

@JsonSerializable()
class SearchSearchKeyWrap extends ServerStatusBean {
  SearchSearchKey data;

  SearchSearchKeyWrap();

  factory SearchSearchKeyWrap.fromJson(Map<String, dynamic> json) =>
      _$SearchSearchKeyWrapFromJson(json);

  Map<String, dynamic> toJson() => _$SearchSearchKeyWrapToJson(this);
}

@JsonSerializable()
class SearchHotKey {
  String first;
  int second;
  int iconType;

  SearchHotKey();

  factory SearchHotKey.fromJson(Map<String, dynamic> json) =>
      _$SearchHotKeyFromJson(json);

  Map<String, dynamic> toJson() => _$SearchHotKeyToJson(this);
}

@JsonSerializable()
class SearchSearchHotKeyWrap {
  List<SearchHotKey> hots;

  SearchSearchHotKeyWrap();

  factory SearchSearchHotKeyWrap.fromJson(Map<String, dynamic> json) =>
      _$SearchSearchHotKeyWrapFromJson(json);

  Map<String, dynamic> toJson() => _$SearchSearchHotKeyWrapToJson(this);
}

@JsonSerializable()
class SearchSearchKeyWrapX extends ServerStatusBean {
  SearchSearchHotKeyWrap result;

  SearchSearchKeyWrapX();

  factory SearchSearchKeyWrapX.fromJson(Map<String, dynamic> json) =>
      _$SearchSearchKeyWrapXFromJson(json);

  Map<String, dynamic> toJson() => _$SearchSearchKeyWrapXToJson(this);
}

@JsonSerializable()
class SearchSearchKeyDetailedItem {
  String searchWord;
  String content;

  String iconUrl;
  String url;
  String alg;

  int score;
  int source;
  int iconType;

  SearchSearchKeyDetailedItem();

  factory SearchSearchKeyDetailedItem.fromJson(Map<String, dynamic> json) =>
      _$SearchSearchKeyDetailedItemFromJson(json);

  Map<String, dynamic> toJson() => _$SearchSearchKeyDetailedItemToJson(this);
}

@JsonSerializable()
class SearchSearchKeyDetailedWrap extends ServerStatusBean {
  List<SearchSearchKeyDetailedItem> data;

  SearchSearchKeyDetailedWrap();

  factory SearchSearchKeyDetailedWrap.fromJson(Map<String, dynamic> json) =>
      _$SearchSearchKeyDetailedWrapFromJson(json);

  Map<String, dynamic> toJson() => _$SearchSearchKeyDetailedWrapToJson(this);
}
