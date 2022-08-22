import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../constants/constants.dart';
import 'base_model.dart';

part 'checkbox_props.g.dart';

/// `CheckBoxComponentProperties` is a class that holds the properties of the
/// `CheckBoxComponent`. It implements the `BaseModel` class.
///
/// It is used to serialize or deserialize the properties of the
/// `CheckBoxComponent`.
@JsonSerializable()
class CheckBoxComponentProperties implements BaseModel {
  //!=======================================================//
  //    Json Keys of the props used by checkBoxComponent
  //!=======================================================//
  static const String _cbfTypeKey = 'type';
  static const String _cbfNameKey = 'name';
  static const String _cbfLegendKey = 'legend';
  static const String _cbfHelperTextKey = 'helper_text';
  static const String _cbfAlignmentKey = 'alignment';
  static const String _cbfLabelsKey = 'labels';
  static const String _cbfLabelPositionKey = 'label_position';
  static const String _cbfLabelStyleKey = 'label_style';
  static const String _cbfValuesKey = 'values';
  static const String _cbfPrimaryColorKey = 'primary_color';
  static const String _cbfShowBorderKey = 'show_border';
  //TODO: Check whether border color is required or not
  static const String _cbfBorderColorKey = 'border_color';
  static const String _cbfRequiredKey = 'required';
  static const String _cbfShowErrorKey = 'show_error';
  static const String _cbfCustomErrorTextKey = 'custom_error_text';

  //!=======================================================//
  //!=======================================================//

  /// Name of the component for dev use. (Should be set to the key of the json being used to store this component's value in your DB.)
  /// Mandatory parameter, throws error if not specified.
  @override
  @JsonKey(name: _cbfNameKey)
  final String name;

  /// Legend of the component. (The text that will be displayed above the component.)
  /// Default value is null.
  @JsonKey(name: _cbfLegendKey)
  final String? legend;

  /// Description of the checkBox field.
  /// Defaults to empty string "".
  @JsonKey(name: _cbfHelperTextKey)
  final String helperText;

  /// To align vertically or horizontally.
  /// Defaults to `vertical`.
  @JsonKey(name: _cbfAlignmentKey)
  final CheckBoxFieldAlignment alignment;

  /// Different labels checkBox can have. (show be in order of and as many as values.)
  /// Defaults to empty list [].
  @JsonKey(name: _cbfLabelsKey)
  final List<String> labels;

  /// label positioning for the checkBox field.
  /// Defaults to `left`.
  @JsonKey(name: _cbfLabelPositionKey)
  final CheckBoxFieldLabelPosition labelPosition;

  /// checkBox can have 3 label styles "normal", "bold", "italic"
  /// Defaults to `normal`.
  @JsonKey(name: _cbfLabelStyleKey)
  final CheckBoxFieldLabelStyle labelStyle;

  /// different values that checkBox can have, in order.
  /// Defaults to empty list [].
  @JsonKey(name: _cbfValuesKey)
  final List values;

  /// Primary color for this field, overwrites color from form options.
  /// Defaults to `ffffff`.
  @JsonKey(name: _cbfPrimaryColorKey)
  final String primaryColor;

  /// To show border for the checkBox field or not.
  /// Defaults to `true`.
  @JsonKey(name: _cbfShowBorderKey)
  final bool showBorder;

  /// Border color for the checkBox field.
  /// Defaults to `000000`.
  @JsonKey(name: _cbfBorderColorKey)
  final String borderColor;

  /// If this field is required. (validation)
  /// Defaults to `false`.
  @JsonKey(name: _cbfRequiredKey)
  final bool required;

  /// To display errors. (overwrites the value from form options)
  /// Defaults to `true`.
  @JsonKey(name: _cbfShowErrorKey)
  final bool showError;

  /// Custom Error text to show.
  /// Defaults to empty string "".
  @JsonKey(name: _cbfCustomErrorTextKey)
  final String customErrorText;

  CheckBoxComponentProperties({
    required this.name,
    this.legend,
    this.helperText = '',
    this.alignment = CheckBoxFieldAlignment.vertical,
    required this.labels,
    this.labelPosition = CheckBoxFieldLabelPosition.left,
    this.labelStyle = CheckBoxFieldLabelStyle.normal,
    required this.values,
    this.primaryColor = 'ffffff',
    this.showBorder = true,
    this.borderColor = '000000',
    this.required = false,
    this.showError = true,
    this.customErrorText = '',
  });

  @override
  String get type => checkBoxComponentName;

  //Factory constructor.
  /// Creates a CheckBoxComponentProperties object from given map.
  /// Checks the given map with `CheckBoxComponentProperties.checkBoxFieldPropertiesChecker` before creating object.
  /// Will throw error with specific message if any invalid value found for valid props.
  /// `name` is a mandatory props. Excluding it will lead to check failing.
  factory CheckBoxComponentProperties.fromMap(Map<String, dynamic> map) {
    var check = CheckBoxComponentProperties.checkBoxFieldPropertiesChecker(map,
        isMap: true);
    if (check is String) throw check;
    return _$CheckBoxComponentPropertiesFromJson(map);
  }

