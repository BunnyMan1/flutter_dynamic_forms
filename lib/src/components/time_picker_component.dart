import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/component_wrapper.dart';
import '../common/read_only_text_widget.dart';
import '../models/timepicker_field_props.dart';
import '../utilities/helpers.dart';

/// TimePickerComponent is a component that renders a time picker field.
class TimePickerComponent extends StatelessWidget {
  const TimePickerComponent({
    Key? key,
    required this.onChange,
    required this.properties,
    required this.value,
    this.error,
  }) : super(key: key);

  /// Value of the time picker
  final dynamic value;

  /// A callback when timepicker component changes it's value.
  final Function(dynamic dt) onChange;

  /// Time picker component's properties.
  final TimePickerComponentProperties properties;

  /// `error` is a string that contains the error message to be displayed.
  final String? error;

  @override
  Widget build(BuildContext context) {
    String defaultPlaceHolder = "Select Time";

    /// Display the selected time. If the selected time is null then show placeholder text defined
    /// in JSON or the map.
    ///
    /// If even the placeholder text is not defined or null, then display the default text:
    /// "Select Time"
    String selectedTime =
        value ?? properties.placeHolderText ?? defaultPlaceHolder;

    /// textColor field from the properties is converted from string to color.
    Color textColor = hexStringToColorConverter(properties.textColor);

    /// borderColor field from the properties is converted from string to color.
    Color borderColor = hexStringToColorConverter(properties.borderColor);

    return ComponentWrapper(
      child: ReadOnlyTextFieldWidget(
        onTap: () async {
          TimeOfDay startTime;
          List<String> splitValue;
          TimeOfDay? timeOfDayValue;
          try {
            startTime = timeOfDayValue ??
                TimeOfDay(
                  hour: int.parse(
                      (properties.initialTime ?? "09:00").split(":")[0]),
                  minute: int.parse(
                      (properties.initialTime ?? "09:00").split(":")[1]),
                );
          } catch (e) {
            throw "Bad Date Format found for initial_date: ${properties.initialTime}. Error s: $e";
          }
          if (value != null) {
            splitValue = value.toString().split(" ")[0].split(":");
            if (value.toString().split(" ")[1] == "AM") {
              timeOfDayValue = TimeOfDay(
                hour: int.parse(splitValue[0]),
                minute: int.parse(splitValue[1]),
              );
            } else if (value.toString().split(" ")[1] == "PM") {
              timeOfDayValue = TimeOfDay(
                hour: int.parse(splitValue[0]) + 12,
                minute: int.parse(splitValue[1]),
              );
            } else {
              timeOfDayValue = null;
            }
          }
          TimeOfDay? time;
          if (Platform.isAndroid) {
            time ??
                await showTimePicker(
                  context: context,
                  initialTime: timeOfDayValue ?? startTime,
                  confirmText: properties.pickerSelectText,
                  cancelText: properties.pickerCancelText,
                  hourLabelText: properties.hourLabelText,
                  minuteLabelText: properties.minuteLabelText,
                ).then((value) {
                  if (value == null) return null;
                  time = value;
                  return time;
                });
          } else if (Platform.isIOS) {
            await showCupertinoModalPopup(
              context: context,
              builder: (context) {
                return Material(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 24,
                      bottom: 32,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CupertinoTimerPicker(
                          onTimerDurationChanged: (t) {
                            var temp = t.toString().split(":");
                            time = TimeOfDay(
                              hour: int.parse(temp[0]),
                              minute: int.parse(temp[1]),
                            );
                          },
                          mode: CupertinoTimerPickerMode.hm,
                          initialTimerDuration: timeOfDayValue == null
                              ? Duration(
                                  hours: startTime.hour,
                                  minutes: startTime.minute,
                                )
                              : Duration(
                                  hours: timeOfDayValue.hour,
                                  minutes: timeOfDayValue.minute,
                                ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }

          String? s;
          //TODO: Resolve this ignore
          // ignore: use_build_context_synchronously
          s = time?.format(context);
          if (s != null) {
            onChange(s);
          }
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
        prefixIconData: const IconData(
          0xe6cf,
          fontFamily: 'MaterialIcons',
        ),
      ),
    );
  }
}
