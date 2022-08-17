import 'package:flutter/material.dart';

class ComponentWrapper extends StatelessWidget {
  const ComponentWrapper({
    Key? key,
    required this.child,
    this.description,
    this.title,
  }) : super(key: key);

  final Widget child;
  final String? description;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) Text(title!),
        if (description != null) Text(description!),
        child,
      ],
    );
  }
}
