import 'package:flutter/material.dart';

import '../common/component_wrapper.dart';
import '../models/radio_field_props.dart';

/// `RadioFieldComponent` is a component that renders a radio field.
class RadioFieldComponent extends StatelessWidget {
  const RadioFieldComponent({
    Key? key,
    required this.properties,
    required this.value,
    this.error,
    this.onChange,
  }) : super(key: key);

  /// `properties` is a [RadioComponentProperties] object that contains all the properties of the component.
  final RadioComponentProperties properties;

  /// `value` is the value of the radio field.
  final dynamic value;

  final String? error;

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
            Row(
              children: [
                if (properties.labelPosition == RadioFieldLabelPosition.left)
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(properties.labels[i]),
                  ),
                Radio<dynamic>(
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
          if (error != null)
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text(
                error!,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.red,
                ),
              ),
            )
        ],
      ),
    );
  }
}
