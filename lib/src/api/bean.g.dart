// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServerStatusBean _$ServerStatusBeanFromJson(Map<String, dynamic> json) {
  return ServerStatusBean()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String;
}

Map<String, dynamic> _$ServerStatusBeanToJson(ServerStatusBean instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
    };

ServerStatusListBean _$ServerStatusListBeanFromJson(Map<String, dynamic> json) {
  return ServerStatusListBean()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..msg = json['msg'] as String
    ..more = json['more'] as bool
    ..count = json['count'] as int;
}

Map<String, dynamic> _$ServerStatusListBeanToJson(
        ServerStatusListBean instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'msg': instance.msg,
      'more': instance.more,
      'count': instance.count,
    };
