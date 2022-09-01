import 'package:flutter/material.dart';

import '../common/component_wrapper.dart';
import '../common/read_only_text_widget.dart';
import '../models/datepicker_field_props.dart';
import '../utilities/helpers.dart';

/// `DatePickerComponent` is a custom component which renders a date picker field in the form.
class DatePickerComponent extends StatelessWidget {
  const DatePickerComponent({
    Key? key,
    required this.onChange,
    required this.properties,
    required this.value,
    this.error,
  }) : super(key: key);

  /// Value of the selected date or date range according the properties
  final dynamic value;

  /// A callback function for any changes in the component
  final Function(dynamic dt) onChange;

  /// Datepicker component related properties
  final DatePickerComponentProperties properties;

  /// `error` is a string that contains the error message to be displayed.
  final String? error;

  @override
  Widget build(BuildContext context) {
    /// Display the placeholder text if passed or else "Select Date"
    String dt = properties.placeHolderText ?? "Select Date";

    /// First date is the starting date when daterange is considered.
    DateTime firstDate;

    /// Last date is the ending date when daterange is considered.
    DateTime lastDate;

    /// textColor field from the properties is converted from string to color.
    Color textColor = hexStringToColorConverter(properties.textColor);

    /// borderColor field from the properties is converted from string to color.
    Color borderColor = hexStringToColorConverter(properties.borderColor);

    try {
      if (value != null && value is DateTime) {
        dt = formattedDate(value);
      } else if (value != null && value is DateTimeRange) {
        var v = value as DateTimeRange;
        dt = "${formattedDate(v.start)} - ${formattedDate(v.end)}";
      }

      firstDate = DateTime.parse(
        properties.firstDate ??
            DateTime.now()
                .subtract(const Duration(days: 365))
                .toIso8601String(),
      );
      lastDate = DateTime.parse(
        properties.lastDate ??
            DateTime.now().add(const Duration(days: 365)).toIso8601String(),
      );
    } catch (e) {
      throw "Bad Date Format found $value : $e";
    }
    return ComponentWrapper(
      child: ReadOnlyTextFieldWidget(
        onTap: () async {
          if (properties.rangePickerMode) {
            var dr = await showDateRangePicker(
              context: context,
              firstDate: firstDate,
              lastDate: lastDate,
            );
            onChange(dr);
          } else {
            DateTime initDate;

            try {
              initDate = DateTime.parse(
                properties.initialDate ?? DateTime.now().toIso8601String(),
              );
            } catch (e) {
              throw "Bad Date Format found for initial_date: ${properties.initialDate}. Error s: $e";
            }
            var dt = await showDatePicker(
              context: context,
              initialDate: initDate,
              firstDate: firstDate,
              lastDate: lastDate,
            );
            onChange(dt);
          }
        },
        borderColor: borderColor,
        borderRadius: properties.borderRadius,
        borderWidth: properties.borderWidth,
        showBorder: properties.showBorder,
        text: dt,
        textColor: textColor,
        labelText: properties.label,
        hintText: properties.placeHolderText,
        errorText: error,
        helperText: properties.helperText,
        prefixIconData: const IconData(
          0xf06bb,
          fontFamily: 'MaterialIcons',
        ),
      ),
    );
  }
}
