import 'dart:convert';

import 'package:flutter_dynamic_forms/src/constants/constants.dart';
import 'package:flutter_dynamic_forms/src/models/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'multiselect_dropdown_field_props.g.dart';

@JsonSerializable()
class MultiSelectDropdownComponentProperties implements BaseModel {
  //!=======================================================//
  //    Json Keys of the props used by DropdownComponent
  //!=======================================================//
  static const String _mddfTypeKey = 'type';
  static const String _mddfNameKey = 'name';
  static const String _mddfLegendKey = 'legend';
  static const String _mddfHelperTextKey = 'helper_text';
  static const String _mddfHintTextKey = 'hint_text';
  static const String _mddfItemLabelsKey = 'item_labels';
  static const String _mddfItemValuesKey = 'item_values';
  static const String _mddfLabelColorKey = 'label_color';
  static const String _mddfDropdownColorKey = 'dropdown_color';
  static const String _mddfIsDenseKey = 'is_dense';
  static const String _mddfIsRequiredKey = 'is_required';
  static const String _mddfShowErrorKey = 'show_error';
  static const String _mddfCustomErrorTextKey = 'custom_error_text';
  static const String _mddfShowBorderKey = 'show_border';
  static const String _mddfBorderRadiusKey = 'border_radius';
  static const String _mddfBorderWidthKey = 'border_width';
  static const String _mddfBorderColorKey = 'border_color';

  //!=======================================================//
  //!=======================================================//

  /// Name of the component for dev use. (Should be set to the key of the json being used to store this component's value in your DB.)
  /// Mandatory parameter, throws error if not specified.
  @override
  @JsonKey(name: _mddfNameKey)
  final String name;

  /// Legend of the component. (The text that will be displayed above the component.)
  /// Defaults to null.
  @JsonKey(name: _mddfLegendKey)
  final String? legend;

  /// Description of the Dropdown field.
  /// Defaults to empty string "".
  @JsonKey(name: _mddfHelperTextKey)
  final String? helperText;

  /// Hint text is displayed in dropdown option when no object is selected.
  /// It acts as placeholder.
  @JsonKey(name: _mddfHintTextKey)
  final String? hintText;

  /// different values that Dropdown can have, in order.
  /// Defaults to empty list [].
  @JsonKey(name: _mddfItemLabelsKey)
  final List<String> itemLabels;

  /// different values that Dropdown can have, in order.
  /// Defaults to empty list [].
  @JsonKey(name: _mddfItemValuesKey)
  final List itemValues;

  /// Label color is applied to the text displayed in dropdown menu.
  /// Defaults to `ffffff`.
  @JsonKey(name: _mddfLabelColorKey)
  final String labelColor;

  /// Dropdown color is the background color of the dropdown menu.
  @JsonKey(name: _mddfDropdownColorKey)
  final String dropdownColor;

  /// If it is true then there will be a padding around the dropdown button
  /// Defaults to `false`.
  @JsonKey(name: _mddfIsDenseKey)
  final bool isDense;

  /// Whether this field is required or not for form submission.
  /// Defaults to `false`.
  @JsonKey(name: _mddfIsRequiredKey)
  final bool isRequired;

  /// To display errors. (overwrites the value from form options)
  /// Defaults to `true`.
  @JsonKey(name: _mddfShowErrorKey)
  final bool showError;

  /// Custom Error text to show.
  /// Defaults to empty string "".
  @JsonKey(name: _mddfCustomErrorTextKey)
  final String? customErrorText;

  /// Whether to show a border or not
  /// Default value is `true`
  @JsonKey(name: _mddfShowBorderKey)
  final bool showBorder;

  /// Border radius
  /// Default value is `8`
  @JsonKey(name: _mddfBorderRadiusKey)
  final double borderRadius;

  /// Border width
  /// Default value is `1`
  @JsonKey(name: _mddfBorderWidthKey)
  final double borderWidth;

  /// Border color
  /// Default value is `000000`
  @JsonKey(name: _mddfBorderColorKey)
  final String borderColor;

  MultiSelectDropdownComponentProperties({
    required this.name,
    this.legend,
    this.helperText,
    this.hintText,
    required this.itemLabels,
    required this.itemValues,
    this.labelColor = "000000",
    this.dropdownColor = "ffffff",
    this.isDense = false,
    this.isRequired = true,
    this.showError = true,
    this.customErrorText = '',
    this.showBorder = true,
    this.borderRadius = 8,
    this.borderWidth = 1,
    this.borderColor = "000000",
  });

