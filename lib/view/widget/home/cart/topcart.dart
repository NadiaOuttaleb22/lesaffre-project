import 'package:flutter/material.dart';
import 'package:prj/core/constant/color.dart';

class Topcart extends StatelessWidget {
  final String text;
  const Topcart({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      //height: 40,
      decoration: BoxDecoration(
          color: Colorapp.red2Color, borderRadius: BorderRadius.circular(20)),
      child: Text(text,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colorapp.primaryColors)),
    );
  }
}
