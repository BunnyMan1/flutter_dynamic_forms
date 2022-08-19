// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_field_props.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TextComponentProps _$TextComponentPropsFromJson(Map<String, dynamic> json) =>
    TextComponentProps(
      title: json['title'] as String? ?? "",
      description: json['description'] as String? ?? "",
      label: json['label'] as String? ?? "",
      placeholder: json['placeholder'] as String? ?? "",
      color: json['color'] as String? ?? "000000",
      showBorder: json['show_border'] as bool? ?? true,
      maxLines: json['max_lines'] as int? ?? 1,
      minLines: json['min_lines'] as int? ?? 1,
      maxLength: json['max_length'] as int?,
      name: json['name'] as String,
      regexMatch: json['regex_match'] as String?,
      required: json['required'] as bool? ?? false,
      trimWhiteSpace: json['trim_white_space'] as bool? ?? false,
    );

Map<String, dynamic> _$TextComponentPropsToJson(TextComponentProps instance) =>
    <String, dynamic>{
      'name': instance.name,
      'title': instance.title,
      'description': instance.description,
      'label': instance.label,
      'placeholder': instance.placeholder,
      'color': instance.color,
      'show_border': instance.showBorder,
      'max_lines': instance.maxLines,
      'min_lines': instance.minLines,
      'max_length': instance.maxLength,
      'required': instance.required,
      'trim_white_space': instance.trimWhiteSpace,
      'regex_match': instance.regexMatch,
    };
