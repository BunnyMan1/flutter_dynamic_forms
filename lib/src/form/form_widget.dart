import 'package:flutter/material.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';
import 'package:flutter_dynamic_forms/src/constants/constants.dart';

import '../models/base_model.dart';

class FlutterDynamicForm extends StatefulWidget {
  final FlutterDynamicFormData formData;
  final Function(Map<String, dynamic>)? onSubmit;
  const FlutterDynamicForm({
    Key? key,
    required this.formData,
    this.onSubmit,
  }) : super(key: key);

  @override
  State<FlutterDynamicForm> createState() => _FlutterDynamicFormState();
}

class _FlutterDynamicFormState extends State<FlutterDynamicForm> {
  @override
  void initState() {
    _componentsChecker();
    super.initState();
  }

  _componentsChecker() {
    var checkMap = {};
    for (var i in widget.formData.components) {
      if (checkMap[i.name] == null) {
        checkMap[i.name] = true;
      } else {
        throw "duplicate component name detected : ${i.name}";
      }
    }
  }

  final Map<String, dynamic> _values = {};
  final Map<String, bool> _validations = {};

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...widget.formData.components
              .map(
                (c) => Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: _propsToComponentMapper(c),
                ),
              )
              .toList(),
          ElevatedButton(
            onPressed: () {
              if (widget.onSubmit != null) widget.onSubmit!(_values);
            },
            child: const Text("Submit"),
          ),
        ],
      ),
    );
  }

  Widget _propsToComponentMapper(BaseModel props) {
    if (props.type == textComponentName) {
      return TextFieldComponent(
        onChange: ((s) {
          _values[props.name] = s;
        }),
        props: props as TextComponentProps,
      );
    }
    throw 'Unknown component.';
  }
}
