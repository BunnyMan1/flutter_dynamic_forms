import 'package:flutter/material.dart';

import '../common/component_wrapper.dart';
import '../models/radio_field_props.dart';

/// `RadioFieldComponent` is a component that renders a radio field.
class RadioFieldComponent extends StatelessWidget {
  const RadioFieldComponent({
    Key? key,
    required this.properties,
    required this.value,
    this.onChange,
  }) : super(key: key);

  /// `properties` is a [RadioComponentProperties] object that contains all the properties of the component.
  final RadioComponentProperties properties;

  /// `value` is the value of the radio field.
  final dynamic value;

  /// `onChange` is a function that is called when the value of the radio field is changed.
  final Function(dynamic s)? onChange;

  @override
  Widget build(BuildContext context) {
    // Color c = hexStringToColorConverter(props.textColor);
    return ComponentWrapper(
      title: properties.legend,
      description: properties.helperText,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          for (int i = 0; i < properties.labels.length; i++)
            // RadioListTile<dynamic>(
            //   contentPadding: const EdgeInsets.all(0),
            //   title: Text(properties.labels[i]),
            //   value: properties.values[i],
            //   selected: value == properties.values[i],
            //   groupValue: value,
            //   onChanged: (value) {
            //     if (onChange != null) {
            //       onChange!(value!);
            //     }
            //   },
            // ),

            Row(
              children: [
                if (properties.labelPosition == RadioFieldLabelPosition.left)
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(properties.labels[i]),
                  ),
                Radio<dynamic>(
                  // contentPadding: EdgeInsets.zero,
                  value: properties.values[i],
                  groupValue: value,
                  // selected: value == properties.values[i],
                  onChanged: (value) {
                    if (onChange != null) {
                      onChange!(value!);
                    }
                  },
                ),
                if (properties.labelPosition == RadioFieldLabelPosition.right)
                  Text(properties.labels[i]),
              ],
            ),
        ],
      ),
    );
  }
}

class RadioFieldTile extends StatelessWidget {
  final String title;
  final dynamic value;
  final dynamic groupValue;
  final Function(dynamic s)? onChange;
  final String labelPosition;
  final String label;

  const RadioFieldTile(
      {Key? key,
      required this.title,
      required this.value,
      required this.groupValue,
      required this.onChange,
      required this.labelPosition,
      required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (labelPosition == 'left') Text(title),
        if (labelPosition == 'left') const SizedBox(width: 20),
        Radio(
          value: value == groupValue,
          groupValue: groupValue,
          onChanged: (value) {
            if (onChange != null) {
              onChange!(value!);
            }
          },
        ),
        if (labelPosition == 'right') const SizedBox(width: 20),
        if (labelPosition == 'right') Text(title),
      ],
    );
  }
}
