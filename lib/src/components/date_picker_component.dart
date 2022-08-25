import 'package:flutter/material.dart';
import 'package:flutter_dynamic_forms/src/common/component_wrapper.dart';
import 'package:flutter_dynamic_forms/src/utilities/helpers.dart';

import '../models/datepicker_field_props.dart';

class DatePickerComponent extends StatelessWidget {
  const DatePickerComponent({
    Key? key,
    required this.onChange,
    required this.properties,
    required this.value,
  }) : super(key: key);

  final dynamic value;
  final Function(dynamic dt) onChange;
  final DatePickerComponentProperties properties;

  @override
  Widget build(BuildContext context) {
    print(" value: $value");
    String dt = "Select Date";
    DateTime firstDate;
    DateTime lastDate;

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
      child: Row(
        children: [
          InkWell(
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
                      properties.initialDate ?? DateTime.now().toIso8601String());
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
            child: Text(
              dt,
            ),
          ),
        ],
      ),
    );
  }
}
