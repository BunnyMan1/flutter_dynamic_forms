import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../constants/constants.dart';
import '../utilities/helpers.dart';
import 'base_model.dart';

part 'radio_field_props.g.dart';

/// `RadioComponentProperties` is a class that holds the properties of the
/// `RadioComponent`. It implements the `BaseModel` class.
///
/// It is used to serialize or deserialize the properties of the
/// `RadioComponent`.
@JsonSerializable()
class RadioComponentProperties implements BaseModel {
  //!=======================================================//
  //    Json Keys of the props used by RadioComponent
  //!=======================================================//
  static const String _rfTypeKey = 'type';
  static const String _rfNameKey = 'name';
  static const String _rfLegendKey = 'legend';
  static const String _rfHelperTextKey = 'helper_text';
  static const String _rfAlignmentKey = 'alignment';
  static const String _rfLabelsKey = 'labels';
  static const String _rfLabelPositionKey = 'label_position';
  static const String _rfLabelStyleKey = 'label_style';
  static const String _rfValuesKey = 'values';
  static const String _rfPrimaryColorKey = 'primary_color';
  static const String _rfShowBorderKey = 'show_border';
  //TODO: Check whether border color is required or not
  static const String _rfBorderColorKey = 'border_color';
  static const String _rfRequiredKey = 'required';
  static const String _rfShowErrorKey = 'show_error';
  static const String _rfCustomErrorTextKey = 'custom_error_text';

  //!=======================================================//
  //!=======================================================//

  /// Name of the component for dev use. (Should be set to the key of the json being used to store this component's value in your DB.)
  /// Mandatory parameter, throws error if not specified.
  @override
  @JsonKey(name: _rfNameKey)
  final String name;

  /// Legend of the component. (The text that will be displayed above the component.)
  /// Defaults to null.
  @JsonKey(name: _rfLegendKey)
  final String? legend;

  /// Description of the radio field.
  /// Defaults to empty string "".
  @JsonKey(name: _rfHelperTextKey)
  final String helperText;

  /// To align vertically or horizontally.
  /// Defaults to `vertical`.
  @JsonKey(name: _rfAlignmentKey)
  final RadioFieldAlignment alignment;

  /// Different labels radio can have. (show be in order of and as many as values.)
  /// Defaults to empty list [].
  @JsonKey(name: _rfLabelsKey)
  final List<String> labels;

  /// label positioning for the radio field.
  /// Defaults to `left`.
  @JsonKey(name: _rfLabelPositionKey)
  final RadioFieldLabelPosition labelPosition;

  /// radio can have 3 label styles "normal", "bold", "italic"
  /// Defaults to `normal`.
  @JsonKey(name: _rfLabelStyleKey)
  final RadioFieldLabelStyle labelStyle;

  /// different values that radio can have, in order.
  /// Defaults to empty list [].
  @JsonKey(name: _rfValuesKey)
  final List values;

  /// Primary color for this field, overwrites color from form options.
  /// Defaults to `ffffff`.
  @JsonKey(name: _rfPrimaryColorKey)
  final String primaryColor;

  /// To show border for the radio field or not.
  /// Defaults to `true`.
  @JsonKey(name: _rfShowBorderKey)
  final bool showBorder;

  /// Border color for the radio field.
  /// Defaults to `000000`.
  @JsonKey(name: _rfBorderColorKey)
  final String borderColor;

  /// If this field is required. (validation)
  /// Defaults to `false`.
  @JsonKey(name: _rfRequiredKey)
  final bool required;

  /// To display errors. (overwrites the value from form options)
  /// Defaults to `true`.
  @JsonKey(name: _rfShowErrorKey)
  final bool showError;

  /// Custom Error text to show.
  /// Defaults to empty string "".
  @JsonKey(name: _rfCustomErrorTextKey)
  final String customErrorText;

  RadioComponentProperties({
    required this.name,
    this.legend,
    this.helperText = '',
    this.alignment = RadioFieldAlignment.vertical,
    required this.labels,
    this.labelPosition = RadioFieldLabelPosition.left,
    this.labelStyle = RadioFieldLabelStyle.normal,
    required this.values,
    this.primaryColor = 'ffffff',
    this.showBorder = true,
    this.borderColor = '000000',
    this.required = false,
    this.showError = true,
    this.customErrorText = '',
  });

  @override
  String get type => radioComponentTypeName;

  //Factory constructor.
  /// Creates a RadioComponentProperties object from given map.
  /// Checks the given map with `RadioComponentProperties.radioFieldPropertiesChecker` before creating object.
  /// Will throw error with specific message if any invalid value found for valid props.
  /// `name` is a mandatory props. Excluding it will lead to check failing.
  factory RadioComponentProperties.fromMap(Map<String, dynamic> map) {
    var check = RadioComponentProperties.radioFieldPropertiesChecker(map, isMap: true);
    if (check is String) throw check;
    return _$RadioComponentPropertiesFromJson(map);
  }

  /// Factory constructor to convert the radio properties JSON object to a map.
  factory RadioComponentProperties.fromJson(String json) {
    Map<String, dynamic> parsed = jsonDecode(json);
    var check = RadioComponentProperties.radioFieldPropertiesChecker(parsed);
    if (check is String) throw check;
    return _$RadioComponentPropertiesFromJson(parsed);
  }

