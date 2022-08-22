import 'package:flutter/material.dart';

import '../common/component_wrapper.dart';
import '../models/checkbox_field_props.dart';

/// `CheckBoxFieldComponent` is a component that renders a radio field.
class CheckBoxFieldComponent extends StatelessWidget {
  const CheckBoxFieldComponent({
    Key? key,
    required this.properties,
    required this.value,
    // required this.selectedValues,
    this.error,
    this.onChange,
  }) : super(key: key);

  /// `properties` is a [CheckBoxComponentProperties] object that contains all the properties of the component.
  final CheckBoxComponentProperties properties;

  /// `value` is the value of the checkbox field.
  final dynamic value;

  /// `selectedValues` are the selected values of the checkbox field.
  // final List<dynamic> selectedValues;
  final String? error;

  /// `onChange` is a function that is called when the value of the radio field is changed.
  final Function(dynamic s)? onChange;

  @override
  Widget build(BuildContext context) {
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
                if (properties.labelPosition == CheckBoxFieldLabelPosition.left)
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(properties.labels[i]),
                  ),
                Checkbox(
                  value: value.contains(properties.values[i]),
                  onChanged: (value) {
                    if (onChange != null) {
                      // onChange!(value!);
                      // NOTE: Since value is a list, we need to add or remove the value from the list.
                      //TODO: Cross check this logic
                      onChange!(properties.values[i]);
                    }
                  },
                ),
                if (properties.labelPosition ==
                    CheckBoxFieldLabelPosition.right)
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
            ),
        ],
      ),
    );
  }
}
