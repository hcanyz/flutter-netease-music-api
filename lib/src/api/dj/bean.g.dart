// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DjSong _$DjSongFromJson(Map<String, dynamic> json) {
  return DjSong()
    ..id = dynamicToString(json['id'])
    ..name = json['name'] as String;
}

Map<String, dynamic> _$DjSongToJson(DjSong instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

DjProgram _$DjProgramFromJson(Map<String, dynamic> json) {
  return DjProgram()
    ..id = dynamicToString(json['id'])
    ..mainSong = json['mainSong'] == null
        ? null
        : DjSong.fromJson(json['mainSong'] as Map<String, dynamic>)
    ..dj = json['dj'] == null
        ? null
        : NeteaseAccountProfile.fromJson(json['dj'] as Map<String, dynamic>);
}

Map<String, dynamic> _$DjProgramToJson(DjProgram instance) => <String, dynamic>{
      'id': instance.id,
      'mainSong': instance.mainSong,
      'dj': instance.dj,
    };

DjListWrap _$DjListWrapFromJson(Map<String, dynamic> json) {
  return DjListWrap()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..more = json['more'] as bool
    ..count = json['count'] as int
    ..programs = (json['programs'] as List)
        ?.map((e) =>
            e == null ? null : DjProgram.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$DjListWrapToJson(DjListWrap instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'more': instance.more,
      'count': instance.count,
      'programs': instance.programs,
    };
