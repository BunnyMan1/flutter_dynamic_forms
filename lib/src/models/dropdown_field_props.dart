import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../constants/constants.dart';
import 'base_model.dart';

part 'dropdown_field_props.g.dart';

/// `DropdownComponentProperties` is a class that holds the properties of the
/// `DropdownComponent`. It implements the `BaseModel` class.
///
/// It is used to serialize or deserialize the properties of the
/// `DropdownComponent`.
@JsonSerializable()
class DropdownComponentProperties implements BaseModel {
  //!=======================================================//
  //    Json Keys of the props used by DropdownComponent
  //!=======================================================//
  static const String _ddfTypeKey = 'type';
  static const String _ddfNameKey = 'name';
  static const String _ddfLegendKey = 'legend';
  static const String _ddfHelperTextKey = 'helper_text';
  static const String _ddfHintTextKey = 'hint_text';
  static const String _ddfItemsAlignmentKey = 'items_alignment';
  static const String _ddfItemLabelsKey = 'item_labels';
  static const String _ddfItemValuesKey = 'item_values';
  static const String _ddfLabelColorKey = 'label_color';
  static const String _ddfDropdownColorKey = 'dropdown_color';
  static const String _ddfElevationKey = 'elevation';
  static const String _ddfIsDenseKey = 'is_dense';
  static const String _ddfIsExpandedKey = 'is_expanded';
  static const String _ddfMenuMaxHeight = 'menu_max_height';
  static const String _ddfEnableFeedback = 'enable_feedback';
  static const String _ddfIsRequiredKey = 'is_required';
  static const String _ddfShowErrorKey = 'show_error';
  static const String _ddfCustomErrorTextKey = 'custom_error_text';
  static const String _ddfShowBorderKey = 'show_border';
  static const String _ddfBorderRadiusKey = 'border_radius';
  static const String _ddfBorderWidthKey = 'border_width';
  static const String _ddfBorderColorKey = 'border_color';

  //!=======================================================//
  //!=======================================================//

  /// Name of the component for dev use. (Should be set to the key of the json being used to store this component's value in your DB.)
  /// Mandatory parameter, throws error if not specified.
  @override
  @JsonKey(name: _ddfNameKey)
  final String name;

  /// Legend of the component. (The text that will be displayed above the component.)
  /// Defaults to null.
  @JsonKey(name: _ddfLegendKey)
  final String? legend;

  /// Description of the Dropdown field.
  /// Defaults to empty string "".
  @JsonKey(name: _ddfHelperTextKey)
  final String? helperText;

  /// Hint text is displayed in dropdown option when no object is selected.
  /// It acts as placeholder.
  @JsonKey(name: _ddfHintTextKey)
  final String? hintText;

  /// Items alignment
  ///
  @JsonKey(name: _ddfItemsAlignmentKey)
  final DropdownItemAlignment itemsAlignment;

  /// different values that Dropdown can have, in order.
  /// Defaults to empty list [].
  @JsonKey(name: _ddfItemLabelsKey)
  final List<String> itemLabels;

  /// different values that Dropdown can have, in order.
  /// Defaults to empty list [].
  @JsonKey(name: _ddfItemValuesKey)
  final List itemValues;

  /// Label color is applied to the text displayed in dropdown menu.
  /// Defaults to `ffffff`.
  @JsonKey(name: _ddfLabelColorKey)
  final String labelColor;

  /// Dropdown color is the background color of the dropdown menu.
  @JsonKey(name: _ddfDropdownColorKey)
  final String dropdownColor;

  /// elevation of the dropdown.
  @JsonKey(name: _ddfElevationKey)
  final double elevation;

  /// If it is true then there will be a padding around the dropdown button
  /// Defaults to `false`.
  @JsonKey(name: _ddfIsDenseKey)
  final bool isDense;

  /// If it is true then the dropdown component takes the whole width available.
  /// Else it takes the width of it's content. Default value is false.
  @JsonKey(name: _ddfIsExpandedKey)
  final bool isExpanded;

