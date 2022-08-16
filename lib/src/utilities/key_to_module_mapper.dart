import 'package:flutter_dynamic_forms/src/components/text_component.dart';
import 'package:flutter_dynamic_forms/src/constants/constants.dart';

import '../models/text_field_props.dart';

dynamic keyToModuleMapper(String key, Map<String, dynamic> map) {
  if (key == textComponentName) {
    var check = TextComponentProps.textFieldPropsChecker(map);
    if (check is String) {
      return check;
    }
    return TextFieldComponent(
      props: TextComponentProps.fromMap(map),
    );
  }

  throw 'Unkown component with name $map.';
}
