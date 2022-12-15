// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filepicker_field_props.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilePickerComponentProperties _$FilePickerComponentPropertiesFromJson(
        Map<String, dynamic> json) =>
    FilePickerComponentProperties(
      name: json['name'] as String,
      fileType: $enumDecodeNullable(_$FileTypeEnumMap, json['file_type']) ??
          FileType.any,
      fileUploadUrl: json['file_upload_url'] as String,
      allowedExtensions: (json['allowed_extensions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      allowMultiple: json['allow_multiple'] as bool? ?? false,
      hintText: json['hint_text'] as String?,
      labelAfterSelection: json['label_after_selection'] as String?,
    );

Map<String, dynamic> _$FilePickerComponentPropertiesToJson(
        FilePickerComponentProperties instance) =>
    <String, dynamic>{
      'name': instance.name,
      'file_upload_url': instance.fileUploadUrl,
      'file_type': _$FileTypeEnumMap[instance.fileType]!,
      'allowed_extensions': instance.allowedExtensions,
      'allow_multiple': instance.allowMultiple,
      'hint_text': instance.hintText,
      'label_after_selection': instance.labelAfterSelection,
    };

const _$FileTypeEnumMap = {
  FileType.any: 'any',
  FileType.media: 'media',
  FileType.image: 'image',
  FileType.video: 'video',
  FileType.audio: 'audio',
  FileType.custom: 'custom',
};
