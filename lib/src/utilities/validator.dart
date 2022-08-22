import '../../flutter_dynamic_forms.dart';
import '../models/validation_result.dart';

ValidationResult textComponentValidator({
  required TextComponentProperties properties,
  required String value,
}) {
  ValidationResult validationResult = ValidationResult(
      componentName: properties.name, type: properties.type, value: value, errors: []);
  if (properties.isRequired && value == "") {
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

  if (properties.regexMatch != null) {
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

  if (properties.minLength != null && value.length < properties.minLength!) {
    if (properties.customErrorText != null) {
      validationResult.errors.add({"MinLength": properties.customErrorText});
    } else {
      validationResult.errors.add({
        "MinLength": "Should be minimum ${properties.minLength} characters long."
      });
    }
  }

  return validationResult;
}
