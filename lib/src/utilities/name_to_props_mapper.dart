import 'package:flutter_dynamic_forms/src/models/range_slider_field_props.dart';

import '../constants/constants.dart';
import '../models/base_model.dart';
import '../models/checkbox_field_props.dart';
import '../models/datepicker_field_props.dart';
import '../models/dropdown_field_props.dart';
import '../models/multiselect_dropdown_field_props.dart';
import '../models/radio_field_props.dart';
import '../models/slider_field_props.dart';
import '../models/text_field_props.dart';

/// `nameToPropsMapper` is a function that maps the name of a component to its props.
BaseModel nameToPropsMapper(String key, Map<String, dynamic> map) {
  if (key == textComponentTypeName) {
    // If key is text component, then check for textfield properties validation.
    var check = TextComponentProperties.textFieldPropsChecker(map);
    if (check is String) {
      // If the check is string, then it is an error message.
      // Throw the error message.
      throw check;
    }
    // If the check is not string, then it is a valid map.
    // Create a TextComponentProperties object from the map.
    return TextComponentProperties.fromMap(map);
  } else if (key == radioComponentTypeName) {
    // If key is radio component, then check for radiofield properties validation.
    var check = RadioComponentProperties.radioFieldPropertiesChecker(map);
    if (check is String) {
      // If the check is string, then it is an error message.
      // Throw the error message.
      throw check;
    }
    // If the check is not string, then it is a valid map.
    // Create a RadioComponentProps object from the map.
    return RadioComponentProperties.fromMap(map);
  } else if (key == checkBoxComponentName) {
    // If key is check component, then check for checkfield properties validation.
    var check = CheckBoxComponentProperties.checkBoxFieldPropertiesChecker(map);
    if (check is String) {
      // If the check is string, then it is an error message.
      // Throw the error message.
      throw check;
    }
    // If the check is not string, then it is a valid map.
    // Create a CheckComponentProps object from the map.
    return CheckBoxComponentProperties.fromMap(map);
  } else if (key == sliderComponentTypeName) {
    // If key is slider component, then check for slider properties validation.
    var check = SliderComponentProperties.propertiesChecker(map);
    if (check is String) {
      // If the check is string, then it is an error message.
      // Throw the error message.
      throw check;
    }
    // If the check is not string, then it is a valid map.
    // Create a SliderComponentProperties object from the map.
    return SliderComponentProperties.fromMap(map);
  } else if (key == rangeSliderComponentTypeName) {
    var check = RangeSliderComponentProperties.propertiesChecker(map);
    if (check is String) {
      // If the check is string, then it is an error message.
      // Throw the error message.
      throw check;
    }
    return RangeSliderComponentProperties.fromMap(map);
  } else if (key == dropdownComponentTypeName) {
    // If key is dropdown component, then check for dropdown properties validation.
    var check = DropdownComponentProperties.dropdownFieldPropertiesChecker(map);
    if (check is String) {
      // If the check is string, then it is an error message.
      // Throw the error message.
      throw check;
    }
    // If the check is not string, then it is a valid map.
    // Create a DropdownComponentProperties object from the map.
    return DropdownComponentProperties.fromMap(map);
  }

  // DatePicker Component
  else if (key == datePickerComponentTypeName) {
    // If key is datepicker component, then check for datepicker properties validation.
    var check = DatePickerComponentProperties.propertiesChecker(map, isMap: true);
    if (check is String) {
      // If the check is string, then it is an error message.
      // Throw the error message.
      throw check;
    }
    // If the check is not string, then it is a valid map.
    // Create a DatePickerComponentProperties object from the map.
    return DatePickerComponentProperties.fromMap(map);
  }

  // Multiselect Component
  else if (key == multiselectDropdownComponentTypeName) {
    // If key is multi dropdown component, then check for multi dropdown properties validation.
    var check = MultiSelectDropdownComponentProperties.propertiesChecker(map, isMap: true);
    if (check is String) {
      // If the check is string, then it is an error message.
      // Throw the error message.
      throw check;
    }
    // If the check is not string, then it is a valid map.
    // Create a MultiSelectDropdownComponentProperties object from the map.
    return MultiSelectDropdownComponentProperties.fromMap(map);
  }

  throw 'Unkown component with name $map.';
}