  /// Maximum height for menu. Usually it takes up the height of it's content.
  /// Default value is null.
  @JsonKey(name: _ddfMenuMaxHeight)
  final double? menuMaxHeight;

  /// If feedback is enabled then the user can feel any platform specific haptic gestures.
  /// Default value is false
  @JsonKey(name: _ddfEnableFeedback)
  final bool enableFeedback;

  /// Whether this field is required or not for form submission.
  /// Defaults to `false`.
  @JsonKey(name: _ddfIsRequiredKey)
  final bool isRequired;

  /// To display errors. (overwrites the value from form options)
  /// Defaults to `true`.
  @JsonKey(name: _ddfShowErrorKey)
  final bool showError;

  /// Custom Error text to show.
  /// Defaults to empty string "".
  @JsonKey(name: _ddfCustomErrorTextKey)
  final String? customErrorText;

  /// Whether to show a border or not
  /// Default value is `true`
  @JsonKey(name: _ddfShowBorderKey)
  final bool showBorder;

  /// Border radius
  /// Default value is `8`
  @JsonKey(name: _ddfBorderRadiusKey)
  final double borderRadius;

  /// Border width
  /// Default value is `1`
  @JsonKey(name: _ddfBorderWidthKey)
  final double borderWidth;

  /// Border color
  /// Default value is `000000`
  @JsonKey(name: _ddfBorderColorKey)
  final String borderColor;

  DropdownComponentProperties({
    required this.name,
    this.legend,
    this.helperText,
    this.hintText,
    this.itemsAlignment = DropdownItemAlignment.center,
    required this.itemLabels,
    required this.itemValues,
    this.labelColor = "000000",
    this.dropdownColor = "ffffff",
    this.elevation = 8,
    this.isDense = false,
    this.isExpanded = false,
    this.menuMaxHeight,
    this.enableFeedback = false,
    this.isRequired = true,
    this.showError = true,
    this.customErrorText = '',
    this.showBorder = true,
    this.borderRadius = 8,
    this.borderWidth = 1,
    this.borderColor = "000000",
  });

  @override
  String get type => dropdownComponentTypeName;

  //Factory constructor.
  /// Creates a DropdownComponentProperties object from given map.
  /// Checks the given map with `DropdownComponentProperties.DropdownFieldPropertiesChecker` before creating object.
  /// Will throw error with specific message if any invalid value found for valid props.
  /// `name` is a mandatory props. Excluding it will lead to check failing.
  factory DropdownComponentProperties.fromMap(Map<String, dynamic> map) {
    var check = DropdownComponentProperties.dropdownFieldPropertiesChecker(
      map,
      isMap: true,
    );
    if (check is String) throw check;
    return _$DropdownComponentPropertiesFromJson(map);
  }

  /// Factory constructor to convert the Dropdown properties JSON object to a map.
  factory DropdownComponentProperties.fromJson(String json) {
    Map<String, dynamic> parsed = jsonDecode(json);
    var check =
        DropdownComponentProperties.dropdownFieldPropertiesChecker(parsed);
    if (check is String) throw check;
    return _$DropdownComponentPropertiesFromJson(parsed);
  }

  /// Serializer to convert [DropdownComponentProperties] Object to map.
  static Map<String, dynamic> toJson(object) {
    return _$DropdownComponentPropertiesToJson(object);
  }

