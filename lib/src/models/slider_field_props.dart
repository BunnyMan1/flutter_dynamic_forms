import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../constants/constants.dart';
import 'base_model.dart';

part 'slider_field_props.g.dart';

@JsonSerializable()
class SliderComponentProperties extends BaseModel {
  //!=======================================================//
  //    Json Keys of the props used by TextFieldComponent
  //!=======================================================//
  static const String _sfTypeKey = "type";
  static const String _sfNameKey = "name";
  static const String _sfHelperTextKey = "helper_text";
  static const String _sfLabelKey = "label";
  static const String _sfDivisionsKey = "divisions";
  static const String _sfMinValueKey = "min_value";
  static const String _sfMaxValueKey = "max_value";
  static const String _sfActiveColorKey = "active_color";
  static const String _sfInactiveColorKey = "inactive_color";
  static const String _sfThumbColorKey = "thumb_color";

  //!=======================================================//
  //!=======================================================//

  /// Name of the widget.
  @override
  @JsonKey(name: _sfNameKey)
  final String name;

  /// Description of the slider. 
  @JsonKey(name: _sfHelperTextKey)
  final String? helperText;

  /// Label of the the slider
  @JsonKey(name: _sfLabelKey)
  final String label;

  /// Minimum value of the slider
  @JsonKey(name: _sfMinValueKey)
  final double minValue;

  /// Maximum value of the slider
  @JsonKey(name: _sfMaxValueKey)
  final double maxValue;

  /// Number of divisions in slider
  @JsonKey(name: _sfDivisionsKey)
  final int? divisions;

  /// Color for the active track of the slider. Defaults to material blue.
  @JsonKey(name: _sfActiveColorKey)
  final String? activeColor;

  /// Color for the inactive track of the slider. Defaults to grey.
  @JsonKey(name: _sfInactiveColorKey)
  final String? inActiveColor;

  /// Color for the thumb of the slider. Defaults to material blue.
  @JsonKey(name: _sfThumbColorKey)
  final String? thumbColor;

  SliderComponentProperties({
    required this.name,
    this.helperText,
    this.label = "",
    this.minValue = 0.0,
    this.maxValue = 10.0,
    this.divisions,
    this.activeColor,
    this.inActiveColor,
    this.thumbColor,
  });

  //Factory constructor.
  /// Creates a SliderComponentProperties object from given map.
  /// Checks the given map with `SliderComponentProperties.propsChecker` before creating object.
  /// Will throw error with specific message if any invalid value found for valid props.
  /// `name` is a mandatory props. Excluding it will lead to check failing.
  factory SliderComponentProperties.fromMap(Map<String, dynamic> map) {
    var check = SliderComponentProperties.propertiesChecker(map, isMap: true);
    if (check is String) throw check;
    return _$SliderComponentPropertiesFromJson(map);
  }

  //Factory constructor.
  factory SliderComponentProperties.fromJson(String json) {
    Map<String, dynamic> parsed = jsonDecode(json);
    var check = SliderComponentProperties.propertiesChecker(parsed);
    if (check is String) throw check;
    return _$SliderComponentPropertiesFromJson(parsed);
  }

  // Serializer to convert Wellness Object to map.
  static Map<String, dynamic> toJson(object) {
    return _$SliderComponentPropertiesToJson(object);
  }

  static dynamic propertiesChecker(
    Map<String, dynamic> props, {
    bool isMap = false,
  }) {
    if (props[_sfNameKey] == null) {
      return "Bad value for $_sfNameKey. Expected a string but got ${props[_sfNameKey]}";
    }

    if (!isMap && props[_sfTypeKey] == null) {
      return "Bad value for $_sfTypeKey. Expected `slider` but got ${props[_sfNameKey]}";
    }

    for (var key in props.keys) {
      if (key == _sfLabelKey) {
        if (props[key] is! String) {
          // If the helper text is same as the key in JSON but not a string, then throw error.
          return 'bad value for "$key".Expected a String but got "${props[key]}".';
        }
      }
      if (key == _sfHelperTextKey) {
        if (props[key] is! String) {
          // If the helper text is same as the key in JSON but not a string, then throw error.
          return 'bad value for "$key".Expected a String but got "${props[key]}".';
        }
      }

      if (key == _sfDivisionsKey && props[key] is! int) {
        return "Bad value for $key. Expected int but got ${props[key]}";
      }
      if (key == _sfMinValueKey || key == _sfMaxValueKey) {
        if (props[key] is! double) {
          return "Bad value for $key. Expected double but got ${props[key]}";
        }
      }

      if (key == _sfActiveColorKey ||
          key == _sfInactiveColorKey ||
          key == _sfThumbColorKey) {
        if (props[key] is! String) {
          return "Bad value for $key. Expected a String of length 6 but got ${props[key]}";
        }
        if (props[key].toString().length != 6) {
          return "Bad value for $key. Expected String of length 6 but got ${props[key]}";
        }
      }

      if (key == _sfLabelKey && props[key] is! String) {
        return "Bad value for $key. Expected String but got ${props[key]}";
      }
    }
  }

  @override
  String get type => sliderComponentTypeName;
}
