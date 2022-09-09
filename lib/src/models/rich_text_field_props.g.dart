// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rich_text_field_props.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RichTextComponentProperties _$RichTextComponentPropertiesFromJson(
        Map<String, dynamic> json) =>
    RichTextComponentProperties(
      name: json['name'] as String,
      helperText: json['helper_text'] as String?,
      hintText: json['hint_text'] as String?,
      label: json['label'] as String?,
      isDarkMode: json['is_dark_mode'] as bool? ?? false,
      enableSpellCheck: json['enable_spell_check'] as bool? ?? false,
      shouldEnsureVisible: json['should_ensure_visible'] as bool? ?? true,
      isDisabled: json['is_disabled'] as bool? ?? false,
      characterLimit: json['character_limit'] as int? ?? 500,
      isRequired: json['is_required'] as bool? ?? false,
      showError: json['show_error'] as bool? ?? true,
      customErrorText: json['custom_error_text'] as String?,
    );

Map<String, dynamic> _$RichTextComponentPropertiesToJson(
        RichTextComponentProperties instance) =>
    <String, dynamic>{
      'name': instance.name,
      'helper_text': instance.helperText,
      'hint_text': instance.hintText,
      'label': instance.label,
      'is_dark_mode': instance.isDarkMode,
      'enable_spell_check': instance.enableSpellCheck,
      'should_ensure_visible': instance.shouldEnsureVisible,
      'is_disabled': instance.isDisabled,
      'character_limit': instance.characterLimit,
      'is_required': instance.isRequired,
      'show_error': instance.showError,
      'custom_error_text': instance.customErrorText,
    };
