import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../constants/constants.dart';
import 'base_model.dart';

part 'radio_field_props.g.dart';

@JsonSerializable()
class RadioComponentProperties implements BaseModel {
  //!=======================================================//
  //    Json Keys of the props used by RadioComponent
  //!=======================================================//
  static const String _rfNameKey = 'name';
  static const String _rfHelperTextKey = 'helper_text';
  static const String _rfAlignmentKey = 'alignment';
  static const String _rfLabelsKey = 'labels';
  static const String _rfLabelPositionKey = 'label_position';
  static const String _rfLabelStyleKey = 'label_style';
  static const String _rfValuesKey = 'values';
  static const String _rfPrimaryColorKey = 'primary_color';
  static const String _rfShowBorderKey = 'show_border';
  static const String _rfBorderColorKey = 'border_color';
  static const String _rfRequiredKey = 'required';
  static const String _rfShowErrorKey = 'show_error';
  static const String _rfCustomErrorTextKey = 'custom_error_text';

  //!=======================================================//
  //!=======================================================//

  /// Name of the component for dev use. (Should be set to the key of the json being used to store this component's value in your DB.)
  /// Mandatory parameter, throws error if not specified.
  @override
  @JsonKey(name: _rfNameKey)
  final String name;

  /// Description of the radio field.
  /// Defaults to empty string "".
  @JsonKey(name: _rfHelperTextKey)
  final String helperText;

  /// To align vertically or horizontally.
  /// Defaults to `vertical`.
  @JsonKey(name: _rfAlignmentKey)
  final String alignment;

  /// Different labels radio can have. (show be in order of and as many as values.)
  /// Defaults to empty list [].
  @JsonKey(name: _rfLabelsKey)
  final List<String> labels;

  /// label positioning for the radio field.
  /// Defaults to `left`.
  @JsonKey(name: _rfLabelPositionKey)
  final String labelPosition;

  /// radio can have 3 label styles "normal", "bold", "italic"
  /// Defaults to `normal`.
  @JsonKey(name: _rfLabelStyleKey)
  final String labelStyle;

  /// different values that radio can have, in order.
  /// Defaults to empty list [].
  @JsonKey(name: _rfValuesKey)
  final List<String> values;

  /// Primary color for this field, overwrites color from form options.
  /// Defaults to `ffffff`.
  @JsonKey(name: _rfPrimaryColorKey)
  final String primaryColor;

  /// To show border for the radio field or not.
  /// Defaults to `true`.
  @JsonKey(name: _rfShowBorderKey)
  final bool showBorder;

  /// Border color for the radio field.
  /// Defaults to `000000`.
  @JsonKey(name: _rfBorderColorKey)
  final String borderColor;

  /// If this field is required. (validation)
  /// Defaults to `false`.
  @JsonKey(name: _rfRequiredKey)
  final bool required;

  /// To display errors. (overwrites the value from form options)
  /// Defaults to `true`.
  @JsonKey(name: _rfShowErrorKey)
  final bool showError;

  /// Custom Error text to show.
  /// Defaults to empty string "".
  @JsonKey(name: _rfCustomErrorTextKey)
  final String customErrorText;

  RadioComponentProperties({
    required this.name,
    this.helperText = '',
    this.alignment = 'vertical',
    this.labels = const [],
    this.labelPosition = 'left',
    this.labelStyle = 'normal',
    this.values = const [],
    this.primaryColor = 'ffffff',
    this.showBorder = true,
    this.borderColor = '000000',
    this.required = false,
    this.showError = true,
    this.customErrorText = '',
  });

  @override
  String get type => radioComponentName;

  //Factory constructor.
  /// Creates a TextComponentProps object from given map.
  /// Checks the given map with `TextComponentProps.textFieldPropsChecker` before creating object.
  /// Will throw error with specific message if any invalid value found for valid props.
  /// `name` is a mandatory props. Excluding it will lead to check failing.
  factory RadioComponentProperties.fromMap(Map<String, dynamic> map) {
    var check =
        RadioComponentProperties.radioFieldPropertiesChecker(map, isMap: true);
    if (check is String) throw check;
    return _$RadioComponentPropertiesFromJson(map);
  }

  /// Factory constructor to convert the radio properties JSON object to a map.
  factory RadioComponentProperties.fromJson(String json) {
    Map<String, dynamic> parsed = jsonDecode(json);
    var check = RadioComponentProperties.radioFieldPropertiesChecker(parsed);
    if (check is String) throw check;
    return _$RadioComponentPropertiesFromJson(parsed);
  }

  /// Serializer to convert [RadioComponentProperties] Object to map.
  static Map<String, dynamic> toJson(object) {
    return _$RadioComponentPropertiesToJson(object);
  }

  /// A method to check if the given map is a valid [RadioComponentProperties] object.
  static dynamic radioFieldPropertiesChecker(
    Map<String, dynamic> properties, {
    bool isMap = false,
  }) {
    return true;
  }
}
