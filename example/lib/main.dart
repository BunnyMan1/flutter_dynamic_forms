import 'package:flutter/material.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';

/// Starting point of the application.
void main() {
  runApp(const MyApp());
}

/// `MyApp` is the root widget of the application.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

/// `MyHomePage` is the home page of the application.
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

/// `_MyHomePageState` is the state of the home page.
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: FlutterDynamicForm(
              formData: FlutterDynamicFormData(
                props: FormProps(
                  showResetButton: true,
                ),
                components: [
                  // Text Field Component rendered as a widget from the map provided.
                  TextComponentProperties.fromMap(
                    {
                      'type': 'text',
                      'name': 'employee_name',
                      'title': 'Emp Name',
                      "regex_match": r"[a-z0-9]+@[a-z]+\.[a-z]{2,3}",
                      "prefix_icon": 0xe491,
                      "input_type": "number",
                    },
                  ),

                  // Text Field Component rendered as a widget from the paramenters passed to this widget.
                  TextComponentProperties(
                    name: 'employee_email',
                    // name: "Emp Email",
                    label: "Employee Email",
                    isRequired: true,
                    placeholder: "Enter employee's name",
                    maxLength: 100,
                    showTextCounter: true,
                    customErrorText: "Invalid Value",
                    regexMatch: r"[a-z0-9]+@[a-z]+\.[a-z]{2,3}",
                    prefixIconWidget: const Icon(
                      Icons.email,
                    ),
                    suffixIconWidget: const Icon(
                      Icons.alternate_email,
                    ),
                    inputType: InputType.number,
                  ),
                  //TODO: Uncomment these components

                  // // Radio Field Component rendered as a widget from the map provided.
                  // RadioComponentProperties.fromMap(
                  //   {
                  //     'type': 'radio',
                  //     'name': 'gender',
                  //     'legend': 'Gender',
                  //     'labels': ['male', 'female'],
                  //     'values': [1, 2],
                  //     'required': true,
                  //     'label_position': "right",
                  //   },
                  // ),

                  // // Checkbox
                  // CheckBoxComponentProperties.fromMap({
                  //   'type': 'checkbox',
                  //   'name': 'hobbies',
                  //   'legend': 'Hobbies',
                  //   'labels': ['cricket', 'football', 'hockey'],
                  //   'values': [1, 2, 3],
                  //   'required': true,
                  //   'label_position': "right",
                  // }),

                  // SliderComponentProperties(
                  //   name: "my_slider",
                  // ),
                  // SliderComponentProperties.fromMap({
                  //   'name': "my_slider",
                  // }),

                  DropdownComponentProperties.fromMap({
                    "type": "dropdown",
                    "name": "bus_number",
                    "legend": "asdfa",
                    "hint_text": "select a bus",
                    "item_labels": ['bus 1', 'bus 2', 'bus 3'],
                    "item_values": ['bus 1', 'bus 2', 'bus 3'],
                    "required": true,
                    // "show_border": false,
                    // "is_expanded": true,
                  }),

                  DatePickerComponentProperties.fromMap({
                    'name': "date_picker",
                    'is_required': true,
                  }),

                  MultiSelectDropdownComponentProperties.fromMap({
                    'name': "multi_dropdown",
                    "legend": "mutli buses",
                    "item_labels": [
                      'bus 1',
                      'bus 2',
                      'bus 3',
                      'bus 4',
                      'bus5',
                      'bus 6',
                      'bus 7'
                    ],
                    "item_values": [
                      'bus 1',
                      'bus 2',
                      'bus 3',
                      'bus 4',
                      'bus5',
                      'bus 6',
                      'bus 7'
                    ],
                  }),
                ],
              ),
              onSubmit: (var map) {
                debugPrint(map.toString());
              },
            ),
          ),
        ],
      ),
    );
  }
}
