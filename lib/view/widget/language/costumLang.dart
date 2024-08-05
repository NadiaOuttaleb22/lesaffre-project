import 'package:flutter/material.dart';

class Costumlangbotun extends StatelessWidget {
  final String textlang;
  final void Function()? onPressed;

  const Costumlangbotun({Key? key, required this.textlang, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      width: double.infinity,
      child: MaterialButton(
          color: const Color.fromARGB(255, 164, 2, 40),
          textColor: Colors.white,
          onPressed: onPressed,
          child: Text(textlang,
              style: const TextStyle(fontWeight: FontWeight.bold))),
    );
  }
}
