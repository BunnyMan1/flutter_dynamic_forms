import 'package:flutter/material.dart';
import 'package:flutter_dynamic_forms/src/models/form.dart';

class FlutterDynamicForm extends StatelessWidget {
  final FlutterDynamicFormData formData;
  const FlutterDynamicForm({
    Key? key,
    required this.formData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: formData.components,
      ),
    );
  }
}
