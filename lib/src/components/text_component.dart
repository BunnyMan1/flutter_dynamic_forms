import 'package:flutter/material.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';

import '../common/component_wrapper.dart';
import '../utilities/helpers.dart';

class TextFieldComponent extends StatelessWidget {
  TextFieldComponent({
    Key? key,
    required this.props,
    this.onChange,
  }) : super(key: key);

  final TextComponentProps props;
  final Function(String s)? onChange;
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Color c = hexStringToColorConverter(props.color);
    return ComponentWrapper(
      title: props.title,
      description: props.description,
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
          hintText: props.placeholder,
          labelText: props.label,
          labelStyle: TextStyle(
            color: c.withOpacity(0.8),
          ),
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
    );
  }
}
