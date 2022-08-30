import 'package:flutter/material.dart';
import 'package:flutter_dynamic_forms/src/common/component_wrapper.dart';
import 'package:flutter_dynamic_forms/src/common/read_only_text_widget.dart';
import 'package:flutter_dynamic_forms/src/models/timepicker_field_props.dart';
import 'package:flutter_dynamic_forms/src/utilities/helpers.dart';

class TimePickerComponent extends StatelessWidget {
  const TimePickerComponent({
    Key? key,
    required this.onChange,
    required this.properties,
    required this.value,
    this.error,
  }) : super(key: key);

  final dynamic value;
  final Function(dynamic dt) onChange;
  final TimePickerComponentProperties properties;

  /// `error` is a string that contains the error message to be displayed.
  final String? error;

  @override
  Widget build(BuildContext context) {
    String selectedTime = value ?? "Select Time";

    /// textColor field from the properties is converted from string to color.
    Color textColor = hexStringToColorConverter(properties.textColor);

    /// borderColor field from the properties is converted from string to color.
    Color borderColor = hexStringToColorConverter(properties.borderColor);

    try {
      if (value != null && value is DateTime) {
        selectedTime = formattedDate(value);
      } else if (value != null && value is DateTimeRange) {
        var v = value as DateTimeRange;
        selectedTime = "${formattedDate(v.start)} - ${formattedDate(v.end)}";
      }
    } catch (e) {
      throw "Bad Date Format found $value : $e";
    }
    return ComponentWrapper(
      child: ReadOnlyTextFieldWidget(
        onTap: () async {
          TimeOfDay startTime;

          try {
            startTime = TimeOfDay(
                hour: int.parse((properties.initialTime ?? "09:00").split(":")[0]),
                minute: int.parse((properties.initialTime ?? "09:00").split(":")[1]));
          } catch (e) {
            throw "Bad Date Format found for initial_date: ${properties.initialTime}. Error s: $e";
          }
          var time = await showTimePicker(
            context: context,
            initialTime: startTime,
            confirmText: properties.pickerSelectText,
            cancelText: properties.pickerCancelText,
            hourLabelText: properties.hourLabelText,
            minuteLabelText: properties.minuteLabelText,
          );
          //TODO: take care of async contexts.
          // ignore: use_build_context_synchronously
          String? s = time?.format(context);
          onChange(s);
        },
        borderColor: borderColor,
        borderRadius: properties.borderRadius,
        borderWidth: properties.borderWidth,
        showBorder: properties.showBorder,
        text: selectedTime,
        textColor: textColor,
        labelText: properties.label,
        hintText: properties.placeHolderText,
        errorText: error,
        helperText: properties.helperText,
        iconData: const IconData(
          0xe6cf,
          fontFamily: 'MaterialIcons',
        ),
      ),
    );
  }
}
