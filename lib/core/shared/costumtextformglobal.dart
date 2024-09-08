import 'package:flutter/material.dart';

class Costumtextformglobal extends StatelessWidget {
  final String hint;
  final String label;
  final IconData iconData;
  final TextEditingController? mycontroller;
  final String? Function(String?) valid;
  final bool? obscuretxt;
  final void Function()? onTapIcon;
  const Costumtextformglobal(
      {super.key,
      required this.hint,
      required this.label,
      required this.iconData,
      required this.mycontroller,
      required this.valid,
      this.obscuretxt,
      this.onTapIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: valid,
      controller: mycontroller,
      obscureText: obscuretxt == null || obscuretxt == false ? false : true,
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
              fontSize: 13, color: Color.fromARGB(255, 154, 153, 153)),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          label: Text(
            label,
            style: const TextStyle(color: Colors.grey),
          ),
          suffixIcon: InkWell(onTap: onTapIcon, child: Icon(iconData)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
    );
  }
}
