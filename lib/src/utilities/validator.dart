import 'package:flutter_dynamic_forms/src/models/text_field_props.dart';

import '../models/validation_result.dart';

ValidationResult textComponentValidator(TextComponentProperties props, String value) {
  ValidationResult validationResult =
      ValidationResult(componentName: props.name, type: props.type, value: value, errors: []);
  if (props.isRequired && value == "") {
    if (props.customErrorText != null) {
      validationResult.errors.add(
        {"Required": props.customErrorText},
      );
    } else {
      validationResult.errors.add(
        {"Required": "This field is required."},
      );
    }
  }

  if (props.regexMatch != null) {
    try {
      var match = RegExp(props.regexMatch!).hasMatch(value);
      if (!match) {
        if (props.customErrorText != null) {
          validationResult.errors.add({"Regex": props.customErrorText});
        } else {
          validationResult.errors.add({"Regex": "Invalid input : $value"});
        }
      }
    } catch (e) {
      throw "Invalid regex ${props.regexMatch} : $e";
    }
  }

  if (props.minLength != null && value.length < props.minLength!) {
    if (props.customErrorText != null) {
      validationResult.errors.add({"MinLength": props.customErrorText});
    } else {
      validationResult.errors
          .add({"MinLength": "Should be minimum ${props.minLength} characters long."});
    }
  }

  return validationResult;
}
