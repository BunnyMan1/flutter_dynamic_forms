import 'package:flutter/material.dart';
import 'package:flutter_dynamic_forms/src/common/component_wrapper.dart';
import 'package:flutter_dynamic_forms/src/common/read_only_text_widget.dart';
import 'package:flutter_dynamic_forms/src/utilities/helpers.dart';

import '../models/datepicker_field_props.dart';

class DatePickerComponent extends StatelessWidget {
  const DatePickerComponent({
    Key? key,
    required this.onChange,
    required this.properties,
    required this.value,
    this.error,
  }) : super(key: key);

  final dynamic value;
  final Function(dynamic dt) onChange;
  final DatePickerComponentProperties properties;

  /// `error` is a string that contains the error message to be displayed.
  final String? error;

  @override
  Widget build(BuildContext context) {
    String dt = properties.placeHolderText ?? "Select Date";
    DateTime firstDate;
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

      firstDate = DateTime.parse(properties.firstDate ??
          DateTime.now().subtract(const Duration(days: 365)).toIso8601String());
      lastDate = DateTime.parse(properties.lastDate ??
          DateTime.now().add(const Duration(days: 365)).toIso8601String());
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
              initDate =
                  DateTime.parse(properties.initialDate ?? DateTime.now().toIso8601String());
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
        iconData: const IconData(
          0xf06bb,
          fontFamily: 'MaterialIcons',
        ),
      ),
      //  TextField(
      //   readOnly: true,
      //   controller: TextEditingController(text: dt),
      //   onTap: () async {
      //     if (properties.rangePickerMode) {
      //       var dr = await showDateRangePicker(
      //         context: context,
      //         firstDate: firstDate,
      //         lastDate: lastDate,
      //       );
      //       onChange(dr);
      //     } else {
      //       DateTime initDate;

      //       try {
      //         initDate = DateTime.parse(
      //             properties.initialDate ?? DateTime.now().toIso8601String());
      //       } catch (e) {
      //         throw "Bad Date Format found for initial_date: ${properties.initialDate}. Error s: $e";
      //       }
      //       var dt = await showDatePicker(
      //         context: context,
      //         initialDate: initDate,
      //         firstDate: firstDate,
      //         lastDate: lastDate,
      //       );
      //       onChange(dt);
      //     }
      //   },
      //   decoration: InputDecoration(
      //     prefixIcon: const Icon(
      //       IconData(
      //         0xf06bb,
      //         fontFamily: 'MaterialIcons',
      //       ),
      //     ),
      //     helperText: properties.placeHolderText,
      //     errorText: error,
      //     hintText: properties.placeHolderText,
      //     labelText: properties.label,
      //     labelStyle: TextStyle(
      //       color: textColor.withOpacity(0.8),
      //     ),
      //     border: properties.showBorder
      //         ? OutlineInputBorder(
      //             borderRadius: BorderRadius.circular(properties.borderRadius),
      //             borderSide: BorderSide(
      //               color: borderColor,
      //               width: properties.borderWidth,
      //             ),
      //           )
      //         : null,
      //     enabledBorder: properties.showBorder
      //         ? OutlineInputBorder(
      //             borderRadius: BorderRadius.circular(
      //               properties.borderRadius,
      //             ),
      //             borderSide: BorderSide(
      //               color: borderColor,
      //               width: properties.borderWidth,
      //             ),
      //           )
      //         : null,
      //     focusedBorder: properties.showBorder
      //         ? OutlineInputBorder(
      //             borderRadius: BorderRadius.circular(properties.borderRadius),
      //             borderSide: BorderSide(
      //               color: borderColor,
      //               width: properties.borderWidth,
      //             ),
      //           )
      //         : null,
      //   ),
      // ),
    );
  }
}
