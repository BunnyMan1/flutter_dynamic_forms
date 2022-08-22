// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_field_props.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TextComponentProperties _$TextComponentPropertiesFromJson(
        Map<String, dynamic> json) =>
    TextComponentProperties(
      name: json['name'] as String,
      helperText: json['helper_text'] as String? ?? "",
      label: json['label'] as String? ?? "",
      placeholder: json['placeholder'] as String? ?? "",
      textColor: json['text_color'] as String? ?? "000000",
      showBorder: json['show_border'] as bool? ?? true,
      borderColor: json['border_color'] as String? ?? "000000",
      borderWidth: (json['border_width'] as num?)?.toDouble() ?? 1.0,
      borderRadius: (json['border_radius'] as num?)?.toDouble() ?? 8.0,
      minLines: json['min_lines'] as int? ?? 1,
      maxLines: json['max_lines'] as int? ?? 1,
      readOnly: json['read_only'] as bool? ?? false,
      canCreate: json['can_create'] as bool? ?? true,
      canUpdate: json['can_update'] as bool? ?? true,
      autoFocus: json['auto_focus'] as bool? ?? false,
      onFocusLostValidate: json['on_focus_lost_validate'] as bool? ?? false,
      autoCorrect: json['auto_correct'] as bool? ?? false,
      obscureText: json['obscure_text'] as bool? ?? false,
      minLength: json['min_length'] as int?,
      maxLength: json['max_length'] as int?,
      showError: json['show_error'] as bool? ?? true,
      customErrorText: json['custom_error_text'] as String?,
      showTextCounter: json['show_text_counter'] as bool? ?? true,
      formPageNumber: json['form_page_number'] as int? ?? 1,
      isRequired: json['is_required'] as bool? ?? false,
      trimWhiteSpace: json['trim_white_space'] as bool? ?? false,
      regexMatch: json['regex_match'] as String?,
      prefixIcon: json['prefix_icon'] as int?,
      suffixIcon: json['suffix_icon'] as int?,
    );

Map<String, dynamic> _$TextComponentPropertiesToJson(
        TextComponentProperties instance) =>
    <String, dynamic>{
      'name': instance.name,
      'helper_text': instance.helperText,
      'label': instance.label,
      'placeholder': instance.placeholder,
      'text_color': instance.textColor,
      'show_border': instance.showBorder,
      'border_color': instance.borderColor,
      'border_width': instance.borderWidth,
      'border_radius': instance.borderRadius,
      'min_lines': instance.minLines,
      'max_lines': instance.maxLines,
      'read_only': instance.readOnly,
      'can_create': instance.canCreate,
      'can_update': instance.canUpdate,
      'auto_focus': instance.autoFocus,
      'on_focus_lost_validate': instance.onFocusLostValidate,
      'auto_correct': instance.autoCorrect,
      'obscure_text': instance.obscureText,
      'min_length': instance.minLength,
      'max_length': instance.maxLength,
      'show_error': instance.showError,
      'custom_error_text': instance.customErrorText,
      'show_text_counter': instance.showTextCounter,
      'form_page_number': instance.formPageNumber,
      'is_required': instance.isRequired,
      'trim_white_space': instance.trimWhiteSpace,
      'regex_match': instance.regexMatch,
      'prefix_icon': instance.prefixIcon,
      'suffix_icon': instance.suffixIcon,
    };
