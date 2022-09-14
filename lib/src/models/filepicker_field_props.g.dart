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
      dialogTitle: json['dialog_title'] as String?,
      allowedExtensions: (json['allowed_extensions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$FilePickerComponentPropertiesToJson(
        FilePickerComponentProperties instance) =>
    <String, dynamic>{
      'name': instance.name,
      'dialog_title': instance.dialogTitle,
      'file_upload_url': instance.fileUploadUrl,
      'file_type': _$FileTypeEnumMap[instance.fileType]!,
      'allowed_extensions': instance.allowedExtensions,
    };

const _$FileTypeEnumMap = {
  FileType.any: 'any',
  FileType.media: 'media',
  FileType.image: 'image',
  FileType.video: 'video',
  FileType.audio: 'audio',
  FileType.custom: 'custom',
};
