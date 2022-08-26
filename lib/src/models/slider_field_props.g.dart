// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slider_field_props.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SliderComponentProperties _$SliderComponentPropertiesFromJson(
        Map<String, dynamic> json) =>
    SliderComponentProperties(
      name: json['name'] as String,
      helperText: json['helper_text'] as String?,
      label: json['label'] as String? ?? "",
      minValue: (json['min_value'] as num?)?.toDouble() ?? 0.0,
      maxValue: (json['max_value'] as num?)?.toDouble() ?? 10.0,
      divisions: json['divisions'] as int?,
      activeColor: json['active_color'] as String?,
      inActiveColor: json['inactive_color'] as String?,
      thumbColor: json['thumb_color'] as String?,
    );

Map<String, dynamic> _$SliderComponentPropertiesToJson(
        SliderComponentProperties instance) =>
    <String, dynamic>{
      'name': instance.name,
      'helper_text': instance.helperText,
      'label': instance.label,
      'min_value': instance.minValue,
      'max_value': instance.maxValue,
      'divisions': instance.divisions,
      'active_color': instance.activeColor,
      'inactive_color': instance.inActiveColor,
      'thumb_color': instance.thumbColor,
    };
