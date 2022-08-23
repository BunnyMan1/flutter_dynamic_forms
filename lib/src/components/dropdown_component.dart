//TODO: Remove 'component' from the file names under components folder

import 'package:flutter/material.dart';

import '../common/component_wrapper.dart';
import '../models/dropdown_field_props.dart';
import '../utilities/helpers.dart';

/// `DropdownFieldComponent` is a component that renders a dropdown field.
class DropdownFieldComponent extends StatelessWidget {
  const DropdownFieldComponent({
    Key? key,
    required this.properties,
    required this.value,
    this.error,
    this.onChange,
  }) : super(key: key);

  /// `properties` is a [DropdownComponentProperties] object that contains all the properties of the component.
  final DropdownComponentProperties properties;

  /// `value` is the value of the dropdown field.
  final dynamic value;

  /// `error` to be displayed.
  final String? error;

  /// `onChange` is a function that is called when the value of the dropdown field is changed.
  final Function(dynamic s)? onChange;

  @override
  Widget build(BuildContext context) {
    /// borderColor field from the properties is converted from string to color.
    Color borderColor = hexStringToColorConverter(properties.borderColor);
    return ComponentWrapper(
      title: properties.legend,
      description: properties.helperText,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          DropdownButtonFormField<dynamic>(
            decoration: InputDecoration(
              helperText: properties.helperText,
              errorText: error,
              hintText: properties.hintText,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 8,
              ),
              errorStyle: const TextStyle(
                fontSize: 12.0,
                color: Colors.red,
              ),
              border: properties.showBorder
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        properties.borderRadius,
                      ),
                      borderSide: BorderSide(
                        color: borderColor,
                        width: properties.borderWidth,
                      ),
                    )
                  : null,
              enabledBorder: properties.showBorder
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        properties.borderRadius,
                      ),
                      borderSide: BorderSide(
                        color: borderColor,
                        width: properties.borderWidth,
                      ),
                    )
                  : null,
              focusedBorder: properties.showBorder
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        properties.borderRadius,
                      ),
                      borderSide: BorderSide(
                        color: borderColor,
                        width: properties.borderWidth,
                      ),
                    )
                  : null,
            ),
            hint: properties.hintText != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text("${properties.hintText}"),
                  )
                : null,
            value: value,
            isDense: properties.isDense,
            isExpanded: properties.isExpanded,
            items: [
              for (int i = 0; i < properties.itemLabels.length; i++)
                DropdownMenuItem(
                  value: properties.itemLabels[i],
                  child: Text(properties.itemLabels[i]),
                ),
            ],
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
