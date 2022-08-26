import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../constants/constants.dart';
import 'base_model.dart';

part 'datepicker_field_props.g.dart';

@JsonSerializable()
class DatePickerComponentProperties implements BaseModel {
  //!=======================================================//
  //    Json Keys of the props used by DatePickerComponent
  //!=======================================================//
  static const String _dpfTypeKey = "type";
  static const String _dpfNameKey = "name";
  static const String _dpfLabelKey = "label";
  static const String _dpfHelperTextKey = "helper_text";
  static const String _dpfPlaceHolderKey = "place_holder";
  static const String _dpfInitialDateKey = "initial_date";
  static const String _dpfFirstDateKey = "first_date";
  static const String _dpfLastDateKey = "last_date";
  static const String _dpfDatePickerEntryModeKey = "date_picker_entry_mode";
  static const String _dpfPickerCancelTextKey = "picker_cancel_text";
  static const String _dpfPickerSelectTextKey = "picker_select_text";
  static const String _dpfIsRangePickerModeKey = "is_range_picker_mode";
  static const String _dpfIsRequiredKey = "is_required";
  static const String _dpfShowErrorKey = "show_error";
  static const String _dpfCustomErrorTextKey = "custom_error_text";
  static const String _dpfTextColorKey = "text_color";
  static const String _dpfShowBorderKey = "show_border";
  static const String _dpfBorderColorKey = "border_color";
  static const String _dpfBorderWidthKey = "border_width";
  static const String _dpfBorderRadiusKey = "border_radius";

  //!=======================================================//
  //!=======================================================//

  /// Name of the component for dev use. (Should be set to the key of the json being used to store this component's value in your DB.)
  /// Mandatory parameter, throws error if not specified.
  @override
  @JsonKey(name: _dpfNameKey)
  final String name;

  @JsonKey(name: _dpfLabelKey)
  final String label;

  @JsonKey(name: _dpfHelperTextKey)
  final String helperText;

  /// Color of the text in the text field.
  /// defaults to "000000"
  @JsonKey(name: _dpfTextColorKey)
  final String textColor;

  /// Boolean value determining whether the text field will have a border or not.
  /// Defaults to true.
  @JsonKey(name: _dpfShowBorderKey)
  final bool showBorder;

  /// Color of the border of the text field.
  /// defaults to "000000"
  @JsonKey(name: _dpfBorderColorKey)
  final String borderColor;

  /// Width of the border of the text field.
  /// defaults to 1.0
  @JsonKey(name: _dpfBorderWidthKey)
  final double borderWidth;

  /// Radius of the border of the text field.
  /// defaults to 8.0
  @JsonKey(name: _dpfBorderRadiusKey)
  final double borderRadius;

  @JsonKey(name: _dpfIsRangePickerModeKey)
  final bool rangePickerMode;

  @JsonKey(name: _dpfInitialDateKey)
  final String? initialDate;

  @JsonKey(name: _dpfFirstDateKey)
  final String? firstDate;

  @JsonKey(name: _dpfLastDateKey)
  final String? lastDate;

  @JsonKey(name: _dpfDatePickerEntryModeKey)
  final DatePickerEntryMode datePickerEntryMode;

  @JsonKey(name: _dpfPlaceHolderKey)
  final String? placeHolderText;

  @JsonKey(name: _dpfPickerCancelTextKey)
  final String pickerCancelText;

  @JsonKey(name: _dpfPickerSelectTextKey)
  final String pickerSelectText;

  @JsonKey(name: _dpfIsRequiredKey)
  final bool isRequired;

  /// Boolean value determining whether the text field will have a border or not.
  /// Defaults to true.
  @JsonKey(name: _dpfShowErrorKey)
  final bool showError;

  @JsonKey(name: _dpfCustomErrorTextKey)
  final String? customErrorText;

  DatePickerComponentProperties({
    required this.name,
    this.label = "",
    this.helperText = "",
    this.textColor = "000000",
    this.showBorder = true,
    this.borderColor = "000000",
    this.borderWidth = 1.0,
    this.borderRadius = 8.0,
    this.rangePickerMode = false,
    this.showError = true,
    this.customErrorText,
    this.datePickerEntryMode = DatePickerEntryMode.calendar,
    this.isRequired = false,
    this.pickerCancelText = "cancel",
    this.placeHolderText,
    this.pickerSelectText = "select",
    this.firstDate,
    this.initialDate,
    this.lastDate,
  });
  //  {
  //   firstDate = DateTime.now().subtract(const Duration(days: 365)).toString();
  //   lastDate = DateTime.now().add(const Duration(days: 365)).toString();
  //   initialDate = DateTime.now().toString();
  // }
  @override
  String get type => datePickerComponentTypeName;

