import 'package:flutter/material.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';

import '../common/component_wrapper.dart';
import '../utilities/helpers.dart';

class TextFieldComponent extends StatelessWidget {
  const TextFieldComponent({
    Key? key,
    required this.props,
  }) : super(key: key);

  final TextComponentProps props;

  @override
  Widget build(BuildContext context) {
    Color c = hexStringToColorConverter(props.color);
    return ComponentWrapper(
      title: props.title,
      description: props.description,
      child: Material(
        child: TextField(
          keyboardType: TextInputType.multiline,
          minLines: props.minLines,
          maxLines: props.maxLines,
          style: TextStyle(
            color: c,
            fontSize: 18.0,
          ),
          cursorColor: c,
          decoration: InputDecoration(
            hintText: props.placeholder,
            labelText: props.label,
            border: props.showBorder
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: c),
                  )
                : null,
            enabledBorder: props.showBorder
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: c),
                  )
                : null,
            focusedBorder: props.showBorder
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: c),
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
