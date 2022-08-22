import 'package:flutter/material.dart';

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



