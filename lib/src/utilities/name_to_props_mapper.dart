import '../constants/constants.dart';
import '../models/base_model.dart';
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