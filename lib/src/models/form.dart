import 'dart:convert';

import '../utilities/name_to_props_mapper.dart';
import 'base_model.dart';
import 'form_props.dart';

class FlutterDynamicFormData {
  final FormProps? props;

  final List<BaseModel> components;
  FlutterDynamicFormData({
    this.props,
    required this.components,
  });

  factory FlutterDynamicFormData.fromJson(String json) {
    Map<String, dynamic> map = jsonDecode(json);

    var propsToSet = FormProps.fromJson(map['props']);

    List<BaseModel> componentsToSet = [];

    var comps = map['components'];
    if (comps is! List) {
      throw 'Invalid value of `Components`. Expected a List but got ${comps.runtimeType}';
    }

    for (var i in comps) {
      var type = i['type'];
      var name = i['name'];

      if (type == null || type is! String) {
        throw "Invalid value of 'type' for component '$name'. Expected a String but got ${type.runtimeType}";
      }

      var mod = nameToPropsMapper(type, map);
      componentsToSet.add(mod);
    }

    return FlutterDynamicFormData(
      components: componentsToSet,
      props: propsToSet,
    );
  }
}
