import 'package:json_annotation/json_annotation.dart';
import 'package:netease_music_api/src/netease_bean.dart';

part 'bean.g.dart';

@JsonSerializable()
class ServerStatusBean {
  int code;
  String message;
  String msg;

  bool more;
  int count;

  RetCode get codeEnum {
    return valueOfCode(code);
  }

  String get realMsg {
    return message ?? msg ?? '';
  }

  ServerStatusBean();

  factory ServerStatusBean.fromJson(Map<String, dynamic> json) =>
      _$ServerStatusBeanFromJson(json);

  Map<String, dynamic> toJson() => _$ServerStatusBeanToJson(this);
}

String dynamicToString(dynamic value) => value?.toString();
