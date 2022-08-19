import 'package:flutter/material.dart';

import '../../flutter_dynamic_forms.dart';
import '../components/text_component.dart';
import '../constants/constants.dart';
import '../models/base_model.dart';
import 'validator.dart';

Widget propsToComponentMapper(
  BaseModel props,
  Function(dynamic name, dynamic value) setValues,
  Function(dynamic name, dynamic value) setValidations,
  Map<String, dynamic> values,
  Map<String, dynamic> validations,
) {
  if (props.type == textComponentName) {
    var p = props as TextComponentProperties;
    return TextFieldComponent(
      onChange: ((s) {
        // _values[props.name] = s;
        if (props.trimWhiteSpace) {
          s = s.trim();
        }
        setValues(props.name, s);
      }),
      onFocusLost: (s) {
        if (props.trimWhiteSpace) {
          s = s.trim();
        }
        var res = textComponentValidator(p, s);
        if (res.errors.isNotEmpty) {
          setValidations(props.name, res.errors.first.values.first.toString());
        } else {
          setValidations(props.name, null);
        }
      },
      error: validations[p.name],
      props: p,
      controller: TextEditingController(text: values[p.name] ?? "")
        ..selection = TextSelection.collapsed(offset: (values[p.name] ?? "").length),
    );
  }
  throw 'Unknown component.';
}
