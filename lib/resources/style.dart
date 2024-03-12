// Flutter imports:
import 'package:flutter/material.dart';

class ResourceStyles {
  TextStyle get fontPoppins =>
      const TextStyle(fontFamily: 'Poppins', color: Colors.white);
  final TextStyle fz10 = const TextStyle(fontSize: 10);
  final TextStyle fz12 = const TextStyle(fontSize: 12);
  final TextStyle fz14 = const TextStyle(fontSize: 14);
  final TextStyle fz16 = const TextStyle(fontSize: 16);
  final TextStyle fz22 = const TextStyle(fontSize: 22);

  TextStyle fw400 = const TextStyle(fontWeight: FontWeight.w400);
  TextStyle fw500 = const TextStyle(fontWeight: FontWeight.w500);
  TextStyle fw600 = const TextStyle(fontWeight: FontWeight.w600);

  TextStyle get fz10Fw400 => fz10.merge(fw400);
  TextStyle get fz10Fw500 => fz10.merge(fw500);
  TextStyle get fz12Fw400 => fz12.merge(fw400);
  TextStyle get fz14Fw500 => fz14.merge(fw500);
  TextStyle get fz14Fw600 => fz14.merge(fw600);
  TextStyle get fz16Fw500 => fz16.merge(fw500);
  TextStyle get fz22Fw500 => fz22.merge(fw500);
}
