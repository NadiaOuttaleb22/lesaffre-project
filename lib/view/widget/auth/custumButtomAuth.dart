import 'package:flutter/material.dart';

// ignore: camel_case_types
class custumButtomAuth extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const custumButtomAuth({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 16),
        child: MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          onPressed: onPressed,
          textColor: Colors.white,
          color: const Color.fromARGB(255, 179, 7, 62),
          child: Text(text),
        ));
  }
}
