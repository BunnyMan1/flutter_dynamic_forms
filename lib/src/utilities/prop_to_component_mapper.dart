import 'package:flutter/material.dart';

import '../components/checkbox_component.dart';
import '../components/date_picker_component.dart';
import '../components/dropdown_component.dart';
import '../components/radio_component.dart';
import '../components/slider_component.dart';
import '../components/text_component.dart';
import '../constants/constants.dart';
import '../models/base_model.dart';
import '../models/checkbox_field_props.dart';
import '../models/datepicker_field_props.dart';
import '../models/dropdown_field_props.dart';
import '../models/radio_field_props.dart';
import '../models/slider_field_props.dart';
import '../models/text_field_props.dart';
import 'validator.dart';

/// Takes a data class that extends [BaseModel] and returns a corresponding [Widget].
Widget propsToComponentMapper({
  required BaseModel properties,
  required Function(dynamic name, dynamic value, {bool? isList}) setValue,
  required Function(dynamic name, dynamic value) setValidation,
  required Map<String, dynamic> values,
  required Map<String, dynamic> validations,
}) {
  // Text Component
  if (properties.type == textComponentTypeName) {
    var p = properties as TextComponentProperties;
    return TextFieldComponent(
      onChange: (s) {
        if (p.trimWhiteSpace) {
          s = s.trim();
        }

        setValue(properties.name, s);
      },
      onFocusLost: (s) {
        if (p.trimWhiteSpace) {
          s = s.trim();
        }
        var res = componentValidator(
          properties: p,
          value: s,
        );

        if (res.errors.isNotEmpty) {
          setValidation(
            properties.name,
            res.errors.first.values.first.toString(),
          );
        } else {
          setValidation(properties.name, null);
        }
      },
      error: validations[p.name],
      props: p,
      controller: TextEditingController(text: values[p.name] ?? "")
        ..selection = TextSelection.collapsed(offset: (values[p.name] ?? "").length),
    );
  }

  // Radio Component
  else if (properties.type == radioComponentTypeName) {
    // If the property name is [radioComponentName] then return a [RadioFieldComponent]
    return RadioFieldComponent(
      onChange: (s) {
        setValue(properties.name, s);
      },
      value: values[properties.name],
      error: validations[properties.name],
      properties: properties as RadioComponentProperties,
    );
  }
  // Checkbox Component
  else if (properties.type == checkBoxComponentName) {
    // If the property name is [radioComponentName] then return a [RadioFieldComponent]
    if (values[properties.name] == null) {
      values[properties.name] = [];
    }

    return CheckBoxFieldComponent(
      onChange: (s) {
        setValue(
          properties.name,
          s,
          isList: true,
        );
      },
      value: values[properties.name],
      error: validations[properties.name],
      properties: properties as CheckBoxComponentProperties,
    );
  }

  // Slider Component
  else if (properties.type == sliderComponentTypeName) {
    // If the property name is [SliderComponentTypeName] then return a [SliderComponent]
    return SliderComponent(
      value: values[properties.name] ?? (properties as SliderComponentProperties).minValue,
      onChange: (d) {
        setValue(properties.name, d);
      },
      properties: properties as SliderComponentProperties,
    );
  }

  // Single Dropdown component
  else if (properties.type == dropdownComponentTypeName) {
    // If the property name is [DropdownComponentTypeName] then return a [DropdownComponent]
    return DropdownFieldComponent(
      properties: properties as DropdownComponentProperties,
      onChange: (d) {
        setValue(properties.name, d);
        var res = componentValidator(
          properties: properties,
          value: d,
        );

        if (res.errors.isNotEmpty) {
          setValidation(
            properties.name,
            res.errors.first.values.first.toString(),
          );
        } else {
          setValidation(properties.name, null);
        }
      },
      value: values[properties.name],
      error: validations[properties.name],
    );
  }

  // Datepicker Component
  else if (properties.type == datePickerComponentTypeName) {
    // If the property name is [datePickerComponentTypeName] then return a [DatePickerComponent]
    properties = properties as DatePickerComponentProperties;
    return DatePickerComponent(
      onChange: ((dt) {
        setValue(properties.name, dt);
      }),
      properties: properties,
      value: values[properties.name],
    );
  }

  // If no proper component then throw this error.
  throw 'Unknown component.';
}
