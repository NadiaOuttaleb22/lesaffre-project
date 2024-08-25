import 'package:flutter/material.dart';
import 'package:prj/core/constant/color.dart';

class CostumTitlehome extends StatelessWidget {
  final String text;
  const CostumTitlehome({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Text(text,
          style: const TextStyle(
            color: Colorapp.primaryColors,
            fontSize: 26,
            fontWeight: FontWeight.bold, /* fontStyle: FontStyle.italic */
          )),
    );
  }
}
