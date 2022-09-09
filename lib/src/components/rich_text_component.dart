import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';

import '../common/component_wrapper.dart';
import '../models/rich_text_field_props.dart';

/// `RichTextComponentProperties` is a component that renders a rich text widget.
class RichTextFieldComponent extends StatelessWidget {
  const RichTextFieldComponent({
    Key? key,
    required this.properties,
    required this.value,
    this.error,
    this.onChange,
  }) : super(key: key);

  /// `properties` is a [RichTextComponentProperties] object that contains all the properties of the component.
  final RichTextComponentProperties properties;

  /// `value` is the value of the rich text field.
  final dynamic value;

  /// `error` to be displayed below the component.
  final String? error;

  /// `onChange` is a function that is called when the value of the rich text field is changed.
  final Function(dynamic s)? onChange;

  @override
  Widget build(BuildContext context) {
    return ComponentWrapper(
      title: properties.label,
      description: properties.helperText,
      child: HtmlEditor(
        controller: HtmlEditorController(),
        htmlEditorOptions: HtmlEditorOptions(
          disabled: true,
          shouldEnsureVisible: false,
          hint: properties.hintText,
        ),
      ),
    );
  }
}
