import 'package:json_annotation/json_annotation.dart';
import 'package:netease_music_api/src/api/bean.dart';
import 'package:netease_music_api/src/netease_bean.dart';

part 'bean.g.dart';

@JsonSerializable()
class DjSong {
  @JsonKey(fromJson: dynamicToString)
  String id;

  String name;

  DjSong();

  factory DjSong.fromJson(Map<String, dynamic> json) => _$DjSongFromJson(json);

  Map<String, dynamic> toJson() => _$DjSongToJson(this);
}

@JsonSerializable()
class DjProgram {
  @JsonKey(fromJson: dynamicToString)
  String id;

  DjSong mainSong;

  NeteaseAccountProfile dj;

  DjProgram();

  factory DjProgram.fromJson(Map<String, dynamic> json) =>
      _$DjProgramFromJson(json);

  Map<String, dynamic> toJson() => _$DjProgramToJson(this);
}

@JsonSerializable()
class DjListWrap extends ServerStatusBean {
  DjListWrap();

  List<DjProgram> programs;

  factory DjListWrap.fromJson(Map<String, dynamic> json) =>
      _$DjListWrapFromJson(json);

  Map<String, dynamic> toJson() => _$DjListWrapToJson(this);
}
