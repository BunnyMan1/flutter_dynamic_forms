// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datepicker_field_props.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DatePickerComponentProperties _$DatePickerComponentPropertiesFromJson(
        Map<String, dynamic> json) =>
    DatePickerComponentProperties(
      name: json['name'] as String,
      label: json['label'] as String? ?? "",
      helperText: json['helper_text'] as String? ?? "",
      textColor: json['text_color'] as String? ?? "000000",
      showBorder: json['show_border'] as bool? ?? true,
      borderColor: json['border_color'] as String? ?? "000000",
      borderWidth: (json['border_width'] as num?)?.toDouble() ?? 1.0,
      borderRadius: (json['border_radius'] as num?)?.toDouble() ?? 8.0,
      rangePickerMode: json['is_range_picker_mode'] as bool? ?? false,
      showError: json['show_error'] as bool? ?? true,
      customErrorText: json['custom_error_text'] as String?,
      datePickerEntryMode: $enumDecodeNullable(
              _$DatePickerEntryModeEnumMap, json['date_picker_entry_mode']) ??
          DatePickerEntryMode.calendar,
      isRequired: json['is_required'] as bool? ?? false,
      pickerCancelText: json['picker_cancel_text'] as String? ?? "cancel",
      placeHolderText: json['place_holder'] as String?,
      pickerSelectText: json['picker_select_text'] as String? ?? "select",
      firstDate: json['first_date'] as String?,
      initialDate: json['initial_date'] as String?,
      lastDate: json['last_date'] as String?,
    );

Map<String, dynamic> _$DatePickerComponentPropertiesToJson(
        DatePickerComponentProperties instance) =>
    <String, dynamic>{
      'name': instance.name,
      'label': instance.label,
      'helper_text': instance.helperText,
      'text_color': instance.textColor,
      'show_border': instance.showBorder,
      'border_color': instance.borderColor,
      'border_width': instance.borderWidth,
      'border_radius': instance.borderRadius,
      'is_range_picker_mode': instance.rangePickerMode,
      'initial_date': instance.initialDate,
      'first_date': instance.firstDate,
      'last_date': instance.lastDate,
      'date_picker_entry_mode':
          _$DatePickerEntryModeEnumMap[instance.datePickerEntryMode]!,
      'place_holder': instance.placeHolderText,
      'picker_cancel_text': instance.pickerCancelText,
      'picker_select_text': instance.pickerSelectText,
      'is_required': instance.isRequired,
      'show_error': instance.showError,
      'custom_error_text': instance.customErrorText,
    };

const _$DatePickerEntryModeEnumMap = {
  DatePickerEntryMode.calendar: 'calendar',
  DatePickerEntryMode.input: 'input',
  DatePickerEntryMode.calendarOnly: 'calendarOnly',
  DatePickerEntryMode.inputOnly: 'inputOnly',
};
