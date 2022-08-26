import 'package:flutter/material.dart';

class ReadOnlyTextFieldWidget extends StatelessWidget {
  const ReadOnlyTextFieldWidget({
    Key? key,
    required this.borderColor,
    required this.borderRadius,
    required this.borderWidth,
    this.errorText,
    this.helperText,
    this.hintText,
    this.labelText,
    required this.onTap,
    required this.showBorder,
    required this.text,
    required this.textColor,
    this.prefixIconData,
    this.suffixIconData,
  }) : super(key: key);

  final String text;
  final Function() onTap;
  final String? helperText;
  final String? errorText;
  final String? hintText;
  final String? labelText;
  final Color textColor;
  final Color borderColor;
  final bool showBorder;
  final double borderRadius;
  final double borderWidth;
  final IconData? prefixIconData;
  final IconData? suffixIconData;

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      controller: TextEditingController(text: text),
      onTap: onTap,
      decoration: InputDecoration(
        prefixIcon: prefixIconData != null ? Icon(prefixIconData!) : null,
        suffixIcon: suffixIconData != null ? Icon(suffixIconData!) : null,
        helperText: helperText,
        errorText: errorText,
        hintText: hintText,
        labelText: labelText,
        labelStyle: TextStyle(
          color: textColor.withOpacity(0.8),
        ),
        border: showBorder
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(
                  color: borderColor,
                  width: borderWidth,
                ),
              )
            : null,
        enabledBorder: showBorder
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  borderRadius,
                ),
                borderSide: BorderSide(
                  color: borderColor,
                  width: borderWidth,
                ),
              )
            : null,
        focusedBorder: showBorder
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(
                  color: borderColor,
                  width: borderWidth,
                ),
              )
            : null,
      ),
    );
  }
}
