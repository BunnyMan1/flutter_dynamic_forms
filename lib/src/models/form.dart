// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dynamic_forms/src/utilities/key_to_module_mapper.dart';

import 'form_props.dart';

class FlutterDynamicFormData {
  final FormProps? props;

  final List<Widget> components;
  FlutterDynamicFormData({
    this.props,
    required this.components,
  });

  factory FlutterDynamicFormData.fromJson(String json) {
    Map<String, dynamic> map = jsonDecode(json);

    var propsToSet = FormProps.fromJson(map['props']);

    List<Widget> componentsToSet = [];

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

      var mod = keyToModuleMapper(type, map);

      if (mod is String) {
        throw mod;
      } else {
        componentsToSet.add(mod);
      }
    }

    return FlutterDynamicFormData(
      components: componentsToSet,
      props: propsToSet,
    );
  }
}
