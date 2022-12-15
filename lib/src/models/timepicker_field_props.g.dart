// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timepicker_field_props.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimePickerComponentProperties _$TimePickerComponentPropertiesFromJson(
        Map<String, dynamic> json) =>
    TimePickerComponentProperties(
      name: json['name'] as String,
      label: json['label'] as String? ?? "",
      helperText: json['helper_text'] as String? ?? "",
      textColor: json['text_color'] as String? ?? "000000",
      showBorder: json['show_border'] as bool? ?? true,
      borderColor: json['border_color'] as String? ?? "000000",
      borderWidth: (json['border_width'] as num?)?.toDouble() ?? 1.0,
      borderRadius: (json['border_radius'] as num?)?.toDouble() ?? 8.0,
      showError: json['show_error'] as bool? ?? true,
      customErrorText: json['custom_error_text'] as String?,
      timePickerEntryMode: $enumDecodeNullable(
              _$TimePickerEntryModeEnumMap, json['time_picker_entry_mode']) ??
          TimePickerEntryMode.dial,
      isRequired: json['is_required'] as bool? ?? false,
      pickerCancelText: json['picker_cancel_text'] as String? ?? "cancel",
      placeHolderText: json['place_holder'] as String?,
      pickerSelectText: json['picker_select_text'] as String? ?? "select",
      initialTime: json['initial_time'] as String?,
      hourLabelText: json['hour_label_text'] as String?,
      minuteLabelText: json['minute_label_text'] as String?,
    );

Map<String, dynamic> _$TimePickerComponentPropertiesToJson(
        TimePickerComponentProperties instance) =>
    <String, dynamic>{
      'name': instance.name,
      'label': instance.label,
      'helper_text': instance.helperText,
      'text_color': instance.textColor,
      'show_border': instance.showBorder,
      'border_color': instance.borderColor,
      'border_width': instance.borderWidth,
      'border_radius': instance.borderRadius,
      'initial_time': instance.initialTime,
      'time_picker_entry_mode':
          _$TimePickerEntryModeEnumMap[instance.timePickerEntryMode]!,
      'place_holder': instance.placeHolderText,
      'picker_cancel_text': instance.pickerCancelText,
      'picker_select_text': instance.pickerSelectText,
      'is_required': instance.isRequired,
      'show_error': instance.showError,
      'custom_error_text': instance.customErrorText,
      'hour_label_text': instance.hourLabelText,
      'minute_label_text': instance.minuteLabelText,
    };

const _$TimePickerEntryModeEnumMap = {
  TimePickerEntryMode.dial: 'dial',
  TimePickerEntryMode.input: 'input',
  TimePickerEntryMode.dialOnly: 'dialOnly',
  TimePickerEntryMode.inputOnly: 'inputOnly',
};
