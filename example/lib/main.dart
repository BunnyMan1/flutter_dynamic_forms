import 'package:flutter/material.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';

void main() {
  runApp(const MyApp());
}

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FlutterDynamicForm(
          formData: FlutterDynamicFormData(
            props: FormProps(
              showResetButton: true,
            ),
            components: [
              TextComponentProperties.fromMap(
                {
                  'type': 'text',
                  'name': 'employee_name',
                  'title': 'Emp Name',
                  "regex_match": r"[a-z0-9]+@[a-z]+\.[a-z]{2,3}",
                  "prefix_icon": 0xe491,
                },
              ),
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
              RadioComponentProperties.fromMap(
                {
                  'type': 'radio',
                  'name': 'gender',
                  'labels': ['male', 'female'],
                  'values': [1, 2],
                  'required': true,
                },
              ),
              // RadioComponentProperties(
              //   name: 'Gender',
              //   labels: ['male', 'female'],
              //   values: ['value1', 'value2', 'value3'],
              // ),
              SliderComponentProperties(
                name: "my_slider",
              ),
            ],
          ),
          onSubmit: (var map) {
            debugPrint(map.toString());
          },
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
