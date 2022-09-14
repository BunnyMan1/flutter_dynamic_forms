import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dynamic_forms/src/common/component_wrapper.dart';
import 'package:flutter_dynamic_forms/src/models/filepicker_field_props.dart';

class FilePickerComponent extends StatelessWidget {
  const FilePickerComponent({
    Key? key,
    required this.properties,
  }) : super(key: key);

  final FilePickerComponentProperties properties;

  pickFile() {
    FilePicker.platform.pickFiles(
      type: properties.fileType,
      allowedExtensions: properties.allowedExtensions,
      dialogTitle: properties.dialogTitle,
    );
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
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 16.0,
            ),
            decoration: BoxDecoration(color: Colors.blue[200]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  //TODO: handle plural.
                  " Select File ",
                ),
                SizedBox(
                  width: 16.0,
                ),
                Icon(
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
