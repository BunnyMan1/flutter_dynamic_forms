import 'package:flutter/material.dart';

import '../common/component_wrapper.dart';
import '../models/data_item.dart';
import '../models/multiselect_dropdown_field_props.dart';
import '../utilities/helpers.dart';
import '../utilities/string_utilities.dart';

class MultiSelectDropdownComponent extends StatelessWidget {
  const MultiSelectDropdownComponent({
    Key? key,
    required this.error,
    required this.onChange,
    required this.value,
    required this.properties,
  }) : super(key: key);

  /// Properties of multiselect dropdown components
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
      // title: properties.legend,
      child: SizedBox(
        child: InputDecorator(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 30,
              horizontal: 16,
            ),
            helperText: properties.helperText,
            errorText: error,
            hintText: properties.hintText,
            labelText: toTitleCase(properties.legend ?? ''),
            suffixIcon: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return MultiDropdownPopup(
                      properties: properties,
                      value: value,
                      onChange: onChange,
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.arrow_drop_down,
              ),
            ),
            border: properties.showBorder
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(properties.borderRadius),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: properties.borderWidth,
                    ),
                  )
                : null,
          ),
          child: Row(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (int i = 0; i < value.length; i++)
                        Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Chip(
                            label: Text((value[i] as DataItem).key),
                            labelPadding: const EdgeInsets.symmetric(
                              vertical: 2,
                              horizontal: 8,
                            ),
                            deleteIcon: const Icon(Icons.close),
                            onDeleted: () {
                              if (onChange != null) {
                                onChange!(DataItem(key: value[i].key, value: value[i].value));
                              }
                            },
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                        )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
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
  late List _selected = [];

  late List<String> _origLabels;
  late List<String> labels;

  late List _origValues;
  late List values;

  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;
  @override
  void initState() {
    _selected = [...widget.value ?? <DataItem>[]];
    _origLabels = widget.properties.itemLabels;
    labels = _origLabels;
    _origValues = widget.properties.itemValues;
    values = _origValues;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _searchController,
                  onChanged: ((query) {
                    if (query == "") {
                      labels = [..._origLabels];
                      values = [..._origValues];
                      _isSearching = false;
                      setState(() {});
                      return;
                    } else {
                      _isSearching = true;
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
                    suffixIcon: _isSearching
                        ? IconButton(
                            onPressed: () {
                              _searchController.clear();
                              setState(() {
                                labels = [..._origLabels];
                                values = [..._origValues];
                              });
                            },
                            icon: const Icon(Icons.close),
                          )
                        : const Icon(Icons.search),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Column(
            children: labels.mapIndexed((l, i) {
              bool contains = false;
              for (var s in _selected) {
                if (s.value == values[i]) {
                  contains = true;
                  break;
                }
              }
              // print(" contains: $l : $contains");
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 4.0,
                  vertical: 4.0,
                ),
                child: Row(
                  children: [
                    Checkbox(
                      value: contains,
                      onChanged: ((_) {
                        if (widget.onChange != null) {
                          widget.onChange!(
                            DataItem(key: labels[i], value: values[i]),
                          );
                        }

                        setState(() {
                          if (contains) {
                            print('removing from selected');

                            _selected.remove(
                              DataItem(key: l, value: values[i]),
                            );
                          } else {
                            print('adding to` selected');
                            _selected.add(
                              DataItem(key: l, value: values[i]),
                            );
                          }
                        });
                      }),
                    ),
                    Expanded(
                      child: Text(
                        labels[i],
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
