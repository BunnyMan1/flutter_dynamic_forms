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
            components: [
              TextComponentProperties.fromMap(
                {
                  'type': 'text',
                  'name': 'employee_name',
                  'title': 'Emp Name',
                  "regex_match": "[a-z0-9]+@[a-z]+\.[a-z]{2,3}",
                },
              ),
              TextComponentProperties(
                name: 'employee_email',
                // name: "Emp Email",
                label: "Employee Email",
                isRequired: true,
                placeholder: "Enter employee's name",
                regexMatch: "[a-z0-9]+@[a-z]+\.[a-z]{2,3}",
              ),
            ],
          ),
          onSubmit: (var map) {
            print(map);
          },
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