  //Factory constructor.
  /// Creates a MultiSelectDropdownComponentProperties object from given map.
  /// Checks the given map with `MultiSelectDropdownComponentProperties.propertiesChecker` before creating object.
  /// Will throw error with specific message if any invalid value found for valid props.
  /// `name` is a mandatory props. Excluding it will lead to check failing.
  factory MultiSelectDropdownComponentProperties.fromMap(Map<String, dynamic> map) {
    var check = MultiSelectDropdownComponentProperties.propertiesChecker(
      map,
      isMap: true,
    );
    if (check is String) throw check;
    return _$MultiSelectDropdownComponentPropertiesFromJson(map);
  }

  /// Factory constructor to convert the Dropdown properties JSON object to a map.
  factory MultiSelectDropdownComponentProperties.fromJson(String json) {
    Map<String, dynamic> parsed = jsonDecode(json);
    var check = MultiSelectDropdownComponentProperties.propertiesChecker(parsed);
    if (check is String) throw check;
    return _$MultiSelectDropdownComponentPropertiesFromJson(parsed);
  }

  /// Serializer to convert [MultiSelectDropdownComponentProperties] Object to map.
  static Map<String, dynamic> toJson(object) {
    return _$MultiSelectDropdownComponentPropertiesToJson(object);
  }

  /// A method to check if the given map is a valid [MultiSelectDropdownComponentProperties] object.
  static dynamic propertiesChecker(
    Map<String, dynamic> props, {
    bool isMap = false,
  }) {
    if (!isMap &&
        (props[_mddfTypeKey] is! String ||
            props[_mddfTypeKey] != multiselectDropdownComponentTypeName)) {
      // If the type is not a string or is not a multi Dropdown component type.
      return 'bad value for "$_mddfTypeKey".Expected "$multiselectDropdownComponentTypeName" but got "${props[_mddfTypeKey]}".';
    }
    if (props[_mddfNameKey] is! String) {
      // If the name is not a string.
      return 'bad value for "$_mddfNameKey".Expected a "String" but got "${props[_mddfNameKey]}".';
    }

    // -------- CHECKS FOR REQUIRED FIELDS --------

    // Check if labels key exists or not.
    // If exists then check if it is List<String> or not
    if (!props.keys.contains(_mddfItemLabelsKey)) {
      // If the labels key doesn't exist.
      return '"$_mddfItemLabelsKey" field is required';
    }

    if (props[_mddfItemLabelsKey] is! List<String>) {
      // If the labels is not a list.
      return 'bad value for "$_mddfItemLabelsKey".Expected a "List" but got "$_mddfItemLabelsKey".';
    }

    // Check if values key exists or not.
    // If exists then check if it is List or not
    if (!props.keys.contains(_mddfItemValuesKey)) {
      // If the values key doesn't exist.
      return '"$_mddfItemValuesKey" field is required';
    }

    if (props[_mddfItemValuesKey] is! List) {
      // If the values is not a list.
      return 'bad value for "$_mddfItemValuesKey".Expected a "List" but got "$_mddfItemValuesKey".';
    }

    // Check for length of labels and values. They must be same.
    if (props[_mddfItemLabelsKey].length != props[_mddfItemValuesKey].length) {
      // If the labels and values are not of same length.
      return 'The length of "$_mddfItemLabelsKey" and "$_mddfItemValuesKey" should be same.';
    }

    // -------- CHECKS FOR OPTIONAL FIELDS --------
    for (var key in props.keys) {
      if (key == _mddfHelperTextKey ||
          key == _mddfHintTextKey ||
          key == _mddfCustomErrorTextKey) {
        if (props[key] is! String) {
          // If the helper text is same as the key in JSON but not a string, then throw error.
          return 'bad value for "$key".Expected a String but got "${props[key]}".';
        }
      }

      if (key == _mddfLabelColorKey ||
          key == _mddfBorderColorKey ||
          key == _mddfDropdownColorKey) {
        if (props[key] is! String) {
          // check if colorKey is a string.
          return 'bad value for $key: "${props[key]}" expected a String of length 6.';
        }
        if (props[key].toString().length != 6) {
          // if it IS a string, check if the length is exactly 6
          return 'bad value for $key: "${props[key]}" expected a String of length 6.';
        }
      }

      if ((key == _mddfBorderWidthKey || key == _mddfBorderRadiusKey) &&
          (props[key] is! double)) {
        return "bad value for $key: ${props[key]} expected a Double.";
      }
      if ((key == _mddfIsDenseKey ||
              key == _mddfIsRequiredKey ||
              key == _mddfShowBorderKey ||
              key == _mddfShowErrorKey) &&
          (props[key] is! bool)) {
        return "bad value for $key: ${props[key]} expected a Boolean.";
      }
    }

    return true;
  }

  @override
  String get type => multiselectDropdownComponentTypeName;
}
