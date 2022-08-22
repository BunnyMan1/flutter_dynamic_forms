import 'package:flutter/material.dart';

import '../../flutter_dynamic_forms.dart';
import '../components/radio_component.dart';
import '../components/text_component.dart';
import '../constants/constants.dart';
import '../models/base_model.dart';
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
  if (properties.type == textComponentName) {
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
  else if (properties.type == radioComponentName) {
    // If the property name is [radioComponentName] then return a [RadioFieldComponent]
    return RadioFieldComponent(
      onChange: ((s) {
        setValue(properties.name, s);
      }),
      value: values[properties.name],
      properties: properties as RadioComponentProperties,
    );
  }

  // If no proper component then throw this error.
  throw 'Unknown component.';
}
