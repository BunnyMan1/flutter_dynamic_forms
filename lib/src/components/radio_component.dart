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
      title: properties.name,
      description: properties.helperText,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          for (int i = 0; i < properties.labels.length; i++)
            RadioListTile<dynamic>(
              contentPadding: const EdgeInsets.all(0),
              title: Text(properties.labels[i]),
              value: properties.values[i],
              selected: value == properties.values[i],
              groupValue: value,
              onChanged: (value) {
                if (onChange != null) {
                  onChange!(value!);
                }
              },
            ),
        ],
      ),
    );
  }
}
