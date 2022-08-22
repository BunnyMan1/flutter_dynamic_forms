import 'package:flutter/material.dart';
import 'package:flutter_dynamic_forms/src/common/component_wrapper.dart';
import 'package:flutter_dynamic_forms/src/utilities/helpers.dart';

import '../models/slider_props.dart';

class SliderComponent extends StatelessWidget {
  const SliderComponent({
    Key? key,
    required this.value,
    required this.onChange,
    required this.properties,
  }) : super(key: key);

  final double value;
  final Function(double? d) onChange;
  final SliderComponentProperties properties;
  @override
  Widget build(BuildContext context) {
    Color aColor = hexStringToColorConverter(properties.activeColor);
    Color iColor = hexStringToColorConverter(properties.inActiveColor);
    Color tColor = hexStringToColorConverter(properties.thumbColor);
    return ComponentWrapper(
      child: Slider(
        value: value,
        onChanged: onChange,
        min: properties.minValue,
        max: properties.maxValue,
        // divisions: properties.divisions,
        activeColor: aColor,
        inactiveColor: iColor,
        thumbColor: tColor,
      ),
    );
  }
}
