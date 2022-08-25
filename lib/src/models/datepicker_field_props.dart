import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_dynamic_forms/src/models/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../constants/constants.dart';

part 'datepicker_field_props.g.dart';

@JsonSerializable()
class DatePickerComponentProperties implements BaseModel {
  //!=======================================================//
  //    Json Keys of the props used by DatePickerComponent
  //!=======================================================//
  static const String _dpfTypeKey = 'type';
  static const String _dpfNameKey = 'name';
  static const String _dpfInitialDateKey = 'initial_date';
  static const String _dpfRangePickerMode = 'range_picker_mode';
  static const String _dpfFirstDateKey = 'first_date';
  static const String _dpfLastDateKey = 'last_date';
  static const String _dpfDatePickerEntryModeKey = 'date_picker_entry_mode';
  static const String _dpfPickerHelpTextKey = 'picker_help_text';
  static const String _dpfPickerCancelTextKey = 'picker_cancel_text';
  static const String _dpfPickerSelectTextKey = 'picker_select_text';
  static const String _dpfInitialDatePickerModeKey = 'initial_date_picker_mode';
  static const String _dpfIsRequiredKey = 'is_required';
  static const String _dpfCustomErrorTextKey = 'custom_error_text';

  //!=======================================================//
  //!=======================================================//

  /// Name of the component for dev use. (Should be set to the key of the json being used to store this component's value in your DB.)
  /// Mandatory parameter, throws error if not specified.
  @override
  @JsonKey(name: _dpfNameKey)
  final String name;

  @JsonKey(name: _dpfRangePickerMode)
  final bool rangePickerMode;

  @JsonKey(name: _dpfInitialDateKey)
  final String? initialDate;

  @JsonKey(name: _dpfFirstDateKey)
  final String? firstDate;

  @JsonKey(name: _dpfLastDateKey)
  final String? lastDate;

  @JsonKey(name: _dpfDatePickerEntryModeKey)
  final DatePickerEntryMode datePickerEntryMode;

  @JsonKey(name: _dpfPickerHelpTextKey)
  final String? pickerHelpText;

  @JsonKey(name: _dpfPickerCancelTextKey)
  final String pickerCancelText;

  @JsonKey(name: _dpfPickerSelectTextKey)
  final String pickerSelectText;

  @JsonKey(name: _dpfInitialDatePickerModeKey)
  final DatePickerMode initialDatePickerMode;

  @JsonKey(name: _dpfIsRequiredKey)
  final bool isRequired;

  @JsonKey(name: _dpfCustomErrorTextKey)
  final String? customErrorText;

  DatePickerComponentProperties({
    required this.name,
    this.rangePickerMode = false,
    this.customErrorText,
    this.datePickerEntryMode = DatePickerEntryMode.calendar,
    this.initialDatePickerMode = DatePickerMode.day,
    this.isRequired = false,
    this.pickerCancelText = "cancel",
    this.pickerHelpText,
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

  /// A method to check if the given map is a valid [DatepickerComponentProperties] object.
  static dynamic propertiesChecker(
    Map<String, dynamic> props, {
    bool isMap = false,
  }) {
    if (!isMap &&
        (props[_dpfTypeKey] is! String || props[_dpfTypeKey] != datePickerComponentTypeName)) {
      // If the type is not a string or is not a DatePicker component type.
      return 'Bad value for "$_dpfTypeKey".Expected "$datePickerComponentTypeName" but got "${props[_dpfTypeKey]}".';
    }

    if (props[_dpfNameKey] is! String) {
      // If the type is not a string.
      return 'bad value for "$_dpfNameKey".Expected String but got "${props[_dpfNameKey]}".';
    }

    for (var key in props.keys) {
      // Checks for datetime string props.
      if (key == _dpfFirstDateKey || key == _dpfLastDateKey || key == _dpfInitialDateKey) {
        if (props[key] is! String) {
          return 'bad value for "$key".Expected a valid DateTime String but got "${props[key]}".';
        }
        try {
          DateTime.parse(props[key]);
        } catch (e) {
          return 'bad value for "$key". Expected a valid DateTime String but got "${props[key]}".';
        }
      }

      if ((key == _dpfPickerHelpTextKey ||
              key == _dpfPickerCancelTextKey ||
              key == _dpfPickerSelectTextKey ||
              key == _dpfCustomErrorTextKey) &&
          props[key] is! String) {
        return 'bad value for "$key".Expected a String but got "${props[key]}".';
      }

      if ((key == _dpfIsRequiredKey || key == _dpfRangePickerMode) && props[key] is! bool) {
        return 'bad value for "$key".Expected a Boolean but got "${props[key]}".';
      }
    }
  }
}
