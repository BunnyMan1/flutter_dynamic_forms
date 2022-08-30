import 'package:flutter/material.dart';

import '../common/component_wrapper.dart';
import '../models/range_slider_field_props.dart';
import '../utilities/helpers.dart';

/// `DatePickerComponent` is a custom component which renders a range slider field in the form.
class RangeSliderComponent extends StatelessWidget {
  const RangeSliderComponent({
    Key? key,
    required this.rangeValues,
    required this.onChange,
    required this.properties,
  }) : super(key: key);

  /// Range values are considered from the range selected in the slider.
  final RangeValues rangeValues;

  /// callback to 
  final Function(RangeValues? d) onChange;
  final RangeSliderComponentProperties properties;

  @override
  Widget build(BuildContext context) {
    Color? aColor = properties.activeColor != null
        ? hexStringToColorConverter(properties.activeColor!)
        : null;
    Color? iColor = properties.inActiveColor != null
        ? hexStringToColorConverter(properties.inActiveColor!)
        : null;
    return ComponentWrapper(
      title: properties.label.isEmpty ? null : properties.label,
      child: SliderTheme(
        data: const SliderThemeData(
          showValueIndicator: ShowValueIndicator.always,
        ),
        child: RangeSlider(
          values: rangeValues,
          onChanged: onChange,
          activeColor: aColor,
          inactiveColor: iColor,
          divisions: properties.divisions,
          labels: RangeLabels(
            rangeValues.start.toString(),
            rangeValues.end.toString(),
          ),
          min: properties.minValue,
          max: properties.maxValue,
        ),
      ),
    );
  }
}
