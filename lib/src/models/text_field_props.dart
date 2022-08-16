import 'dart:convert';

import 'package:flutter_dynamic_forms/src/models/base_component.dart';
import 'package:json_annotation/json_annotation.dart';
part 'text_field_props.g.dart';

@JsonSerializable()
class TextComponentProps implements BaseComponent {
  //!=======================================================//
  //    Json Keys of the props used by TextFieldComponent
  //!=======================================================//
  static const String _tfTypeKey = "type";
  static const String _tfNameKey = "name";
  static const String _tfTitleKey = "title";
  static const String _tfDescriptionKey = "description";
  static const String _tfLabelKey = "label";
  static const String _tfPlaceholderKey = "placeholder";
  static const String _tfColorKey = "color";
  static const String _tfShowBorderKey = "show_border";
  static const String _tfMaxLinesKey = "max_lines";
  static const String _tfMinLinesKey = "min_lines";
  //!=======================================================//
  //!=======================================================//

  /// Title of the component. (To be displayed in UI)
  /// defaults to ""
  @JsonKey(name: _tfTitleKey)
  final String title;

  /// Description of the component (To be displayed in UI)
  /// defaults to ""
  @JsonKey(name: _tfDescriptionKey)
  final String description;

  /// Label for the text field. (To be displayed in UI as a floating text field label)
  /// defaults to ""
  @JsonKey(name: _tfLabelKey)
  final String label;

  /// Placeholder for the text field (To be displayed in UI as a placeholder or hint)
  /// defaults to ""
  @JsonKey(name: _tfPlaceholderKey)
  final String placeholder;

  /// Primaty color for the text field. (Should be a 6 character hex string without preceeding `#`)
  /// defaults to Black (000000)
  @JsonKey(name: _tfColorKey)
  final String color;

  /// Boolean value determining whether the text field will have a border or not.
  /// Defaults to true.
  @JsonKey(name: _tfShowBorderKey)
  final bool showBorder;

  /// Maximum number of lines allowed in textfield. (Should always be greater than min_lines if specified.)
  /// Defaults to 1.
  @JsonKey(name: _tfMaxLinesKey)
  final int maxLines;

  /// Minimum number of lines allowed in textfield. (Should always be less than max_lines if specified.)
  /// Defaults to 1.
  @JsonKey(name: _tfMinLinesKey)
  final int minLines;

  /// Name of the component for dev use. (Should be set to the key of the json being used to store this component's value in your DB.)
  /// Mandatory parameter, throws error if not specified.
  @override
  @JsonKey(name: _tfNameKey)
  final String name;

  TextComponentProps({
    this.title = "",
    this.description = "",
    this.label = "",
    this.placeholder = "",
    this.color = "000000",
    this.showBorder = true,
    this.maxLines = 1,
    this.minLines = 1,
    required this.name,
  });

  //Factory constructor.
  /// Creates a TextComponentProps object from given map.
  /// Checks the given map with `TextComponentProps.textFieldPropsChecker` before creating object.
  /// Will throw error with specific message if any invalid value found for valid props.
  /// `type` and `name` are mandatory props. Excluding these will lead to check failing.
  factory TextComponentProps.fromMap(Map<String, dynamic> map) {
    var check = TextComponentProps.textFieldPropsChecker(map);
    if (check is String) throw check;
    return _$TextComponentPropsFromJson(map);
  }

  //Factory constructor.
  factory TextComponentProps.fromJson(String json) {
    Map<String, dynamic> parsed = jsonDecode(json);
    var check = TextComponentProps.textFieldPropsChecker(parsed);
    if (check is String) throw check;
    return _$TextComponentPropsFromJson(parsed);
  }

  // Serializer to convert Wellness Object to map.
  static Map<String, dynamic> toJson(object) {
    return _$TextComponentPropsToJson(object);
  }

  static dynamic textFieldPropsChecker(Map<String, dynamic> props) {
    // print(" json to check : $json");
    if (props[_tfTypeKey] is! String || props[_tfTypeKey] != "text") {
      return "bad value for `$_tfTypeKey`.Expected 'text' but got `${props[_tfTypeKey]}`.";
    }
    if (props[_tfNameKey] is! String) {
      return "bad value for `$_tfNameKey`.Expected a String but got `${props[_tfNameKey]}`.";
    }
    for (var key in props.keys) {
      if (key == _tfTypeKey && (props[key] is! String)) {
        return "bad value for $_tfTypeKey: `${props[key]}` expected a String.";
      }
      if (key == _tfNameKey && (props[key] is! String)) {
        return "bad value for $_tfNameKey: `${props[key]}` expected a String.";
      }
      if (key == _tfTitleKey && (props[key] is! String)) {
        return "bad value for $_tfTitleKey: `${props[key]}` expected a String.";
      }
      if (key == _tfDescriptionKey && (props[key] is! String)) {
        return "bad value for $_tfDescriptionKey: `${props[key]}` expected a String.";
      }
      if (key == _tfLabelKey && (props[key] is! String)) {
        return "bad value for $_tfLabelKey: `${props[key]}` expected a String.";
      }
      if (key == _tfPlaceholderKey && (props[key] is! String)) {
        return "bad value for $_tfPlaceholderKey: `${props[key]}` expected a String.";
      }
      if (key == _tfColorKey) {
        // check if colorKey is a string.
        if (props[key] is! String) {
          return "bad value for $_tfColorKey: `${props[key]}` expected a String of length 6.";
        }
        // if it IS a string, check if the length is exactly 6
        if (props[key].toString().length != 6) {
          return "bad value for $_tfColorKey: `${props[key]}` expected a String of length 6.";
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
  String get type => "text";
}
