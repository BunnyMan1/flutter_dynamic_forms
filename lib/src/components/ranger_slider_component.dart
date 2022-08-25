import 'package:flutter/material.dart';
import 'package:flutter_dynamic_forms/src/common/component_wrapper.dart';
import 'package:flutter_dynamic_forms/src/models/range_slider_field_props.dart';

import '../utilities/helpers.dart';

class RangeSliderComponent extends StatelessWidget {
  const RangeSliderComponent({
    Key? key,
    required this.rangeValues,
    required this.onChange,
    required this.properties,
  }) : super(key: key);

  final RangeValues rangeValues;
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
      child: RangeSlider(
        values: rangeValues,
        onChanged: onChange,
        activeColor: aColor,
        inactiveColor: iColor,
        divisions: properties.divisions,
        labels: RangeLabels(properties.startLabel, properties.endLabel),
        min: properties.minValue,
        max: properties.maxValue,
      ),
    );
  }
}
