// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multiselect_dropdown_field_props.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MultiSelectDropdownComponentProperties
    _$MultiSelectDropdownComponentPropertiesFromJson(
            Map<String, dynamic> json) =>
        MultiSelectDropdownComponentProperties(
          name: json['name'] as String,
          legend: json['legend'] as String?,
          helperText: json['helper_text'] as String?,
          hintText: json['hint_text'] as String?,
          itemLabels: (json['item_labels'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
          itemValues: json['item_values'] as List<dynamic>,
          labelColor: json['label_color'] as String? ?? "000000",
          dropdownColor: json['dropdown_color'] as String? ?? "ffffff",
          isDense: json['is_dense'] as bool? ?? false,
          isRequired: json['is_required'] as bool? ?? true,
          showError: json['show_error'] as bool? ?? true,
          customErrorText: json['custom_error_text'] as String? ?? '',
          showBorder: json['show_border'] as bool? ?? true,
          borderRadius: (json['border_radius'] as num?)?.toDouble() ?? 8,
          borderWidth: (json['border_width'] as num?)?.toDouble() ?? 1,
          borderColor: json['border_color'] as String? ?? "000000",
          chipColor: json['chipColor'] as String? ?? "000000",
          chipIconColor: json['chipIconColor'] as String? ?? "ffffff",
          chipTextColor: json['chipTextColor'] as String? ?? "ffffff",
        );

Map<String, dynamic> _$MultiSelectDropdownComponentPropertiesToJson(
        MultiSelectDropdownComponentProperties instance) =>
    <String, dynamic>{
      'name': instance.name,
      'legend': instance.legend,
      'helper_text': instance.helperText,
      'hint_text': instance.hintText,
      'item_labels': instance.itemLabels,
      'item_values': instance.itemValues,
      'label_color': instance.labelColor,
      'dropdown_color': instance.dropdownColor,
      'is_dense': instance.isDense,
      'is_required': instance.isRequired,
      'show_error': instance.showError,
      'custom_error_text': instance.customErrorText,
      'show_border': instance.showBorder,
      'border_radius': instance.borderRadius,
      'border_width': instance.borderWidth,
      'border_color': instance.borderColor,
      'chipColor': instance.chipColor,
      'chipTextColor': instance.chipTextColor,
      'chipIconColor': instance.chipIconColor,
    };