  //Factory constructor.
  /// Creates a DatePickerComponentProperties object from given map.
  /// Checks the given map with `DatePickerComponentProperties.propertiesChecker` before creating object.
  /// Will throw error with specific message if any invalid value found for valid props.
  /// `name` is a mandatory props. Excluding it will lead to check failing.
  factory DatePickerComponentProperties.fromMap(Map<String, dynamic> map) {
    var check = DatePickerComponentProperties.propertiesChecker(
      map,
      isMap: true,
    );
    if (check is String) throw check;
    return _$DatePickerComponentPropertiesFromJson(map);
  }

  /// Factory constructor to convert the DatePicker properties JSON object to a map.
  factory DatePickerComponentProperties.fromJson(String json) {
    Map<String, dynamic> parsed = jsonDecode(json);
    var check = DatePickerComponentProperties.propertiesChecker(parsed);
    if (check is String) throw check;
    return _$DatePickerComponentPropertiesFromJson(parsed);
  }

  /// Serializer to convert [DatePickerComponentProperties] Object to map.
  static Map<String, dynamic> toJson(object) {
    return _$DatePickerComponentPropertiesToJson(object);
  }

  /// A method to check if the given map is a valid [DatePickerComponentProperties] object.
  static dynamic propertiesChecker(
    Map<String, dynamic> props, {
    bool isMap = false,
  }) {
    if (!isMap &&
        (props[_dpfTypeKey] is! String ||
            props[_dpfTypeKey] != datePickerComponentTypeName)) {
      // If the type is not a string or is not a DatePicker component type.
      return 'Bad value for "$_dpfTypeKey".Expected "$datePickerComponentTypeName" but got "${props[_dpfTypeKey]}".';
    }

    if (props[_dpfNameKey] is! String) {
      // If the type is not a string.
      return 'bad value for "$_dpfNameKey".Expected String but got "${props[_dpfNameKey]}".';
    }

    if (props.keys.contains(_dpfIsRangePickerModeKey) &&
        props[_dpfIsRangePickerModeKey]) {
      // if (!props.keys.contains(_dpfFirstDateKey) ||
      //     !props.keys.contains(_dpfLastDateKey)) {
      //   return '"$_dpfFirstDateKey" and "$_dpfLastDateKey" are required for daterange picker mode.';
      // } else
      if (props.keys.contains(_dpfFirstDateKey) &&
          props.keys.contains(_dpfLastDateKey)) {
        {
          DateTime fd;
          DateTime ld;
          try {
            fd = DateTime.parse(props[_dpfFirstDateKey]);
          } catch (e) {
            return 'bad value for "$_dpfFirstDateKey". Expected a valid DateTime String but got "${props[_dpfFirstDateKey]}".';
          }
          try {
            ld = DateTime.parse(props[_dpfLastDateKey]);
          } catch (e) {
            return 'bad value for "$_dpfLastDateKey". Expected a valid DateTime String but got "${props[_dpfFirstDateKey]}".';
          }
          if (fd.isAfter(ld)) {
            return '"$_dpfFirstDateKey" should be any date before "$_dpfLastDateKey"';
          }
        }
      }
    }

    for (var key in props.keys) {
      // Checks for datetime string props.
      if (key == _dpfFirstDateKey ||
          key == _dpfLastDateKey ||
          key == _dpfInitialDateKey) {
        if (props[key] is! String) {
          return 'bad value for "$key".Expected a valid DateTime String but got "${props[key]}".';
        }
        try {
          DateTime.parse(props[key]);
        } catch (e) {
          return 'bad value for "$key". Expected a valid DateTime String but got "${props[key]}".';
        }
      }

      if ((key == _dpfBorderWidthKey || key == _dpfBorderRadiusKey) &&
          (props[key] is! double)) {
        return "bad value for $key: ${props[key]} expected a Double.";
      }

      if ((key == _dpfPlaceHolderKey ||
              key == _dpfPickerCancelTextKey ||
              key == _dpfPickerSelectTextKey ||
              key == _dpfCustomErrorTextKey) &&
          props[key] is! String) {
        return 'bad value for "$key".Expected a String but got "${props[key]}".';
      }

      if ((key == _dpfIsRequiredKey || key == _dpfIsRangePickerModeKey) &&
          props[key] is! bool) {
        return 'bad value for "$key".Expected a Boolean but got "${props[key]}".';
      }
    }
  }
}
