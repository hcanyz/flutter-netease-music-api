import 'package:json_annotation/json_annotation.dart';

part 'bean.g.dart';

@JsonSerializable()
class ServerStatusBean {
  int code;

  ServerStatusBean();

  factory ServerStatusBean.fromJson(Map<String, dynamic> json) =>
      _$ServerStatusBeanFromJson(json);

  Map<String, dynamic> toJson() => _$ServerStatusBeanToJson(this);
}

String dynamicToString(dynamic value) => value?.toString();
