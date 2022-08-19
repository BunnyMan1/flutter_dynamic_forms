import 'package:flutter/material.dart';

import '../common/component_wrapper.dart';
import '../models/radio_field_props.dart';

/// `RadioFieldComponent` is a component that renders a radio field.
class RadioFieldComponent extends StatelessWidget {
  RadioFieldComponent({
    Key? key,
    required this.props,
    required this.value,
    this.onChange,
  }) : super(key: key);

  /// `props` is a [RadioComponentProperties] object that contains all the properties of the component.
  final RadioComponentProperties props;

  final dynamic value;

  /// `onChange` is a function that is called when the value of the radio field is changed.
  final Function(String s)? onChange;

  @override
  Widget build(BuildContext context) {
    // Color c = hexStringToColorConverter(props.textColor);
    return ComponentWrapper(
      title: props.name,
      description: props.helperText,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          for (int i = 0; i < props.labels.length; i++)
            RadioListTile<String>(
              title: Text(props.labels[i]),
              value: props.values[i],
              selected: value == props.values[i],
              groupValue: value,
              onChanged: (String? value) {
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
