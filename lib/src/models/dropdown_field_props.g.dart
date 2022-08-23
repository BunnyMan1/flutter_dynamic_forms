// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dropdown_field_props.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DropdownComponentProperties _$DropdownComponentPropertiesFromJson(
        Map<String, dynamic> json) =>
    DropdownComponentProperties(
      name: json['name'] as String,
      legend: json['legend'] as String?,
      helperText: json['helper_text'] as String?,
      hintText: json['hint_text'] as String?,
      itemsAlignment: $enumDecodeNullable(
              _$DropdownItemAlignmentEnumMap, json['items_alignment']) ??
          DropdownItemAlignment.center,
      itemLabels: (json['item_labels'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      itemValues: json['item_values'] as List<dynamic>,
      labelColor: json['label_color'] as String? ?? "000000",
      dropdownColor: json['dropdown_color'] as String? ?? "ffffff",
      elevation: (json['elevation'] as num?)?.toDouble() ?? 8,
      isDense: json['is_dense'] as bool? ?? false,
      isExpanded: json['is_expanded'] as bool? ?? false,
      menuMaxHeight: (json['menu_max_height'] as num?)?.toDouble(),
      enableFeedback: json['enable_feedback'] as bool? ?? false,
      isRequired: json['is_required'] as bool? ?? true,
      showError: json['show_error'] as bool? ?? true,
      customErrorText: json['custom_error_text'] as String? ?? '',
      showBorder: json['show_border'] as bool? ?? true,
      borderRadius: (json['border_radius'] as num?)?.toDouble() ?? 8,
      borderWidth: (json['border_width'] as num?)?.toDouble() ?? 1,
      borderColor: json['border_color'] as String? ?? "000000",
    );

Map<String, dynamic> _$DropdownComponentPropertiesToJson(
        DropdownComponentProperties instance) =>
    <String, dynamic>{
      'name': instance.name,
      'legend': instance.legend,
      'helper_text': instance.helperText,
      'hint_text': instance.hintText,
      'items_alignment':
          _$DropdownItemAlignmentEnumMap[instance.itemsAlignment]!,
      'item_labels': instance.itemLabels,
      'item_values': instance.itemValues,
      'label_color': instance.labelColor,
      'dropdown_color': instance.dropdownColor,
      'elevation': instance.elevation,
      'is_dense': instance.isDense,
      'is_expanded': instance.isExpanded,
      'menu_max_height': instance.menuMaxHeight,
      'enable_feedback': instance.enableFeedback,
      'is_required': instance.isRequired,
      'show_error': instance.showError,
      'custom_error_text': instance.customErrorText,
      'show_border': instance.showBorder,
      'border_radius': instance.borderRadius,
      'border_width': instance.borderWidth,
      'border_color': instance.borderColor,
    };

const _$DropdownItemAlignmentEnumMap = {
  DropdownItemAlignment.left: 'left',
  DropdownItemAlignment.center: 'center',
  DropdownItemAlignment.right: 'right',
};
