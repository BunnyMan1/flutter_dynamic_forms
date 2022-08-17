import 'package:flutter/material.dart';

Color hexStringToColorConverter(String s) {
  if (s.length != 6) {
    throw "Badly formatted hex color code. Length of the hex code should be 6.";
  }
  final buffer = StringBuffer();
  if (s.length == 6 || s.length == 7) buffer.write('ff');
  buffer.write(s.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}
