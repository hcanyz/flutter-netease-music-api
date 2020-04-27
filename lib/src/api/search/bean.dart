import 'package:json_annotation/json_annotation.dart';
import 'package:netease_music_api/src/api/bean.dart';
import 'package:netease_music_api/src/api/play/bean.dart';

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
