// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datepicker_field_props.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DatePickerComponentProperties _$DatePickerComponentPropertiesFromJson(
        Map<String, dynamic> json) =>
    DatePickerComponentProperties(
      name: json['name'] as String,
      rangePickerMode: json['range_picker_mode'] as bool? ?? false,
      customErrorText: json['custom_error_text'] as String?,
      datePickerEntryMode: $enumDecodeNullable(
              _$DatePickerEntryModeEnumMap, json['date_picker_entry_mode']) ??
          DatePickerEntryMode.calendar,
      initialDatePickerMode: $enumDecodeNullable(
              _$DatePickerModeEnumMap, json['initial_date_picker_mode']) ??
          DatePickerMode.day,
      isRequired: json['is_required'] as bool? ?? false,
      pickerCancelText: json['picker_cancel_text'] as String? ?? "cancel",
      pickerHelpText: json['picker_help_text'] as String?,
      pickerSelectText: json['picker_select_text'] as String? ?? "select",
      firstDate: json['first_date'] as String?,
      initialDate: json['initial_date'] as String?,
      lastDate: json['last_date'] as String?,
    );

Map<String, dynamic> _$DatePickerComponentPropertiesToJson(
        DatePickerComponentProperties instance) =>
    <String, dynamic>{
      'name': instance.name,
      'range_picker_mode': instance.rangePickerMode,
      'initial_date': instance.initialDate,
      'first_date': instance.firstDate,
      'last_date': instance.lastDate,
      'date_picker_entry_mode':
          _$DatePickerEntryModeEnumMap[instance.datePickerEntryMode]!,
      'picker_help_text': instance.pickerHelpText,
      'picker_cancel_text': instance.pickerCancelText,
      'picker_select_text': instance.pickerSelectText,
      'initial_date_picker_mode':
          _$DatePickerModeEnumMap[instance.initialDatePickerMode]!,
      'is_required': instance.isRequired,
      'custom_error_text': instance.customErrorText,
    };

const _$DatePickerEntryModeEnumMap = {
  DatePickerEntryMode.calendar: 'calendar',
  DatePickerEntryMode.input: 'input',
  DatePickerEntryMode.calendarOnly: 'calendarOnly',
  DatePickerEntryMode.inputOnly: 'inputOnly',
};

const _$DatePickerModeEnumMap = {
  DatePickerMode.day: 'day',
  DatePickerMode.year: 'year',
};
