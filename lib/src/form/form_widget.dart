import 'package:flutter/material.dart';

import '../../flutter_dynamic_forms.dart';
import '../utilities/prop_to_component_mapper.dart';
import '../utilities/validator.dart';

/// Flutter dynamic form. This is the main form widget of this package.
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
  void _componentsChecker() {
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

  final Map<String, dynamic> _validations = {};

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...widget.formData.components
                .map(
                  (c) => Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: propsToComponentMapper(
                      properties: c,
                      setValue: _setValues,
                      setValidation: _setValidation,
                      values: _values,
                      validations: _validations,
                    ),
                  ),
                )
                .toList(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // If show reset button is true  AND
                  // if custom reset button is not given (null)
                  // --> SHOW default reset button
                  if (widget.formData.props?.showResetButton == true &&
                      widget.formData.props?.customResetButton == null)
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _values.clear();
                          _validations.clear();
                        });
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
                      for (var i in widget.formData.components) {
                        var res = componentValidator(
                          properties: i,
                          value: _values[i.name],
                        );
                        if (res.errors.isNotEmpty) {
                          _setValidation(
                            i.name,
                            res.errors.first.values.first.toString(),
                          );
                        } else {
                          _setValidation(i.name, null);
                        }
                      }

                      if (widget.onSubmit != null) widget.onSubmit!(_values);
                    },
                    child: const Text("Submit"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// This method will be called by the component when the value of a component is changed.
  /// This method will update the `_values` map with the new value.
  void _setValues(dynamic name, dynamic value, {bool? isList}) {
    setState(() {
      // Check if the value to be stored in a list or not.
      if (isList == true) {
        // If the value is a list, check if the list is already present in the map.
        if (_values[name] == null) {
          // If not present create an empty list.
          _values[name] = [];
        }
        if (_values[name].contains(value)) {
          // If the list already contains the value, then remove it.
          _values[name].remove(value);
        } else {
          // If not then add.
          _values[name].add(value);
        }
      } else {
        print('directlty assigning val');
        // directly assign the value to new key if the value need not to be added in a list.
        _values[name] = value;
      }
    });
  }

  /// Set validatons for the components. Add validation message to the `_validations` map.
  void _setValidation(var name, var value) {
    setState(() {
      _validations[name] = value;
    });
  }
}
