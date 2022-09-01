import 'package:flutter/material.dart';

import '../common/component_wrapper.dart';
import '../models/range_slider_field_props.dart';
import '../utilities/helpers.dart';

/// `RangeSliderComponent` is a custom component which renders a range slider field in the form.
class RangeSliderComponent extends StatelessWidget {
  const RangeSliderComponent({
    Key? key,
    required this.rangeValues,
    required this.onChange,
    required this.properties,
  }) : super(key: key);

  /// Range values are considered from the range selected in the slider.
  final RangeValues rangeValues;

  /// A callback function triggered when the component's value change.
  final Function(RangeValues? d) onChange;

  /// Properties of the component.
  final RangeSliderComponentProperties properties;

  @override
  Widget build(BuildContext context) {
    /// Active color of the range slider component
    Color? aColor = properties.activeColor != null
        ? hexStringToColorConverter(properties.activeColor!)
        : null;

    /// Inactive color of the range slider component
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
