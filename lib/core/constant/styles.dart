import 'package:flutter/material.dart';
import 'package:prj/core/constant/color.dart';

class Styles {
  static const TextStyle appbar = TextStyle(
      fontSize: 27, fontWeight: FontWeight.bold, color: Colorapp.primaryColors);

  static const TextStyle textnormal = TextStyle(
      color: Colorapp.grey, fontWeight: FontWeight.bold, fontSize: 15);
  static const TextStyle textnormal2 = TextStyle(
      color: Colorapp.primaryColors, fontWeight: FontWeight.bold, fontSize: 15);

  static const TextStyle hintstyle = TextStyle(
      color: Color.fromARGB(255, 149, 148, 148),
      fontWeight: FontWeight.bold,
      fontSize: 15);

  static const TextStyle pricestyle = TextStyle(
      fontSize: 18, fontWeight: FontWeight.bold, color: Colorapp.primaryColors);
  static const TextStyle pricestyletext =
      TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey);

  static const TextStyle buttonstyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
}
