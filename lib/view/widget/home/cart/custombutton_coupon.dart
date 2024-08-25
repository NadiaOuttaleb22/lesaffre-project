import 'package:flutter/material.dart';
import 'package:prj/core/constant/color.dart';

class CustombuttonCoupon extends StatelessWidget {
  final String txt;
  final void Function()? onPressed;
  const CustombuttonCoupon(
      {super.key, required this.txt, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        // margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: 45,
        width: double.infinity,
        child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colorapp.primaryColors,
            onPressed: onPressed,
            child: Text(txt,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold))));
  }
}