  /// Serializer to convert [RadioComponentProperties] Object to map.
  static Map<String, dynamic> toJson(object) {
    return _$RadioComponentPropertiesToJson(object);
  }

  /// A method to check if the given map is a valid [RadioComponentProperties] object.
  static dynamic radioFieldPropertiesChecker(
    Map<String, dynamic> properties, {
    bool isMap = false,
  }) {
    if (!isMap && properties[_rfTypeKey] is! String ||
        properties[_rfTypeKey] != radioComponentTypeName) {
      // If the type is not a string or is not a radio component type.
      return 'bad value for "$_rfTypeKey".Expected "$radioComponentTypeName" but got "${properties[_rfTypeKey]}".';
    }
    if (properties[_rfNameKey] is! String) {
      // If the name is not a string.
      return 'bad value for "$_rfNameKey".Expected a "String" but got "${properties[_rfNameKey]}".';
    }

    // -------- CHECKS FOR REQUIRED FIELDS --------

    // Check if labels key exists or not.
    // If exists then check if it is List<String> or not
    if (!properties.keys.contains(_rfLabelsKey)) {
      // If the labels key doesn't exist.
      return '"labels" field is required';
    }

    if (properties[_rfLabelsKey] is! List<String>) {
      // If the labels is not a list.
      return 'bad value for "$_rfLabelsKey".Expected a "List" but got "$_rfLabelsKey".';
    }

    // Check if values key exists or not.
    // If exists then check if it is List or not
    if (!properties.keys.contains(_rfValuesKey)) {
      // If the values key doesn't exist.
      return '"values" field is required';
    }

    if (properties[_rfValuesKey] is! List) {
      // If the values is not a list.
      return 'bad value for "$_rfValuesKey".Expected a "List" but got "$_rfValuesKey".';
    }

    // Check for length of labels and values. They must be same.
    if (properties[_rfLabelsKey].length != properties[_rfValuesKey].length) {
      // If the labels and values are not of same length.
      return 'The length of "$_rfLabelsKey" and "$_rfValuesKey" should be same.';
    }

    // -------- CHECKS FOR OPTIONAL FIELDS --------
    for (var key in properties.keys) {
      if (key == _rfHelperTextKey) {
        if (properties[key] is! String) {
          // If the helper text is same as the key in JSON but not a string, then throw error.
          return 'bad value for "$key".Expected a String but got "${properties[key]}".';
        }
      }
      if (key == _rfAlignmentKey) {
        if (properties[key] is! String) {
          // If the alignment is not a string.
          return 'bad value for $_rfAlignmentKey: "${properties[key]}" expected a String.';
        }
        //TODO: Add a helper function to check whether it is a valid alignment type.
        mapRadioFieldAlignment(properties[key]);
      }

      if (key == _rfLabelPositionKey) {
        if ((properties[key] is! String)) {
          // If the label position is not a string.
          return 'bad value for $_rfLabelPositionKey: "${properties[key]}" expected a String.';
        }
        //TODO: Add a switch case for enums - left, right.
        mapRadioFieldLabelPosition(properties[key]);
      }

      if (key == _rfLabelStyleKey) {
        if (properties[key] is! String) {
          // If the label style is not a string.
          return 'bad value for $_rfLabelStyleKey: "${properties[key]}" expected a String.';
        }
        //TODO: Add a switch case for enums - normal, bold, italic.
        mapRadioFieldLabelStyle(properties[key]);
      }

      if (key == _rfPrimaryColorKey) {
        if (properties[key] is! String) {
          // check if colorKey is a string.
          return 'bad value for $_rfPrimaryColorKey: "${properties[key]}" expected a String of length 6.';
        }
        if (properties[key].toString().length != 6) {
          // if it IS a string, check if the length is exactly 6
          return 'bad value for $_rfPrimaryColorKey: "${properties[key]}" expected a String of length 6.';
        }
      }
      if (key == _rfShowBorderKey && (properties[key] is! bool)) {
        // If the show border is not a boolean.
        return 'bad value for $_rfShowBorderKey: "${properties[key]}" expected a bool.';
      }
    }
    return true;
  }
}

// -- ENUMS --

/// RadioFieldAlignment enum determines the alignment of the radio buttons and it's text.
/// It can be either [horizontal] or [vertical]. Default is [horizontal].
///
/// If the alignment is horizontal, then the radio buttons will be displayed in a row.
/// Else the radio buttons will be displayed in a column.
enum RadioFieldAlignment { horizontal, vertical }

/// RadioFieldLabelPosition enum determines the position of the label of the radio button.
/// It can be either [left] or [right]. Default is [left].
/// If the label position is left, then the label will be displayed to the left of the radio button.
///
/// If the label position is right, then the label will be displayed to the right of the radio button.
enum RadioFieldLabelPosition { left, right }

/// RadioFieldLabelStyle enum determines the style of the label of the radio button.
/// It can be either [normal] or [bold]. Default is [normal].
/// This will determine the font weight of the label.
enum RadioFieldLabelStyle { normal, bold, italic }
