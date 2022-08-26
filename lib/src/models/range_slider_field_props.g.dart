// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'range_slider_field_props.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RangeSliderComponentProperties _$RangeSliderComponentPropertiesFromJson(
        Map<String, dynamic> json) =>
    RangeSliderComponentProperties(
      name: json['name'] as String,
      minValue: (json['min_value'] as num?)?.toDouble() ?? 0.0,
      maxValue: (json['max_value'] as num?)?.toDouble() ?? 10.0,
      divisions: json['divisions'] as int?,
      activeColor: json['active_color'] as String?,
      inActiveColor: json['inactive_color'] as String?,
      endLabel: json['end_label'] as String? ?? "",
      startLabel: json['start_label'] as String? ?? "",
      label: json['label'] as String? ?? "",
    );

Map<String, dynamic> _$RangeSliderComponentPropertiesToJson(
        RangeSliderComponentProperties instance) =>
    <String, dynamic>{
      'name': instance.name,
      'min_value': instance.minValue,
      'max_value': instance.maxValue,
      'divisions': instance.divisions,
      'active_color': instance.activeColor,
      'inactive_color': instance.inActiveColor,
      'start_label': instance.startLabel,
      'end_label': instance.endLabel,
      'label': instance.label,
    };
