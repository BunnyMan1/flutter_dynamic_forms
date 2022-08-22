// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'radio_field_props.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RadioComponentProperties _$RadioComponentPropertiesFromJson(
        Map<String, dynamic> json) =>
    RadioComponentProperties(
      name: json['name'] as String,
      legend: json['legend'] as String? ?? '',
      helperText: json['helper_text'] as String? ?? '',
      alignment: $enumDecodeNullable(
              _$RadioFieldAlignmentEnumMap, json['alignment']) ??
          RadioFieldAlignment.vertical,
      labels:
          (json['labels'] as List<dynamic>).map((e) => e as String).toList(),
      labelPosition: $enumDecodeNullable(
              _$RadioFieldLabelPositionEnumMap, json['label_position']) ??
          RadioFieldLabelPosition.left,
      labelStyle: $enumDecodeNullable(
              _$RadioFieldLabelStyleEnumMap, json['label_style']) ??
          RadioFieldLabelStyle.normal,
      values: json['values'] as List<dynamic>,
      primaryColor: json['primary_color'] as String? ?? 'ffffff',
      showBorder: json['show_border'] as bool? ?? true,
      borderColor: json['border_color'] as String? ?? '000000',
      required: json['required'] as bool? ?? false,
      showError: json['show_error'] as bool? ?? true,
      customErrorText: json['custom_error_text'] as String? ?? '',
    );

Map<String, dynamic> _$RadioComponentPropertiesToJson(
        RadioComponentProperties instance) =>
    <String, dynamic>{
      'name': instance.name,
      'legend': instance.legend,
      'helper_text': instance.helperText,
      'alignment': _$RadioFieldAlignmentEnumMap[instance.alignment]!,
      'labels': instance.labels,
      'label_position':
          _$RadioFieldLabelPositionEnumMap[instance.labelPosition]!,
      'label_style': _$RadioFieldLabelStyleEnumMap[instance.labelStyle]!,
      'values': instance.values,
      'primary_color': instance.primaryColor,
      'show_border': instance.showBorder,
      'border_color': instance.borderColor,
      'required': instance.required,
      'show_error': instance.showError,
      'custom_error_text': instance.customErrorText,
    };

const _$RadioFieldAlignmentEnumMap = {
  RadioFieldAlignment.horizontal: 'horizontal',
  RadioFieldAlignment.vertical: 'vertical',
};

const _$RadioFieldLabelPositionEnumMap = {
  RadioFieldLabelPosition.left: 'left',
  RadioFieldLabelPosition.right: 'right',
};

const _$RadioFieldLabelStyleEnumMap = {
  RadioFieldLabelStyle.normal: 'normal',
  RadioFieldLabelStyle.bold: 'bold',
  RadioFieldLabelStyle.italic: 'italic',
};
