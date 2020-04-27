// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchSongWrap _$SearchSongWrapFromJson(Map<String, dynamic> json) {
  return SearchSongWrap()
    ..songs = (json['songs'] as List)
        ?.map(
            (e) => e == null ? null : Song.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$SearchSongWrapToJson(SearchSongWrap instance) =>
    <String, dynamic>{
      'songs': instance.songs,
    };

SearchSongWrapX _$SearchSongWrapXFromJson(Map<String, dynamic> json) {
  return SearchSongWrapX()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..result = json['result'] == null
        ? null
        : SearchSongWrap.fromJson(json['result'] as Map<String, dynamic>);
}

Map<String, dynamic> _$SearchSongWrapXToJson(SearchSongWrapX instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'result': instance.result,
    };

SearchAlbumsWrap _$SearchAlbumsWrapFromJson(Map<String, dynamic> json) {
  return SearchAlbumsWrap()
    ..albums = (json['albums'] as List)
        ?.map(
            (e) => e == null ? null : Album.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$SearchAlbumsWrapToJson(SearchAlbumsWrap instance) =>
    <String, dynamic>{
      'albums': instance.albums,
    };

SearchAlbumsWrapX _$SearchAlbumsWrapXFromJson(Map<String, dynamic> json) {
  return SearchAlbumsWrapX()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..result = json['result'] == null
        ? null
        : SearchAlbumsWrap.fromJson(json['result'] as Map<String, dynamic>);
}

Map<String, dynamic> _$SearchAlbumsWrapXToJson(SearchAlbumsWrapX instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'result': instance.result,
    };

SearchArtistsWrap _$SearchArtistsWrapFromJson(Map<String, dynamic> json) {
  return SearchArtistsWrap()
    ..artists = (json['artists'] as List)
        ?.map((e) =>
            e == null ? null : Artists.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$SearchArtistsWrapToJson(SearchArtistsWrap instance) =>
    <String, dynamic>{
      'artists': instance.artists,
    };

SearchArtistsWrapX _$SearchArtistsWrapXFromJson(Map<String, dynamic> json) {
  return SearchArtistsWrapX()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..result = json['result'] == null
        ? null
        : SearchArtistsWrap.fromJson(json['result'] as Map<String, dynamic>);
}

Map<String, dynamic> _$SearchArtistsWrapXToJson(SearchArtistsWrapX instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'result': instance.result,
    };
