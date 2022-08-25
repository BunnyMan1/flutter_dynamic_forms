import 'package:flutter/material.dart';

import '../common/component_wrapper.dart';
import '../models/slider_field_props.dart';
import '../utilities/helpers.dart';

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
    Color? aColor = properties.activeColor != null
        ? hexStringToColorConverter(properties.activeColor!)
        : null;
    Color? iColor = properties.inActiveColor != null
        ? hexStringToColorConverter(properties.inActiveColor!)
        : null;
    Color? tColor = properties.thumbColor != null
        ? hexStringToColorConverter(properties.thumbColor!)
        : null;
    return ComponentWrapper(
      child: SliderTheme(
        data: const SliderThemeData(
          showValueIndicator: ShowValueIndicator.always
        ),
        child: Slider(
          label: value.toString(),
          value: value,
          onChanged: onChange,
          min: properties.minValue,
          max: properties.maxValue,
          divisions: properties.divisions,
          activeColor: aColor,
          inactiveColor: iColor,
          thumbColor: tColor,
        ),
      ),
    );
  }
}
