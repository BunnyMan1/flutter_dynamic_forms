import '../../flutter_dynamic_forms.dart';
import '../models/validation_result.dart';

ValidationResult textComponentValidator(TextComponentProperties props, String value) {
  ValidationResult validationResult =
      ValidationResult(componentName: props.name, type: props.type, value: value, errors: []);
  if (props.isRequired && value == "") {
    validationResult.errors.add(
      {"Required": "This field is required."},
    );
  }

  if (props.regexMatch != null) {
    try {
      var match = RegExp(string2Raw(props.regexMatch!)).hasMatch(value);
      if (!match) {
        validationResult.errors
            .add({"Regex": "Invalid or badly formatted value encountered : $value"});
      }
    } catch (e) {
      throw "Exception while matching regex ${props.regexMatch} : $e";
    }
  }

  return validationResult;
}

String string2Raw(String x) => '\r$x';
