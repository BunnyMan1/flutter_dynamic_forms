// import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dynamic_forms/src/common/component_wrapper.dart';
import 'package:flutter_dynamic_forms/src/common/read_only_text_widget.dart';
import 'package:flutter_dynamic_forms/src/utilities/helpers.dart';

import '../models/multiselect_dropdown_field_props.dart';

class MultiSelectDropdownComponent extends StatelessWidget {
  const MultiSelectDropdownComponent({
    Key? key,
    required this.error,
    required this.onChange,
    required this.value,
    required this.properties,
  }) : super(key: key);

  final MultiSelectDropdownComponentProperties properties;

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
          ReadOnlyTextFieldWidget(
            borderColor: hexStringToColorConverter(properties.borderColor),
            borderRadius: properties.borderRadius,
            borderWidth: properties.borderWidth,
            onTap: () {
              showDialog(
                context: context,
                builder: ((context) {
                  return MultiDropdownPopup(
                      properties: properties, value: value, onChange: onChange);
                }),
              );
            },
            suffixIconData: const IconData(
              0xee8a,
              fontFamily: 'MaterialIcons',
            ),
            showBorder: properties.showBorder,
            text: "$value",
            textColor: hexStringToColorConverter(properties.labelColor),
          ),
        ],
      ),
    );
  }
}

class MultiDropdownPopup extends StatefulWidget {
  const MultiDropdownPopup({
    Key? key,
    required this.properties,
    required this.value,
    required this.onChange,
  }) : super(key: key);

  final MultiSelectDropdownComponentProperties properties;
  final dynamic value;
  final Function(dynamic s)? onChange;

  @override
  State<MultiDropdownPopup> createState() => _MultiDropdownPopupState();
}

class _MultiDropdownPopupState extends State<MultiDropdownPopup> {
  late List _selected;

  late List<String> _origLabels;
  late List<String> labels;

  late List _origValues;
  late List values;

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    _selected = widget.value ?? [];
    _origLabels = widget.properties.itemLabels;
    labels = _origLabels;
    _origValues = widget.properties.itemValues;
    values = _origValues;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(_selected);
    return AlertDialog(
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _searchController,
                onChanged: ((query) {
                  if (query == "") {
                    labels = [..._origLabels];
                    values = [..._origValues];
                    setState(() {});
                    return;
                  }
                  labels = [];
                  values = [];
                  for (int i = 0; i < _origLabels.length; i++) {
                    if (_origLabels[i].contains(query.toLowerCase())) {
                      labels.add(_origLabels[i]);
                      values.add(_origValues[i]);
                    }
                  }
                  setState(() {});
                }),
                decoration: InputDecoration(
                  hintText: "Search",
                  suffixIcon: IconButton(
                    onPressed: () {
                      _searchController.clear();
                      setState(() {
                        labels = [..._origLabels];
                        values = [..._origValues];
                      });
                    },
                    icon: const Icon(Icons.close),
                  ),
                ),
              ),
            ),
          ],
        ),
        for (var i = 0; i < labels.length; i++)
          GestureDetector(
            onTap: () {
              print("value : ${values[i]}");
              if (widget.onChange != null) {
                widget.onChange!(values[i]);
              }
              setState(() {
                _selected.contains(values[i])
                    ? _selected.remove(values[i])
                    : _selected.add(values[i]);
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 4.0,
                vertical: 8.0,
              ),
              child: Row(
                children: [
                  Checkbox(
                    value: _selected.contains(values[i]),
                    onChanged: ((_) {
                      if (widget.onChange != null) {
                        widget.onChange!(values[i]);
                      }
                      print("value : ${values[i]} - ${_selected.contains(values[i])}");
                      if (_selected.contains(values[i])) {
                        print("removing : ${values[i]}");
                        setState(() {
                          _selected.remove(values[i]);
                        });
                      } else {
                        print("adding : ${values[i]}");
                        setState(() {
                          _selected.add(values[i]);
                        });
                      }
                    }),
                  ),
                  Expanded(
                    child: Text(
                      labels[i],
                    ),
                  ),
                ],
              ),
            ),
          ),
      ]),
    );
  }
}
