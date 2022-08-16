import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'form_props.g.dart';

@JsonSerializable()
class FormProps {
  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'description')
  final String description;

  FormProps({
    this.title = "",
    this.description = "",
  });

  //Factory constructor.
  factory FormProps.fromMap(Map<String, dynamic> json) {
    return _$FormPropsFromJson(json);
  }

  //Factory constructor.
  factory FormProps.fromJson(String json) {
    Map<String, dynamic> parsed = jsonDecode(json);
    return _$FormPropsFromJson(parsed);
  }

  // Serializer to convert Wellness Object to map.
  static Map<String, dynamic> toJson(object) {
    return _$FormPropsToJson(object);
  }
}
