import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../constants/constants.dart';
import 'base_model.dart';

part 'text_field_props.g.dart';

@JsonSerializable()
class TextComponentProperties implements BaseModel {
  //!=======================================================//
  //    Json Keys of the props used by TextFieldComponent
  //!=======================================================//
  static const String _tfTypeKey = "type";
  // static const String _tfTitleKey = "title";
  // static const String _tfDescriptionKey = "description";
  static const String _tfNameKey = "name";
  static const String _tfHelperTextKey = "helper_text";
  static const String _tfLabelKey = "label";
  static const String _tfPlaceholderKey = "placeholder";
  static const String _tfTextColorKey = "text_color";
  static const String _tfShowBorderKey = "show_border";
  static const String _tfBorderColorKey = "border_color";
  static const String _tfBorderWidthKey = "border_width";
  static const String _tfBorderRadiusKey = "border_radius";
  static const String _tfMinLinesKey = "min_lines";
  static const String _tfMaxLinesKey = "max_lines";
  static const String _tfRequiredKey = "is_required";
  static const String _tfReadOnlyKey = "read_only";
  static const String _tfCanCreateKey = "can_create";
  static const String _tfCanUpdateKey = "can_update";
  static const String _tfAutoFocusKey = "auto_focus";
  static const String _tfOnFocusLostValidateKey = "on_focus_lost_validate";
  static const String _tfAutoCorrectKey = "auto_correct";
  static const String _tfObscureTextKey = "obscure_text";
  static const String _tfTrimWhiteSpaceKey = "trim_white_space";
  static const String _tfMinLengthKey = "min_length";
  static const String _tfMaxLengthKey = "max_length";
  static const String _tfShowErrorKey = "show_error";
  static const String _tfCustomErrorTextKey = "custom_error_text";
  static const String _tfShowTextCounterKey = "show_text_counter";
  static const String _tfFormPageNumberKey = "form_page_number";
  static const String _tfRegexMatchKey = "regex_match";
  static const String _tfPrefixIconKey = "prefix_icon";
  static const String _tfSuffixIconKey = "suffix_icon";

  //!=======================================================//
  //!=======================================================//

  /// Title of the component. (To be displayed in UI)
  /// defaults to ""
  // @JsonKey(name: _tfTitleKey)
  // final String title;

  /// Description of the component (To be displayed in UI)
  /// defaults to ""
  // @JsonKey(name: _tfDescriptionKey)
  // final String description;

  /// Name of the component for dev use. (Should be set to the key of the json being used to store this component's value in your DB.)
  /// Mandatory parameter, throws error if not specified.
  @override
  @JsonKey(name: _tfNameKey)
  final String name;

  /// Helper text to be displayed below the component.
  /// defaults to ""
  @JsonKey(name: _tfHelperTextKey)
  final String helperText;

  /// Label for the text field. (To be displayed in UI as a floating text field label)
  /// defaults to ""
  @JsonKey(name: _tfLabelKey)
  final String label;

  /// Placeholder of the component (To be displayed in UI)
  /// defaults to ""
  @JsonKey(name: _tfPlaceholderKey)
  final String placeholder;

  /// Color of the text in the text field.
  /// defaults to "000000"
  @JsonKey(name: _tfTextColorKey)
  final String textColor;

  /// Boolean value determining whether the text field will have a border or not.
  /// Defaults to true.
  @JsonKey(name: _tfShowBorderKey)
  final bool showBorder;

  /// Color of the border of the text field.
  /// defaults to "000000"
  @JsonKey(name: _tfBorderColorKey)
  final String borderColor;

  /// Width of the border of the text field.
  /// defaults to 1.0
  @JsonKey(name: _tfBorderWidthKey)
  final double borderWidth;

  /// Radius of the border of the text field.
  /// defaults to 1.0
  @JsonKey(name: _tfBorderRadiusKey)
  final double borderRadius;

  /// Minimum number of lines allowed in textfield. (Should always be less than max_lines if specified.)
  /// Defaults to 1.
  @JsonKey(name: _tfMinLinesKey)
  final int minLines;

