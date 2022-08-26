// import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dynamic_forms/src/common/component_wrapper.dart';

class MultiSelectDropdown extends StatelessWidget {
  const MultiSelectDropdown({
    Key? key,
    required this.error,
    required this.onChange,
    required this.value,
  }) : super(key: key);

  /// `value` is the value of the dropdown field.
  final dynamic value;

  /// `error` to be displayed.
  final String? error;

  /// `onChange` is a function that is called when the value of the dropdown field is changed.
  final Function(dynamic s)? onChange;
  @override
  Widget build(BuildContext context) {
    return ComponentWrapper(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ButtonTheme(
            padding: const EdgeInsets.all(0.0),
            alignedDropdown: true,
            child: DropdownButtonFormField<dynamic>(
              onTap: () {
                print("ontap");
              },
              iconDisabledColor: Colors.black,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 4,
                ),
                errorStyle: TextStyle(
                  fontSize: 12.0,
                  color: Colors.red,
                ),
              ),
              value: value,
              items: [
                for (int i = 0; i < 5; i++)
                  DropdownMenuItem(
                    value: "item $i",
                    child: Text("item $i"),
                  ),
              ],
              onChanged: null,
            ),
          ),
        ],
      ),
    );
  }
}
