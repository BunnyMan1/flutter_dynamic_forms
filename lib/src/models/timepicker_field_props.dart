import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../constants/constants.dart';
import 'base_model.dart';

part 'timepicker_field_props.g.dart';

/// Json Keys of the props used by TimePickerComponent
@JsonSerializable()
class TimePickerComponentProperties implements BaseModel {
  //!=======================================================//
  //    Json Keys of the props used by TimePickerComponent
  //!=======================================================//
  static const String _tpfTypeKey = "type";
  static const String _tpfNameKey = "name";
  static const String _tpfLabelKey = "label";
  static const String _tpfHelperTextKey = "helper_text";
  static const String _tpfPlaceHolderKey = "place_holder";
  static const String _tpfHourLabelTextKey = "hour_label_text";
  static const String _tpfMinuteabelTextKey = "minute_label_text";
  static const String _tpfInitialTimeKey = "initial_time";
  static const String _tpfTimePickerEntryModeKey = "time_picker_entry_mode";
  static const String _tpfPickerCancelTextKey = "picker_cancel_text";
  static const String _tpfPickerSelectTextKey = "picker_select_text";
  static const String _tpfIsRequiredKey = "is_required";
  static const String _tpfShowErrorKey = "show_error";
  static const String _tpfCustomErrorTextKey = "custom_error_text";
  static const String _tpfTextColorKey = "text_color";
  static const String _tpfShowBorderKey = "show_border";
  static const String _tpfBorderColorKey = "border_color";
  static const String _tpfBorderWidthKey = "border_width";
  static const String _tpfBorderRadiusKey = "border_radius";

  //!=======================================================//
  //!=======================================================//

  /// Name of the component for dev use. (Should be set to the key of the json being used to store this component's value in your DB.)
  /// Mandatory parameter, throws error if not specified.
  @override
  @JsonKey(name: _tpfNameKey)
  final String name;

  @JsonKey(name: _tpfLabelKey)
  final String label;

  @JsonKey(name: _tpfHelperTextKey)
  final String helperText;

  /// Color of the text in the text field.
  /// defaults to "000000"
  @JsonKey(name: _tpfTextColorKey)
  final String textColor;

  /// Boolean value determining whether the text field will have a border or not.
  /// Defaults to true.
  @JsonKey(name: _tpfShowBorderKey)
  final bool showBorder;

  /// Color of the border of the text field.
  /// defaults to "000000"
  @JsonKey(name: _tpfBorderColorKey)
  final String borderColor;

  /// Width of the border of the text field.
  /// defaults to 1.0
  @JsonKey(name: _tpfBorderWidthKey)
  final double borderWidth;

  /// Radius of the border of the text field.
  /// defaults to 8.0
  @JsonKey(name: _tpfBorderRadiusKey)
  final double borderRadius;

  @JsonKey(name: _tpfInitialTimeKey)
  final String? initialTime;

  @JsonKey(name: _tpfTimePickerEntryModeKey)
  final TimePickerEntryMode timePickerEntryMode;

  @JsonKey(name: _tpfPlaceHolderKey)
  final String? placeHolderText;

  @JsonKey(name: _tpfPickerCancelTextKey)
  final String pickerCancelText;

  @JsonKey(name: _tpfPickerSelectTextKey)
  final String pickerSelectText;

  @JsonKey(name: _tpfIsRequiredKey)
  final bool isRequired;

  /// Boolean value determining whether the text field will have a border or not.
  /// Defaults to true.
  @JsonKey(name: _tpfShowErrorKey)
  final bool showError;

  @JsonKey(name: _tpfCustomErrorTextKey)
  final String? customErrorText;

  @JsonKey(name: _tpfHourLabelTextKey)
  final String? hourLabelText;

  @JsonKey(name: _tpfMinuteabelTextKey)
  final String? minuteLabelText;

