import 'package:flutter/material.dart';
import 'package:flutter_dynamic_forms/src/constants/constants.dart';
import 'package:flutter_dynamic_forms/src/models/base_model.dart';

import '../models/text_field_props.dart';

BaseModel nameToPropsMapper(String key, Map<String, dynamic> map) {
  if (key == textComponentName) {
    var check = TextComponentProps.textFieldPropsChecker(map);
    if (check is String) {
      throw check;
    }
    return TextComponentProps.fromMap(map);
  }

  throw 'Unkown component with name $map.';
}

class CustomTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Enter your name',
      ),

      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },

      onSaved: (value) {
        // This optional block of code can be used to run
        // code when the user saves the form.
      },

      onChanged: (value) {
        // This optional block of code can be used to run
        // code when the user changes the text in the field.
      },

      onFieldSubmitted: (value) {
        // This optional block of code can be used to run
        // code when the user submits the form.
      },

      onEditingComplete: () {
        // This optional block of code can be used to run
        // code when the user completes editing the text field.
      },

    
    );
  }
}