  /// A method to check if the given map is a valid [DropdownComponentProperties] object.
  static dynamic dropdownFieldPropertiesChecker(
    Map<String, dynamic> props, {
    bool isMap = false,
  }) {
    if (!isMap && props[_ddfTypeKey] is! String ||
        props[_ddfTypeKey] != dropdownComponentTypeName) {
      // If the type is not a string or is not a Dropdown component type.
      return 'bad value for "$_ddfTypeKey".Expected "$dropdownComponentTypeName" but got "${props[_ddfTypeKey]}".';
    }
    if (props[_ddfNameKey] is! String) {
      // If the name is not a string.
      return 'bad value for "$_ddfNameKey".Expected a "String" but got "${props[_ddfNameKey]}".';
    }

    // -------- CHECKS FOR REQUIRED FIELDS --------

    // Check if labels key exists or not.
    // If exists then check if it is List<String> or not
    if (!props.keys.contains(_ddfItemLabelsKey)) {
      // If the labels key doesn't exist.
      return '"$_ddfItemLabelsKey" field is required';
    }

    if (props[_ddfItemLabelsKey] is! List<String>) {
      // If the labels is not a list.
      return 'bad value for "$_ddfItemLabelsKey".Expected a "List" but got "$_ddfItemLabelsKey".';
    }

    // Check if values key exists or not.
    // If exists then check if it is List or not
    if (!props.keys.contains(_ddfItemValuesKey)) {
      // If the values key doesn't exist.
      return '"$_ddfItemValuesKey" field is required';
    }

    if (props[_ddfItemValuesKey] is! List) {
      // If the values is not a list.
      return 'bad value for "$_ddfItemValuesKey".Expected a "List" but got "$_ddfItemValuesKey".';
    }

    // Check for length of labels and values. They must be same.
    if (props[_ddfItemLabelsKey].length != props[_ddfItemValuesKey].length) {
      // If the labels and values are not of same length.
      return 'The length of "$_ddfItemLabelsKey" and "$_ddfItemValuesKey" should be same.';
    }

    // -------- CHECKS FOR OPTIONAL FIELDS --------
    for (var key in props.keys) {
      if (key == _ddfHelperTextKey ||
          key == _ddfHintTextKey ||
          key == _ddfCustomErrorTextKey) {
        if (props[key] is! String) {
          // If the helper text is same as the key in JSON but not a string, then throw error.
          return 'bad value for "$key".Expected a String but got "${props[key]}".';
        }
      }
      if (key == _ddfItemsAlignmentKey) {
        if (props[key] is! String) {
          // If the alignment is not a string.
          return 'bad value for $_ddfItemsAlignmentKey: "${props[key]}" expected a String.';
        }
        //TODO: Add a helper function to check whether it is a valid alignment type.
      }
      if (key == _ddfLabelColorKey ||
          key == _ddfBorderColorKey ||
          key == _ddfDropdownColorKey) {
        if (props[key] is! String) {
          // check if colorKey is a string.
          return 'bad value for $_ddfLabelColorKey: "${props[key]}" expected a String of length 6.';
        }
        if (props[key].toString().length != 6) {
          // if it IS a string, check if the length is exactly 6
          return 'bad value for $_ddfLabelColorKey: "${props[key]}" expected a String of length 6.';
        }
      }
      if (key == _ddfDropdownColorKey) {
        if (props[key] is! String) {
          // check if colorKey is a string.
          return 'bad value for $_ddfDropdownColorKey: "${props[key]}" expected a String of length 6.';
        }
        if (props[key].toString().length != 6) {
          // if it IS a string, check if the length is exactly 6
          return 'bad value for $_ddfDropdownColorKey: "${props[key]}" expected a String of length 6.';
        }
      }
      if ((key == _ddfBorderWidthKey ||
              key == _ddfBorderRadiusKey ||
              key == _ddfElevationKey ||
              key == _ddfMenuMaxHeight) &&
          (props[key] is! double)) {
        return "bad value for $key: ${props[key]} expected a Double.";
      }
      if ((key == _ddfIsDenseKey ||
              key == _ddfIsExpandedKey ||
              key == _ddfIsRequiredKey ||
              key == _ddfEnableFeedback ||
              key == _ddfShowBorderKey ||
              key == _ddfShowErrorKey) &&
          (props[key] is! bool)) {
        return "bad value for $key: ${props[key]} expected a Boolean.";
      }
    }
    return true;
  }
}

// -- ENUMS --

/// DropdownFieldAlignment enum determines the alignment of the Dropdown buttons and it's text.
/// It can be [left],[right] or [center]. Default is [center].
///
enum DropdownItemAlignment { left, center, right }
