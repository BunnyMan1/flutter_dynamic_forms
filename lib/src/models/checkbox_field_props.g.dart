// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkbox_field_props.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckBoxComponentProperties _$CheckBoxComponentPropertiesFromJson(
        Map<String, dynamic> json) =>
    CheckBoxComponentProperties(
      name: json['name'] as String,
      legend: json['legend'] as String?,
      helperText: json['helper_text'] as String? ?? '',
      alignment: $enumDecodeNullable(
              _$CheckBoxFieldAlignmentEnumMap, json['alignment']) ??
          CheckBoxFieldAlignment.vertical,
      labels:
          (json['labels'] as List<dynamic>).map((e) => e as String).toList(),
      labelPosition: $enumDecodeNullable(
              _$CheckBoxFieldLabelPositionEnumMap, json['label_position']) ??
          CheckBoxFieldLabelPosition.left,
      labelStyle: $enumDecodeNullable(
              _$CheckBoxFieldLabelStyleEnumMap, json['label_style']) ??
          CheckBoxFieldLabelStyle.normal,
      values: json['values'] as List<dynamic>,
      primaryColor: json['primary_color'] as String? ?? 'ffffff',
      showBorder: json['show_border'] as bool? ?? true,
      borderColor: json['border_color'] as String? ?? '000000',
      required: json['required'] as bool? ?? false,
      showError: json['show_error'] as bool? ?? true,
      customErrorText: json['custom_error_text'] as String? ?? '',
    );

Map<String, dynamic> _$CheckBoxComponentPropertiesToJson(
        CheckBoxComponentProperties instance) =>
    <String, dynamic>{
      'name': instance.name,
      'legend': instance.legend,
      'helper_text': instance.helperText,
      'alignment': _$CheckBoxFieldAlignmentEnumMap[instance.alignment]!,
      'labels': instance.labels,
      'label_position':
          _$CheckBoxFieldLabelPositionEnumMap[instance.labelPosition]!,
      'label_style': _$CheckBoxFieldLabelStyleEnumMap[instance.labelStyle]!,
      'values': instance.values,
      'primary_color': instance.primaryColor,
      'show_border': instance.showBorder,
      'border_color': instance.borderColor,
      'required': instance.required,
      'show_error': instance.showError,
      'custom_error_text': instance.customErrorText,
    };

const _$CheckBoxFieldAlignmentEnumMap = {
  CheckBoxFieldAlignment.horizontal: 'horizontal',
  CheckBoxFieldAlignment.vertical: 'vertical',
};

const _$CheckBoxFieldLabelPositionEnumMap = {
  CheckBoxFieldLabelPosition.left: 'left',
  CheckBoxFieldLabelPosition.right: 'right',
};

const _$CheckBoxFieldLabelStyleEnumMap = {
  CheckBoxFieldLabelStyle.normal: 'normal',
  CheckBoxFieldLabelStyle.bold: 'bold',
  CheckBoxFieldLabelStyle.italic: 'italic',
};
