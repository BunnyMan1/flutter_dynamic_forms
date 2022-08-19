import 'package:flutter/material.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';
import 'package:flutter_dynamic_forms/src/constants/constants.dart';

import '../models/base_model.dart';

class FlutterDynamicForm extends StatefulWidget {
  final FlutterDynamicFormData formData;
  final void Function(Map<String, dynamic>)? onSubmit;
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
    // Check the list of components before the form is rendered.
    _componentsChecker();
    super.initState();
  }

  /// This method will check the list of components for any duplicate name being used.
  /// Since the `name` being passed is used as unique key, duplicate names will cause
  /// undesired effects like values of one or more fields being overwritten. So this
  /// check is required to avoid such scenarios. This method will throw an error with
  /// the name of the duplicated key if found.
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
          Row(
            children: [
              // If show reset button is true  AND
              // if custom reset button is not given (null)
              // --> SHOW default reset button
              if (widget.formData.props?.showResetButton == true &&
                  widget.formData.props?.customResetButton == null)
                ElevatedButton(
                  onPressed: () {
                    if (widget.onSubmit != null) widget.onSubmit!(_values);
                  },
                  child: const Text("Reset"),
                ),

              // If show reset button is true  AND
              // if custom reset button is given (not null)
              // --> SHOW passed in custom reset button
              if (widget.formData.props?.showResetButton == true &&
                  widget.formData.props?.customResetButton != null)
                widget.formData.props!.customResetButton!,

              // Submit button
              ElevatedButton(
                onPressed: () {
                  if (widget.onSubmit != null) widget.onSubmit!(_values);
                },
                child: const Text("Submit"),
              ),
            ],
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
