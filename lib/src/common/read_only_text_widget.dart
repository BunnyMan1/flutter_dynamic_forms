import 'package:flutter/material.dart';

/// Read Only Text Field Widget acts as a disabled textfield
/// which only displays the user selected value.
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

  /// Text to be displayed on read only text widget
  final String text;

  /// A callback function when the user taps this widget.
  final Function() onTap;

  /// Helper text is a description text displayed below the textfield component.
  final String? helperText;

  /// Error text to be displayed in place of helper text.
  final String? errorText;

  /// Hint text is a placeholder displayed to give hints to the user.
  final String? hintText;

  /// Label text is a displayed.
  final String? labelText;

  /// Color of the text that is displayed.
  final Color textColor;

  /// Border color of the component.
  final Color borderColor;

  /// Determines whether to show a border or not.
  final bool showBorder;

  /// Magnitude of the curve along the borders.
  final double borderRadius;

  /// Border width
  final double borderWidth;

  /// This icon is displayed before the text.
  final IconData? prefixIconData;

  /// This icon is displayed after the text.
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