  /// Maximum number of lines allowed in textfield. (Should always be greater than min_lines if specified.)
  /// Defaults to 1.
  @JsonKey(name: _tfMaxLinesKey)
  final int maxLines;

  /// Boolean value determining whether the text field is read only or not.
  /// Defaults to false.
  @JsonKey(name: _tfReadOnlyKey)
  final bool readOnly;

  /// Boolean value determining whether the text field can be created or not.
  /// Defaults to true.
  @JsonKey(name: _tfCanCreateKey)
  final bool canCreate;

  /// Boolean value determining whether the text field can be updated or not.
  /// Defaults to true.
  @JsonKey(name: _tfCanUpdateKey)
  final bool canUpdate;

  /// Boolean value determining whether the text field will be focused on when the form is loaded or not.
  /// Defaults to false.
  @JsonKey(name: _tfAutoFocusKey)
  final bool autoFocus;

  /// Boolean value determining whether the text field will be validated on focus lost or not.
  /// Defaults to false.
  @JsonKey(name: _tfOnFocusLostValidateKey)
  final bool onFocusLostValidate;

  /// Boolean value determining whether the text field will have auto correction or not.
  /// Defaults to false.
  @JsonKey(name: _tfAutoCorrectKey)
  final bool autoCorrect;

  /// Boolean value determining whether the text field will have obscured text or not.
  /// Defaults to false.
  @JsonKey(name: _tfObscureTextKey)
  final bool obscureText;

  /// Max Length of for the text field. (If specified, the length will be enforced.)
  /// Defaults to null (no min length set).
  @JsonKey(name: _tfMinLengthKey)
  final int? minLength;

  /// Max Length of for the text field. (If specified, the length will be enforced.)
  /// Defaults to null (no max length set).
  @JsonKey(name: _tfMaxLengthKey)
  final int? maxLength;

  /// Boolean value determining whether the text field will have a border or not.
  /// Defaults to true.
  @JsonKey(name: _tfShowErrorKey)
  final bool showError;

  /// Custom error text to be displayed in the text field.
  /// Defaults to ""
  @JsonKey(name: _tfCustomErrorTextKey)
  final String customErrorText;

  /// Boolean value determining whether the text field will have a border or not.
  /// Defaults to true.
  @JsonKey(name: _tfShowTextCounterKey)
  final bool showTextCounter;

  /// Page number of the form in which the text field is present.
  /// Defaults to 1.
  @JsonKey(name: _tfFormPageNumberKey)
  final int formPageNumber;

  // Validation props.

  //TODO: use this prop.
  @JsonKey(name: _tfRequiredKey)
  final bool isRequired;

  //TODO: use this prop.
  @JsonKey(name: _tfTrimWhiteSpaceKey)
  final bool trimWhiteSpace;

  //TODO: use this prop.
  @JsonKey(name: _tfRegexMatchKey)
  final String? regexMatch;

  //TODO: use this prop.
  @JsonKey(name: _tfPrefixIconKey)
  final String? prefixIcon;

  //TODO: use this prop.
  @JsonKey(name: _tfSuffixIconKey)
  final String? suffixIcon;

  TextComponentProperties({
    // this.title = "",
    // this.description = "",
    required this.name,
    this.helperText = "",
    this.label = "",
    this.placeholder = "",
    this.textColor = "000000",
    this.showBorder = true,
    this.borderColor = "000000",
    this.borderWidth = 1.0,
    this.borderRadius = 1.0,
    this.minLines = 1,
    this.maxLines = 1,
    this.readOnly = false,
    this.canCreate = true,
    this.canUpdate = true,
    this.autoFocus = false,
    this.onFocusLostValidate = false,
    this.autoCorrect = false,
    this.obscureText = false,
    this.minLength,
    this.maxLength,
    this.showError = true,
    this.customErrorText = "",
    this.showTextCounter = true,
    this.formPageNumber = 1,
    this.isRequired = false,
    this.trimWhiteSpace = false,
    this.regexMatch,
    this.prefixIcon,
    this.suffixIcon,
  });

