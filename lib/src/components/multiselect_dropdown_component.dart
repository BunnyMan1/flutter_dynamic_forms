import 'package:flutter/material.dart';

import '../common/component_wrapper.dart';
import '../models/data_item.dart';
import '../models/multiselect_dropdown_field_props.dart';
import '../utilities/helpers.dart';
import '../utilities/string_utilities.dart';

/// MultiSelectDropdownComponent is a component that renders a multi select dropdown widget.
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
    /// Chip color is applied to background of the chip widget.
    Color chipColor = hexStringToColorConverter(properties.chipColor);

    /// Chip text color is applied to the text displayed on the chip widget.
    Color chipTextColor = hexStringToColorConverter(properties.chipTextColor);

    /// Chip icon color is applied to the cross icon on chip.
    Color chipIconColor = hexStringToColorConverter(properties.chipTextColor);

    return ComponentWrapper(
      child: SizedBox(
        child: InkWell(
          onTap: () {
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
              suffixIcon: const Icon(
                Icons.arrow_drop_down,
              ),
              border: properties.showBorder
                  ? OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(properties.borderRadius),
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
                              backgroundColor: chipColor,
                              deleteIconColor: chipIconColor,
                              label: Text(
                                (value[i] as DataItem).key,
                                style: TextStyle(
                                  color: chipTextColor,
                                ),
                              ),
                              labelPadding: const EdgeInsets.symmetric(
                                vertical: 2,
                                horizontal: 8,
                              ),
                              deleteIcon: const Icon(Icons.close),
                              onDeleted: () {
                                if (onChange != null) {
                                  onChange!(DataItem(
                                      key: value[i].key,
                                      value: value[i].value));
                                }
                              },
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
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
      ),
    );
  }
}

/// A multi select options widget to be displayed on multidropdown popup.
class MultiDropdownPopup extends StatefulWidget {
  const MultiDropdownPopup({
    Key? key,
    required this.properties,
    required this.value,
    required this.onChange,
  }) : super(key: key);

  /// `MultiSelectDropdownComponentProperties` properties
  final MultiSelectDropdownComponentProperties properties;

  /// Value of the component
  final dynamic value;

  /// A callback when the component is changed.
  final Function(dynamic s)? onChange;

  @override
  State<MultiDropdownPopup> createState() => _MultiDropdownPopupState();
}

/// Defines the state of [MultiDropdownPopup]
class _MultiDropdownPopupState extends State<MultiDropdownPopup> {
  /// List of selected values
  late List _selected = [];

  /// List of original labels
  late List<String> _origLabels;

  /// List of labels
  late List<String> labels;

  /// List of original values
  late List _origValues;

  /// List of values
  late List values;

  /// A text editing controller for search field in the dropdown menu.
  final TextEditingController _searchController = TextEditingController();

  /// Determines searching is in progress or not.
  bool _isSearching = false;

  @override
  void initState() {
    _selected = [...widget.value ?? <DataItem>[]];
    _origLabels = widget.properties.itemLabels;
    labels = [..._origLabels];
    _origValues = widget.properties.itemValues;
    values = [..._origValues];
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

              /// When an item from the multiselect drop down is selected or unselected
              void onTapped() {
                if (widget.onChange != null) {
                  widget.onChange!(
                    DataItem(key: l, value: values[i]),
                  );
                }

                setState(() {
                  if (contains) {
                    _selected.remove(
                      DataItem(key: l, value: values[i]),
                    );
                  } else {
                    _selected.add(
                      DataItem(key: l, value: values[i]),
                    );
                  }
                });
              }

              return InkWell(
                onTap: onTapped,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4.0,
                    vertical: 4.0,
                  ),
                  child: Row(
                    children: [
                      Checkbox(
                        value: contains,
                        onChanged: (_) => onTapped(),
                      ),
                      Expanded(
                        child: Text(
                          l,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
