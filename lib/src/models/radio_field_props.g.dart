// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'radio_field_props.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RadioComponentProperties _$RadioComponentPropertiesFromJson(
        Map<String, dynamic> json) =>
    RadioComponentProperties(
      name: json['name'] as String,
      helperText: json['helper_text'] as String? ?? '',
      alignment: json['alignment'] as String? ?? 'vertical',
      labels: (json['labels'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      labelPosition: json['label_position'] as String? ?? 'left',
      labelStyle: json['label_style'] as String? ?? 'normal',
      values: (json['values'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
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
      'helper_text': instance.helperText,
      'alignment': instance.alignment,
      'labels': instance.labels,
      'label_position': instance.labelPosition,
      'label_style': instance.labelStyle,
      'values': instance.values,
      'primary_color': instance.primaryColor,
      'show_border': instance.showBorder,
      'border_color': instance.borderColor,
      'required': instance.required,
      'show_error': instance.showError,
      'custom_error_text': instance.customErrorText,
    };
