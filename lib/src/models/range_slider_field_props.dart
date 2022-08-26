import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../constants/constants.dart';
import 'base_model.dart';

part 'range_slider_field_props.g.dart';

@JsonSerializable()
class RangeSliderComponentProperties extends BaseModel {
  //!=======================================================//
  //    Json Keys of the props used by RangeSliderField
  //!=======================================================//
  static const String _rsfTypeKey = "type";
  static const String _rsfNameKey = "name";
  static const String _rsfLabelKey = "label";
  static const String _rsfDivisionsKey = "divisions";
  static const String _rsfMinValueKey = "min_value";
  static const String _rsfMaxValueKey = "max_value";
  static const String _rsfActiveColorKey = "active_color";
  static const String _rsfInactiveColorKey = "inactive_color";
  static const String _rsfStartLabelKey = "start_label";
  static const String _rsfEndLabelKey = "end_label";
  //!=======================================================//
  //!=======================================================//

  @override
  @JsonKey(name: _rsfNameKey)
  final String name;

  @JsonKey(name: _rsfMinValueKey)
  final double minValue;

  @JsonKey(name: _rsfMaxValueKey)
  final double maxValue;

  @JsonKey(name: _rsfDivisionsKey)
  final int? divisions;

  @JsonKey(name: _rsfActiveColorKey)
  final String? activeColor;

  @JsonKey(name: _rsfInactiveColorKey)
  final String? inActiveColor;

  @JsonKey(name: _rsfStartLabelKey)
  final String startLabel;

  @JsonKey(name: _rsfEndLabelKey)
  final String endLabel;

  @JsonKey(name: _rsfLabelKey)
  final String label;

  RangeSliderComponentProperties({
    required this.name,
    this.minValue = 0.0,
    this.maxValue = 10.0,
    this.divisions,
    this.activeColor,
    this.inActiveColor,
    this.endLabel = "",
    this.startLabel = "",
    this.label = "",
  });

  //Factory constructor.
  /// Creates a SliderComponentProperties object from given map.
  /// Checks the given map with `SliderComponentProperties.propsChecker` before creating object.
  /// Will throw error with specific message if any invalid value found for valid props.
  /// `name` is a mandatory props. Excluding it will lead to check failing.
  factory RangeSliderComponentProperties.fromMap(Map<String, dynamic> map) {
    var check = RangeSliderComponentProperties.propertiesChecker(map, isMap: true);
    if (check is String) throw check;
    return _$RangeSliderComponentPropertiesFromJson(map);
  }

  //Factory constructor.
  factory RangeSliderComponentProperties.fromJson(String json) {
    Map<String, dynamic> parsed = jsonDecode(json);
    var check = RangeSliderComponentProperties.propertiesChecker(parsed);
    if (check is String) throw check;
    return _$RangeSliderComponentPropertiesFromJson(parsed);
  }

  // Serializer to convert Wellness Object to map.
  static Map<String, dynamic> toJson(object) {
    return _$RangeSliderComponentPropertiesToJson(object);
  }

  static dynamic propertiesChecker(
    Map<String, dynamic> props, {
    bool isMap = false,
  }) {
    if (props[_rsfNameKey] == null) {
      return "Bad value for $_rsfNameKey. Expected a string but got ${props[_rsfNameKey]}";
    }

    if (!isMap &&
        props[_rsfTypeKey] == null &&
        props[_rsfTypeKey] != rangeSliderComponentTypeName) {
      return "Bad value for $_rsfTypeKey. Expected `range_slider` but got ${props[_rsfNameKey]}";
    }

    if (props[_rsfMaxValueKey] == null || props[_rsfMaxValueKey] is! double) {
      return "Bad value for $_rsfMaxValueKey. Expected double but got ${props[_rsfMaxValueKey]}";
    }
    if (props[_rsfMinValueKey] == null || props[_rsfMinValueKey] is! double) {
      return "Bad value for $_rsfMinValueKey. Expected double but got ${props[_rsfMinValueKey]}";
    }

    for (var key in props.keys) {
      if (key == _rsfDivisionsKey && props[key] is! int) {
        return "Bad value for $key. Expected int but got ${props[key]}";
      }

      if (key == _rsfActiveColorKey || key == _rsfInactiveColorKey) {
        if (props[key] is! String) {
          return "Bad value for $key. Expected a String of length 6 but got ${props[key]}";
        }
        if (props[key].toString().length != 6) {
          return "Bad value for $key. Expected String of length 6 but got ${props[key]}";
        }
      }

      if ((key == _rsfLabelKey || key == _rsfStartLabelKey || key == _rsfEndLabelKey) &&
          props[key] is! String) {
        return "Bad value for $key. Expected String but got ${props[key]}";
      }
    }
  }

  @override
  String get type => rangeSliderComponentTypeName;
}
