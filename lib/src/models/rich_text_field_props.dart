import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../constants/constants.dart';
import 'base_model.dart';

part 'rich_text_field_props.g.dart';

/// RichTextComponent Properties take the different parameters to build a new rich text component properties.
@JsonSerializable()
class RichTextComponentProperties implements BaseModel {
  //!=======================================================//
  //    Json Keys of the props used by RichTextComponent
  //!=======================================================//
  static const String _rtfTypeKey = "type";
  static const String _rtfNameKey = "name";
  static const String _rtfHelperTextKey = "helper_text";
  static const String _rtfHintTextKey = "hint_text";
  static const String _rtfLabelKey = "label";
  static const String _rtfIsDarkModeKey = "is_dark_mode";
  static const String _rtfEnableSpellCheckKey = "enable_spell_check";
  static const String _rtfShouldEnsureVisibleKey = "should_ensure_visible";
  static const String _rtfIsDisabledKey = "is_disabled";
  static const String _rtfCharacterLimitKey = "character_limit";
  static const String _rtfIsRequiredKey = "is_required";
  static const String _rtfShowErrorKey = "show_error";
  static const String _rtfCustomErrorTextKey = "custom_error_text";

  /// Name of the component to be displayed
  @override
  @JsonKey(name: _rtfNameKey)
  final String name;

  /// Description about the component.
  @JsonKey(name: _rtfHelperTextKey)
  final String? helperText;

  /// Hint Text of the component. Displayed in the placeholder of the component.
  @JsonKey(name: _rtfHintTextKey)
  final String? hintText;

  /// Label for the key.
  @JsonKey(name: _rtfLabelKey)
  final String? label;

  /// Is Dark Mode for the key.
  @JsonKey(name: _rtfIsDarkModeKey)
  final bool isDarkMode;

  /// Spell Check for the key.
  @JsonKey(name: _rtfEnableSpellCheckKey)
  final bool enableSpellCheck;

  /// Should scroll to the component or not.
  @JsonKey(name: _rtfShouldEnsureVisibleKey)
  final bool shouldEnsureVisible;

  /// Determines whether the component should be disabled or not.
  @JsonKey(name: _rtfIsDisabledKey)
  final bool isDisabled;

  /// Determines whether the component should be disabled or not.
  @JsonKey(name: _rtfCharacterLimitKey)
  final int characterLimit;

  /// Determines whether this component is required to be filled or not.
  @JsonKey(name: _rtfIsRequiredKey)
  final bool isRequired;

  /// Boolean value determining whether the text field will have a border or not.
  /// Defaults to true.
  @JsonKey(name: _rtfShowErrorKey)
  final bool showError;

  /// Custom error text to be displayed in the text field.
  @JsonKey(name: _rtfCustomErrorTextKey)
  final String? customErrorText;

  // Constructor
  RichTextComponentProperties({
    required this.name,
    this.helperText,
    this.hintText,
    this.label,
    this.isDarkMode = false,
    this.enableSpellCheck = false,
    this.shouldEnsureVisible = true,
    this.isDisabled = false,
    this.characterLimit = 500,
    this.isRequired = false,
    this.showError = true,
    this.customErrorText,
  });

  @override
  String get type => richTextComponentTypeName;

  /// Factory constructor.
  /// Creates a RichTextComponentProperties object from given map.
  /// Checks the given map with `RichTextComponentProperties.textFieldPropsChecker` before creating object.
  /// Will throw error with specific message if any invalid value found for valid props.
  /// `name` is a mandatory props. Excluding it will lead to check failing.
  factory RichTextComponentProperties.fromMap(Map<String, dynamic> map) {
    var check = RichTextComponentProperties.propertiesChecker(map, isMap: true);
    if (check is String) throw check;
    return _$RichTextComponentPropertiesFromJson(map);
  }

  // Factory constructor.
  factory RichTextComponentProperties.fromJson(String json) {
    Map<String, dynamic> parsed = jsonDecode(json);
    var check = RichTextComponentProperties.propertiesChecker(parsed);
    if (check is String) throw check;
    return _$RichTextComponentPropertiesFromJson(parsed);
  }

  /// Serializer to convert Wellness Object to map.
  static Map<String, dynamic> toJson(object) {
    return _$RichTextComponentPropertiesToJson(object);
  }

  /// Properties checker for this component.
  static dynamic propertiesChecker(
    Map<String, dynamic> props, {
    bool isMap = false,
  }) {
    if (!isMap && props[_rtfTypeKey] is! String ||
        props[_rtfTypeKey] != richTextComponentTypeName) {
      return "bad value for `$_rtfTypeKey`.Expected $richTextComponentTypeName but got `${props[_rtfTypeKey]}`.";
    }
    if (props[_rtfNameKey] is! String) {
      return "bad value for `$_rtfNameKey`.Expected a String but got `${props[_rtfNameKey]}`.";
    }

    for (var key in props.keys) {
      if ((key == _rtfLabelKey ||
              key == _rtfHelperTextKey ||
              key == _rtfCustomErrorTextKey) &&
          (props[key] is! String)) {
        return "bad value for $key: `${props[key]}` expected a String.";
      }
      if ((key == _rtfIsRequiredKey ||
              key == _rtfShowErrorKey ||
              key == _rtfIsDarkModeKey ||
              key == _rtfEnableSpellCheckKey ||
              key == _rtfShouldEnsureVisibleKey ||
              key == _rtfIsDisabledKey) &&
          (props[key] is! bool)) {
        return "bad value for $key: ${props[key]} expected a Boolean.";
      }
      if ((key == _rtfCharacterLimitKey) && (props[key] is! int)) {
        return "bad value for $key: ${props[key]} expected an Integer.";
      }
    }
  }
}
