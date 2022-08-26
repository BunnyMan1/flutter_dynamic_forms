import 'package:flutter/material.dart';

import '../utilities/string_utilities.dart';

/// `ComponentWrapper` is a wrapper component that wraps the component with a title and description.
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
        // if (title != null) Text(title!),
        if (title != null)
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 4,
            ),
            child: Text(toTitleCase(title ?? '')),
          ),
        if (description != null)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(description!),
          ),
        child,
      ],
    );
  }
}
