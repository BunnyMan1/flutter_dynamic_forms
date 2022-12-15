import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dynamic_forms/src/common/component_wrapper.dart';
import 'package:flutter_dynamic_forms/src/models/filepicker_field_props.dart';

class FilePickerComponent extends StatelessWidget {
  const FilePickerComponent({
    Key? key,
    required this.properties,
    required this.value,
    required this.onChange,
  }) : super(key: key);

  final FilePickerComponentProperties properties;

  /// Value of the file picker
  final dynamic value;

  /// A callback when filepicker component changes it's value.
  final Function(dynamic file) onChange;

  pickFile() async {
    var res = await FilePicker.platform.pickFiles(
      type: (properties.allowedExtensions != null && properties.allowedExtensions!.isNotEmpty)
          ? FileType.custom
          : properties.fileType,
      allowedExtensions: properties.allowedExtensions,
      allowMultiple: properties.allowMultiple,
    );
    if (res != null) {
      onChange(res);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ComponentWrapper(
        child: Column(
      children: [
        InkWell(
          onTap: () {
            pickFile();
          },
          child: value == null
              ? Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 16.0,
                  ),
                  decoration: BoxDecoration(color: Colors.blue[200]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        properties.hintText ??
                            (properties.allowMultiple ? "Select Files" : " Select File "),
                      ),
                      const SizedBox(
                        width: 16.0,
                      ),
                      const Icon(
                        //TODO: maybe? handle different icons based on file types.
                        Icons.file_copy,
                      ),
                    ],
                  ),
                )
              : Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 16.0,
                  ),
                  decoration: BoxDecoration(color: Colors.blue[200]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        properties.labelAfterSelection ??
                            "${(value as FilePickerResult).files.length} ${(value as FilePickerResult).files.length > 1 ? 'Files' : 'File'} Selected ",
                      ),
                      const SizedBox(
                        width: 16.0,
                      ),
                      const Icon(
                        //TODO: maybe? handle different icons based on file types.
                        Icons.file_copy,
                      ),
                    ],
                  ),
                ),
        ),
      ],
    ));
  }
}
