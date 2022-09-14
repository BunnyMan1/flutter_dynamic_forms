// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:json_annotation/json_annotation.dart';

import '../constants/constants.dart';
import 'base_model.dart';

part 'filepicker_field_props.g.dart';

@JsonSerializable()
class FilePickerComponentProperties implements BaseModel {
  @override
  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'dialog_title')
  final String? dialogTitle;

  @JsonKey(name: 'file_upload_url')
  final String fileUploadUrl;

  @JsonKey(name: 'file_type')
  final FileType fileType;

  @JsonKey(name: 'allowed_extensions')
  final List<String>? allowedExtensions;

  FilePickerComponentProperties({
    required this.name,
    this.fileType = FileType.any,
    required this.fileUploadUrl,
    this.dialogTitle,
    this.allowedExtensions,
  });

  //Factory constructor.
  /// Creates a FilePickerComponentProperties object from given map.
  /// Checks the given map with `FilePickerComponentProperties.propertiesChecker` before creating object.
  /// Will throw error with specific message if any invalid value found for valid props.
  /// `name` is a mandatory props. Excluding it will lead to check failing.
  factory FilePickerComponentProperties.fromMap(Map<String, dynamic> map) {
    var check = FilePickerComponentProperties.propertiesChecker(
      map,
      isMap: true,
    );
    if (check is String) throw check;
    return _$FilePickerComponentPropertiesFromJson(map);
  }

  /// Factory constructor to convert the DatePicker properties JSON object to a map.
  factory FilePickerComponentProperties.fromJson(String json) {
    Map<String, dynamic> parsed = jsonDecode(json);
    var check = FilePickerComponentProperties.propertiesChecker(parsed);
    if (check is String) throw check;
    return _$FilePickerComponentPropertiesFromJson(parsed);
  }

  static dynamic propertiesChecker(
    Map<String, dynamic> props, {
    bool isMap = false,
  }) {}

  @override
  String get type => filePickerComponentTypeName;
}
