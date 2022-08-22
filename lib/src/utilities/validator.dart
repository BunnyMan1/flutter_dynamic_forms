import 'package:flutter_dynamic_forms/src/constants/constants.dart';
import 'package:flutter_dynamic_forms/src/models/base_model.dart';

import '../../flutter_dynamic_forms.dart';
import '../models/validation_result.dart';

ValidationResult componentValidator({
  required BaseModel properties,
  required dynamic value,
}) {
  // print(
  // " #######################  \n  To validate comp : ${properties.type}  \n ##########################");

  // Validation logic for text component.
  if (properties.type == textComponentTypeName) {
    properties = properties as TextComponentProperties;
    ValidationResult validationResult = ValidationResult(
        componentName: properties.name, type: properties.type, value: value, errors: []);
    if (properties.isRequired && (value == null || value == "")) {
      if (properties.customErrorText != null) {
        validationResult.errors.add(
          {"Required": properties.customErrorText},
        );
      } else {
        validationResult.errors.add(
          {"Required": "This field is required."},
        );
      }
    }

    if (properties.regexMatch != null && value != null) {
      try {
        var match = RegExp(properties.regexMatch!).hasMatch(value);
        if (!match) {
          if (properties.customErrorText != null) {
            validationResult.errors.add({"Regex": properties.customErrorText});
          } else {
            validationResult.errors.add({"Regex": "Invalid input : $value"});
          }
        }
      } catch (e) {
        throw "Invalid regex ${properties.regexMatch} : $e";
      }
    }

    if (properties.minLength != null && value != null && value.length < properties.minLength!) {
      if (properties.customErrorText != null) {
        validationResult.errors.add({"MinLength": properties.customErrorText});
      } else {
        validationResult.errors
            .add({"MinLength": "Should be minimum ${properties.minLength} characters long."});
      }
    }

    return validationResult;
  }

  // validation logic for radio component.
  if (properties.type == radioComponentTypeName) {
    // print(" radio's valuer : $value");
    properties = properties as RadioComponentProperties;
    ValidationResult validationResult = ValidationResult(
        componentName: properties.name, type: properties.type, value: value, errors: []);

    if (properties.required && value == null) {
      validationResult.errors.add({"Required": "This is a required field."});
    }

    return validationResult;
  }

  if (properties.type == sliderComponentTypeName) {
    ValidationResult validationResult = ValidationResult(
        componentName: properties.name, type: properties.type, value: value, errors: []);

    return validationResult;
  }

  throw 'Unknown component cannot be validated';
}
