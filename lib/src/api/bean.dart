import 'package:json_annotation/json_annotation.dart';
import 'package:netease_music_api/src/netease_bean.dart';

part 'bean.g.dart';

@JsonSerializable()
class ServerStatusBean {
  int code;
  String message;
  String msg;

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

@JsonSerializable()
class ServerStatusListBean extends ServerStatusBean {
  bool more;
  int count;
  int total;

  ServerStatusListBean();

  factory ServerStatusListBean.fromJson(Map<String, dynamic> json) =>
      _$ServerStatusListBeanFromJson(json);

  Map<String, dynamic> toJson() => _$ServerStatusListBeanToJson(this);
}

String dynamicToString(dynamic value) => value?.toString();
