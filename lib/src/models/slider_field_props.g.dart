// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slider_field_props.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SliderComponentProperties _$SliderComponentPropertiesFromJson(
        Map<String, dynamic> json) =>
    SliderComponentProperties(
      name: json['name'] as String,
      minValue: (json['min_value'] as num?)?.toDouble() ?? 0.0,
      maxValue: (json['max_value'] as num?)?.toDouble() ?? 10.0,
      divisions: json['divisions'] as int?,
      activeColor: json['active_color'] as String? ?? "2196F3",
      inActiveColor: json['inactive_color'] as String? ?? "808080",
      thumbColor: json['thumb_color'] as String? ?? "000000",
    );

Map<String, dynamic> _$SliderComponentPropertiesToJson(
        SliderComponentProperties instance) =>
    <String, dynamic>{
      'name': instance.name,
      'min_value': instance.minValue,
      'max_value': instance.maxValue,
      'divisions': instance.divisions,
      'active_color': instance.activeColor,
      'inactive_color': instance.inActiveColor,
      'thumb_color': instance.thumbColor,
    };
