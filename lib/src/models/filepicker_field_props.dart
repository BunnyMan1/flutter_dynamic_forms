// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:json_annotation/json_annotation.dart';

import '../constants/constants.dart';
import 'base_model.dart';

part 'filepicker_field_props.g.dart';

@JsonSerializable()
class FilePickerComponentProperties implements BaseModel {
  //!=======================================================//
  //    Json Keys of the props used by TimePickerComponent
  //!=======================================================//
  static const String _fpfTypeKey = "type";
  static const String _fpfNameKey = "name";
  static const String _fpfFileUploadUrlKey = "file_upload_url";
  static const String _fpfFileTypeKey = "file_type";
  static const String _fpfAllowedExtensionsKey = "allowed_extensions";
  static const String _fpfAllowMultipleKey = "allow_multiple";
  static const String _fpfHintTextKey = "hint_text";
  static const String _fpfLabelAfterSelectionKey = "label_after_selection";

  //!=======================================================//
  //!=======================================================//

  @override
  @JsonKey(name: _fpfNameKey)
  final String name;

  @JsonKey(name: _fpfFileUploadUrlKey)
  final String fileUploadUrl;

  @JsonKey(name: _fpfFileTypeKey)
  final FileType fileType;

  @JsonKey(name: _fpfAllowedExtensionsKey)
  final List<String>? allowedExtensions;

  /// Setting to true will allow multiple files to be selected.
  /// Set to false by default.
  @JsonKey(name: _fpfAllowMultipleKey)
  final bool allowMultiple;

  @JsonKey(name: _fpfHintTextKey)
  final String? hintText;

  @JsonKey(name: _fpfLabelAfterSelectionKey)
  final String? labelAfterSelection;

  FilePickerComponentProperties({
    required this.name,
    this.fileType = FileType.any,
    required this.fileUploadUrl,
    this.allowedExtensions,
    this.allowMultiple = false,
    this.hintText,
    this.labelAfterSelection,
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

  /// Factory constructor to convert the FilePicker properties JSON object to a map.
  factory FilePickerComponentProperties.fromJson(String json) {
    Map<String, dynamic> parsed = jsonDecode(json);
    var check = FilePickerComponentProperties.propertiesChecker(parsed);
    if (check is String) throw check;
    return _$FilePickerComponentPropertiesFromJson(parsed);
  }

  static dynamic propertiesChecker(
    Map<String, dynamic> props, {
    bool isMap = false,
  }) {
    if (!isMap &&
        (props[_fpfTypeKey] is! String || props[_fpfTypeKey] != filePickerComponentTypeName)) {
      // If the type is not a string or is not a FilePicker component type.
      return 'Bad value for "$_fpfTypeKey".Expected "$filePickerComponentTypeName" but got "${props[_fpfTypeKey]}".';
    }

    if (props[_fpfNameKey] is! String) {
      // If the type is not a string.
      return 'bad value for "$_fpfNameKey".Expected String but got "${props[_fpfNameKey]}".';
    }

    if (props[_fpfFileUploadUrlKey] is! String) {
      return 'bad value for "$_fpfFileUploadUrlKey".Expected a valid URL String but got "${props[_fpfFileUploadUrlKey]}".';
    }

    if (!(props[_fpfFileUploadUrlKey] as String).contains('https://') &&
        !(props[_fpfFileUploadUrlKey] as String).contains('http://')) {
      return "Badly formatted URL recieved : ${props[_fpfFileUploadUrlKey]}";
    }

    for (var key in props.keys) {
      if ((key == _fpfFileTypeKey) && (props[key] is! FileType)) {
        return "bad value for $key: ${props[key]} expected a FileType (enum).";
      }

      if ((key == _fpfAllowedExtensionsKey) && (props[key] is! List<String>)) {
        return "bad value for $key: ${props[key]} expected a List of strings.";
      }

      if (key == _fpfAllowMultipleKey && props[key] is! bool) {
        return 'bad value for "$key".Expected a Boolean but got "${props[key]}".';
      }

      if ((key == _fpfHintTextKey || key == _fpfLabelAfterSelectionKey) &&
          props[key] is! String) {
        return 'bad value for "$key".Expected a String but got "${props[key]}".';
      }
    }
  }

  @override
  String get type => filePickerComponentTypeName;
}
