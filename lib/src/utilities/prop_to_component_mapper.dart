import 'package:flutter/material.dart';
import '../components/radio_component.dart';
import '../components/slider_component.dart';
import '../components/text_component.dart';
import '../constants/constants.dart';
import '../models/base_model.dart';
import '../models/radio_field_props.dart';
import '../models/slider_field_props.dart';
import '../models/text_field_props.dart';
import 'validator.dart';

/// Takes a data class that extends [BaseModel] and returns a corresponding [Widget].
Widget propsToComponentMapper({
  required BaseModel properties,
  required Function(dynamic name, dynamic value) setValue,
  required Function(dynamic name, dynamic value) setValidation,
  required Map<String, dynamic> values,
  required Map<String, dynamic> validations,
}) {
  // Text Component
  if (properties.type == textComponentTypeName) {
    var p = properties as TextComponentProperties;
    return TextFieldComponent(
      onChange: ((s) {
        if (properties.trimWhiteSpace) {
          s = s.trim();
        }

        setValue(properties.name, s);
      }),
      onFocusLost: (s) {
        if (properties.trimWhiteSpace) {
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
      onChange: ((s) {
        setValue(properties.name, s);
      }),
      value: values[properties.name],
      error: validations[properties.name],
      properties: properties as RadioComponentProperties,
    );
  }

  // Slider Component
  else if (properties.type == sliderComponentTypeName) {
    // If the property name is [sliderComponentTypeName] then return a [SliderComponent]
    return SliderComponent(
      value: values[properties.name] ?? (properties as SliderComponentProperties).minValue,
      onChange: ((d) {
        setValue(properties.name, d);
      }),
      properties: properties as SliderComponentProperties,
    );
  }

  // If no proper component then throw this error.
  throw 'Unknown component.';
}