  /// Factory constructor to convert the checkBox properties JSON object to a map.
  factory CheckBoxComponentProperties.fromJson(String json) {
    Map<String, dynamic> parsed = jsonDecode(json);
    var check =
        CheckBoxComponentProperties.checkBoxFieldPropertiesChecker(parsed);
    if (check is String) throw check;
    return _$CheckBoxComponentPropertiesFromJson(parsed);
  }

  /// Serializer to convert [CheckBoxComponentProperties] Object to map.
  static Map<String, dynamic> toJson(object) {
    return _$CheckBoxComponentPropertiesToJson(object);
  }

  /// A method to check if the given map is a valid [CheckBoxComponentProperties] object.
  static dynamic checkBoxFieldPropertiesChecker(
    Map<String, dynamic> properties, {
    bool isMap = false,
  }) {
    if (!isMap && properties[_cbfTypeKey] is! String ||
        properties[_cbfTypeKey] != checkBoxComponentName) {
      // If the type is not a string or is not a checkBox component type.
      return 'bad value for "$_cbfTypeKey".Expected "$checkBoxComponentName" but got "${properties[_cbfTypeKey]}".';
    }
    if (properties[_cbfNameKey] is! String) {
      // If the name is not a string.
      return 'bad value for "$_cbfNameKey".Expected a "String" but got "${properties[_cbfNameKey]}".';
    }

    // -------- CHECKS FOR REQUIRED FIELDS --------

    // Check if labels key exists or not.
    // If exists then check if it is List<String> or not
    if (!properties.keys.contains(_cbfLabelsKey)) {
      // If the labels key doesn't exist.
      return '"labels" field is required';
    }

    if (properties[_cbfLabelsKey] is! List<String>) {
      // If the labels is not a list.
      return 'bad value for "$_cbfLabelsKey".Expected a "List" but got "$_cbfLabelsKey".';
    }

    // Check if values key exists or not.
    // If exists then check if it is List or not
    if (!properties.keys.contains(_cbfValuesKey)) {
      // If the values key doesn't exist.
      return '"values" field is required';
    }

    if (properties[_cbfValuesKey] is! List) {
      // If the values is not a list.
      return 'bad value for "$_cbfValuesKey".Expected a "List" but got "$_cbfValuesKey".';
    }

    // Check for length of labels and values. They must be same.
    if (properties[_cbfLabelsKey].length != properties[_cbfValuesKey].length) {
      // If the labels and values are not of same length.
      return 'The length of "$_cbfLabelsKey" and "$_cbfValuesKey" should be same.';
    }

    // -------- CHECKS FOR OPTIONAL FIELDS --------
    for (var key in properties.keys) {
      if (key == _cbfHelperTextKey) {
        if (properties[key] is! String) {
          // If the helper text is same as the key in JSON but not a string, then throw error.
          return 'bad value for "$key".Expected a String but got "${properties[key]}".';
        }
      }
      if (key == _cbfAlignmentKey) {
        if (properties[key] is! String) {
          // If the alignment is not a string.
          return 'bad value for $_cbfAlignmentKey: "${properties[key]}" expected a String.';
        }
        //TODO: Add a helper function to check whether it is a valid alignment type.
      }

      if (key == _cbfLabelPositionKey) {
        if ((properties[key] is! String)) {
          // If the label position is not a string.
          return 'bad value for $_cbfLabelPositionKey: "${properties[key]}" expected a String.';
        }
        //TODO: Add a switch case for enums - left, right.
      }

      if (key == _cbfLabelStyleKey) {
        if (properties[key] is! String) {
          // If the label style is not a string.
          return 'bad value for $_cbfLabelStyleKey: "${properties[key]}" expected a String.';
        }
        //TODO: Add a switch case for enums - normal, bold, italic.
      }

      if (key == _cbfPrimaryColorKey) {
        if (properties[key] is! String) {
          // check if colorKey is a string.
          return 'bad value for $_cbfPrimaryColorKey: "${properties[key]}" expected a String of length 6.';
        }
        if (properties[key].toString().length != 6) {
          // if it IS a string, check if the length is exactly 6
          return 'bad value for $_cbfPrimaryColorKey: "${properties[key]}" expected a String of length 6.';
        }
      }
      if (key == _cbfShowBorderKey && (properties[key] is! bool)) {
        // If the show border is not a boolean.
        return 'bad value for $_cbfShowBorderKey: "${properties[key]}" expected a bool.';
      }
    }
    return true;
  }
}

// CheckBoxFieldAlignment enum determines the alignment of the checkBox buttons and it's text.
/// It can be either [horizontal] or [vertical]. Default is [horizontal].
///
/// If the alignment is horizontal, then the checkBox buttons will be displayed in a row.
/// Else the checkBox buttons will be displayed in a column.
enum CheckBoxFieldAlignment { horizontal, vertical }

/// checkBoxFieldLabelPosition enum determines the position of the label of the checkBox button.
/// It can be either [left] or [right]. Default is [left].
/// If the label position is left, then the label will be displayed to the left of the checkBox button.
///
/// If the label position is right, then the label will be displayed to the right of the checkBox button.
enum CheckBoxFieldLabelPosition { left, right }

/// checkBoxFieldLabelStyle enum determines the style of the label of the checkBox button.
/// It can be either [normal] or [bold]. Default is [normal].
/// This will determine the font weight of the label.
enum CheckBoxFieldLabelStyle { normal, bold, italic }
