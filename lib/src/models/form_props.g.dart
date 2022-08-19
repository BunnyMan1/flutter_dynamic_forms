// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_props.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FormProps _$FormPropsFromJson(Map<String, dynamic> json) => FormProps(
      title: json['title'] as String? ?? "",
      description: json['description'] as String? ?? "",
      autoShowErrors: json['auto_show_errors'] as bool? ?? true,
      primaryColor: json['primary_color'] as String? ?? "000000",
      backgroundColor: json['background_color'] as String? ?? "ffffff",
      formItemVerticalMarging:
          (json['form_item_vertical_marging'] as num?)?.toDouble() ?? 12.0,
      numberOfPages: json['number_of_pages'] as int? ?? 1,
      showResetButton: json['show_reset_button'] as bool? ?? true,
      labelAlignment:
          $enumDecodeNullable(_$AlignmentEnumMap, json['label_alignment']) ??
              Alignment.left,
      labelPosition:
          $enumDecodeNullable(_$PositionEnumMap, json['label_position']) ??
              Position.top,
      locale: json['locale'] as String? ?? 'en',
      size:
          $enumDecodeNullable(_$SizeEnumMap, json['size']) ?? Size.defaultLarge,
    );

Map<String, dynamic> _$FormPropsToJson(FormProps instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'number_of_pages': instance.numberOfPages,
      'primary_color': instance.primaryColor,
      'background_color': instance.backgroundColor,
      'form_item_vertical_marging': instance.formItemVerticalMarging,
      'auto_show_errors': instance.autoShowErrors,
      'show_reset_button': instance.showResetButton,
      'locale': instance.locale,
      'size': _$SizeEnumMap[instance.size]!,
      'label_position': _$PositionEnumMap[instance.labelPosition]!,
      'label_alignment': _$AlignmentEnumMap[instance.labelAlignment]!,
    };

const _$AlignmentEnumMap = {
  Alignment.left: 'left',
  Alignment.right: 'right',
};

const _$PositionEnumMap = {
  Position.left: 'left',
  Position.right: 'right',
  Position.top: 'top',
  Position.bottom: 'bottom',
};

const _$SizeEnumMap = {
  Size.mini: 'mini',
  Size.small: 'small',
  Size.medium: 'medium',
  Size.defaultLarge: 'defaultLarge',
};