  //Factory constructor.
  /// Creates a TextComponentProps object from given map.
  /// Checks the given map with `TextComponentProps.textFieldPropsChecker` before creating object.
  /// Will throw error with specific message if any invalid value found for valid props.
  /// `name` is a mandatory props. Excluding it will lead to check failing.
  factory TextComponentProperties.fromMap(Map<String, dynamic> map) {
    var check = TextComponentProperties.textFieldPropsChecker(map, isMap: true);
    if (check is String) throw check;
    return _$TextComponentPropertiesFromJson(map);
  }

  //Factory constructor.
  factory TextComponentProperties.fromJson(String json) {
    Map<String, dynamic> parsed = jsonDecode(json);
    var check = TextComponentProperties.textFieldPropsChecker(parsed);
    if (check is String) throw check;
    return _$TextComponentPropertiesFromJson(parsed);
  }

  // Serializer to convert Wellness Object to map.
  static Map<String, dynamic> toJson(object) {
    return _$TextComponentPropertiesToJson(object);
  }

  static dynamic textFieldPropsChecker(Map<String, dynamic> props, {bool isMap = false}) {
    // print(" json to check : $json");
    if (!isMap && props[_tfTypeKey] is! String || props[_tfTypeKey] != textComponentName) {
      return "bad value for `$_tfTypeKey`.Expected $textComponentName but got `${props[_tfTypeKey]}`.";
    }
    if (props[_tfNameKey] is! String) {
      return "bad value for `$_tfNameKey`.Expected a String but got `${props[_tfNameKey]}`.";
    }
    for (var key in props.keys) {
      // if (key == _tfTypeKey && (props[key] is! String)) {
      //   return "bad value for $_tfTypeKey: `${props[key]}` expected a String.";
      // }
      // if (key == _tfNameKey && (props[key] is! String)) {
      //   return "bad value for $_tfNameKey: `${props[key]}` expected a String.";
      // }
      // if (key == _tfTitleKey && (props[key] is! String)) {
      //   return "bad value for $_tfTitleKey: `${props[key]}` expected a String.";
      // }
      // if (key == _tfDescriptionKey && (props[key] is! String)) {
      //   return "bad value for $_tfDescriptionKey: `${props[key]}` expected a String.";
      // }
      if (key == _tfLabelKey && (props[key] is! String)) {
        return "bad value for $_tfLabelKey: `${props[key]}` expected a String.";
      }
      if (key == _tfPlaceholderKey && (props[key] is! String)) {
        return "bad value for $_tfPlaceholderKey: `${props[key]}` expected a String.";
      }
      if (key == _tfTextColorKey) {
        // check if colorKey is a string.
        if (props[key] is! String) {
          return "bad value for $_tfTextColorKey: `${props[key]}` expected a String of length 6.";
        }
        // if it IS a string, check if the length is exactly 6
        if (props[key].toString().length != 6) {
          return "bad value for $_tfTextColorKey: `${props[key]}` expected a String of length 6.";
        }
      }
      if (key == _tfShowBorderKey && (props[key] is! bool)) {
        return "bad value for $_tfShowBorderKey: `${props[key]}` expected a Boolean.";
      }
      if (key == _tfMaxLinesKey) {
        if (props[key] is! int) {
          return "bad value for $_tfMaxLinesKey: `${props[key]}` expected an Integer >= 1.";
        }
        if (props[key] as int < 1) {
          return "bad value for $_tfMaxLinesKey: `${props[key]}` expected an Integer >= 1.";
        }
      }
      if (key == _tfMinLinesKey) {
        if (props[key] is! int) {
          return "bad value for $_tfMinLinesKey: `${props[key]}` expected an Integer >= 1.";
        }
        if (props[key] as int < 1) {
          return "bad value for $_tfMinLinesKey: `${props[key]}` expected an Integer >= 1.";
        }
        if (props.containsKey(_tfMaxLinesKey) &&
            (props[_tfMaxLinesKey] as int) < (props[_tfMinLinesKey])) {
          return "bad value for $_tfMinLinesKey: `${props[key]}`. $_tfMaxLinesKey should be greater than $_tfMinLinesKey";
        }
      }
    }

    return true;
  }

  /// Type parameter for the dynamic component for internal use.
  /// This should be explicitly mentioned in the json if `TextComponentProps.fromJson` is to be used.
  @override
  String get type => textComponentName;
}
