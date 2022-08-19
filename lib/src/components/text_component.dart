import 'package:flutter/material.dart';

import '../../flutter_dynamic_forms.dart';
import '../common/component_wrapper.dart';
import '../utilities/helpers.dart';

/// TextFieldComponent is a component that renders a text field.
class TextFieldComponent extends StatelessWidget {
  const TextFieldComponent({
    Key? key,
    required this.props,
    this.error,
    this.onFocusLost,
    this.onChange,
    required this.controller,
  }) : super(key: key);

  final TextComponentProperties props;
  final Function(String s)? onChange;
  final Function(String s)? onFocusLost;
  final String? error;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    Color c = hexStringToColorConverter(props.textColor);
    Color borderColor = hexStringToColorConverter(props.borderColor);
    return ComponentWrapper(
      description: props.helperText,
      child: Focus(
        onFocusChange: ((value) {
          if (!value) {
            onFocusLost != null ? onFocusLost!(controller.text) : null;
          }
        }),
        child: TextField(
          controller: controller,
          onChanged: (s) {
            onChange != null ? onChange!(s) : null;
          },
          // keyboardType: TextInputType.,
          minLines: props.minLines,
          maxLines: props.maxLines,
          maxLength: props.maxLength,
          style: TextStyle(
            color: c,
            fontSize: 18.0,
          ),
          cursorColor: c,

          decoration: InputDecoration(
            helperText: props.helperText,
            errorText: error,
            hintText: props.placeholder,
            labelText: props.label,
            labelStyle: TextStyle(
              color: c.withOpacity(0.8),
            ),
            counter: props.showTextCounter ? null : Container(),
            border: props.showBorder
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(props.borderRadius),
                    borderSide: BorderSide(
                      color: borderColor,
                      width: props.borderWidth,
                    ),
                  )
                : null,
            enabledBorder: props.showBorder
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      props.borderRadius,
                    ),
                    borderSide: BorderSide(
                      color: borderColor,
                      width: props.borderWidth,
                    ),
                  )
                : null,
            focusedBorder: props.showBorder
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(props.borderRadius),
                    borderSide: BorderSide(
                      color: borderColor,
                      width: props.borderWidth,
                    ),
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
