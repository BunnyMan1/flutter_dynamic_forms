import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/radio_field_props.dart';

/// `hexStringToColorConverter` converts a hex string to a color.
Color hexStringToColorConverter(String s) {
  if (s.length != 6) {
    // If the hex string is not 6 characters long, then throw an error.
    throw "Badly formatted hex color code. Length of the hex code should be 6.";
  }
  final buffer = StringBuffer();

  if (s.length == 6) buffer.write('ff');
  buffer.write(s.replaceFirst('#', ''));

  return Color(int.parse(buffer.toString(), radix: 16));
}

/// Formats the given DateTime object as into a String.
/// `d MMM yyyy` format.
String formattedDate(DateTime dt) {
  return DateFormat('d MMM yyyy').format(dt);
}

extension IndexedIterable<E> on Iterable<E> {
  Iterable<T> mapIndexed<T>(T Function(E e, int i) f) {
    var i = 0;
    return map((e) => f(e, i++));
  }
}

// ------- Enum Mappers -------------

/// Map string values to [RadioFieldAlignment] enum.
RadioFieldAlignment mapRadioFieldAlignment(String value) {
  switch (value.toLowerCase().trim()) {
    case "horizontal":
      return RadioFieldAlignment.horizontal;
    case "vertical":
      return RadioFieldAlignment.vertical;
    // default:
    //   return RadioFieldAlignment.horizontal;
    default:
      throw "Invalid value for RadioFieldAlignment. Expected 'horizontal' or 'vertical' but got '$value'.";
  }
}

/// Map string values to [RadioFieldLabelPosition] enum.
RadioFieldLabelPosition mapRadioFieldLabelPosition(String value) {
  switch (value.toLowerCase().trim()) {
    case "left":
      return RadioFieldLabelPosition.left;
    case "right":
      return RadioFieldLabelPosition.right;
    // default:
    //   return RadioLabelPosition.left;
    default:
      throw "Invalid value for RadioLabelPosition. Expected 'left' or 'right' but got '$value'.";
  }
}

/// Map string values to [RadioFieldLabelStyle] enum.
/// This will determine the font weight of the label in radio
RadioFieldLabelStyle mapRadioFieldLabelStyle(String value) {
  switch (value.toLowerCase().trim()) {
    case "normal":
      return RadioFieldLabelStyle.normal;
    case "bold":
      return RadioFieldLabelStyle.bold;
    case "italic":
      return RadioFieldLabelStyle.italic;
    // default:
    //   return RadioLabelStyle.normal;
    default:
      throw "Invalid value for RadioLabelStyle. Expected 'normal', 'bold' or 'italic' but got '$value'.";
  }
}