  TimePickerComponentProperties({
    required this.name,
    this.label = "",
    this.helperText = "",
    this.textColor = "000000",
    this.showBorder = true,
    this.borderColor = "000000",
    this.borderWidth = 1.0,
    this.borderRadius = 8.0,
    this.showError = true,
    this.customErrorText,
    this.timePickerEntryMode = TimePickerEntryMode.dial,
    this.isRequired = false,
    this.pickerCancelText = "cancel",
    this.placeHolderText,
    this.pickerSelectText = "select",
    this.initialTime,
    this.hourLabelText,
    this.minuteLabelText,
  });
  //  {
  //   firstDate = DateTime.now().subtract(const Duration(days: 365)).toString();
  //   lastDate = DateTime.now().add(const Duration(days: 365)).toString();
  //   initialDate = DateTime.now().toString();
  // }
  @override
  String get type => timePickerComponentTypeName;

  //Factory constructor.
  /// Creates a TimePickerComponentProperties object from given map.
  /// Checks the given map with `TimePickerComponentProperties.propertiesChecker` before creating object.
  /// Will throw error with specific message if any invalid value found for valid props.
  /// `name` is a mandatory props. Excluding it will lead to check failing.
  factory TimePickerComponentProperties.fromMap(Map<String, dynamic> map) {
    var check = TimePickerComponentProperties.propertiesChecker(
      map,
      isMap: true,
    );
    if (check is String) throw check;
    return _$TimePickerComponentPropertiesFromJson(map);
  }

  /// Factory constructor to convert the DatePicker properties JSON object to a map.
  factory TimePickerComponentProperties.fromJson(String json) {
    Map<String, dynamic> parsed = jsonDecode(json);
    var check = TimePickerComponentProperties.propertiesChecker(parsed);
    if (check is String) throw check;
    return _$TimePickerComponentPropertiesFromJson(parsed);
  }

  /// Serializer to convert [TimePickerComponentProperties] Object to map.
  static Map<String, dynamic> toJson(object) {
    return _$TimePickerComponentPropertiesToJson(object);
  }

  /// A method to check if the given map is a valid [TimePickerComponentProperties] object.
  static dynamic propertiesChecker(
    Map<String, dynamic> props, {
    bool isMap = false,
  }) {
    if (!isMap &&
        (props[_tpfTypeKey] is! String ||
            props[_tpfTypeKey] != datePickerComponentTypeName)) {
      // If the type is not a string or is not a DatePicker component type.
      return 'Bad value for "$_tpfTypeKey".Expected "$datePickerComponentTypeName" but got "${props[_tpfTypeKey]}".';
    }

    if (props[_tpfNameKey] is! String) {
      // If the type is not a string.
      return 'bad value for "$_tpfNameKey".Expected String but got "${props[_tpfNameKey]}".';
    }

    for (var key in props.keys) {
      // Checks for time string props.
      if (key == _tpfInitialTimeKey) {
        if (props[key] is! String) {
          return 'bad value for "$key".Expected a valid Time String (HH:MM) but got "${props[key]}".';
        }
        try {
          String s = props[key];
          TimeOfDay(
            hour: int.parse(s.split(":")[0]),
            minute: int.parse(s.split(":")[1]),
          );
        } catch (e) {
          return 'bad value for "$key". Expected a valid Time String (HH:MM) but got "${props[key]}".';
        }
      }

      if ((key == _tpfBorderWidthKey || key == _tpfBorderRadiusKey) &&
          (props[key] is! double)) {
        return "bad value for $key: ${props[key]} expected a Double.";
      }

      if ((key == _tpfPlaceHolderKey ||
              key == _tpfPickerCancelTextKey ||
              key == _tpfPickerSelectTextKey ||
              key == _tpfCustomErrorTextKey) &&
          props[key] is! String) {
        return 'bad value for "$key".Expected a String but got "${props[key]}".';
      }

      if (key == _tpfIsRequiredKey && props[key] is! bool) {
        return 'bad value for "$key".Expected a Boolean but got "${props[key]}".';
      }
    }
  }
}
