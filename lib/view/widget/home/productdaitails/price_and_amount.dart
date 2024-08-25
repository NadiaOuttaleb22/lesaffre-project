import 'package:flutter/material.dart';
import 'package:prj/core/constant/color.dart';

class PriceAndAmount extends StatelessWidget {
  final void Function()? onPressedplus;
  final void Function()? onPressedminus;
  final String price;
  final String count;
  const PriceAndAmount(
      {super.key,
      required this.onPressedplus,
      required this.onPressedminus,
      required this.count,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Row(children: [
        IconButton(onPressed: onPressedplus, icon: const Icon(Icons.add)),
        Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 2),
            width: 50,
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child:
                Text(count, style: const TextStyle(fontSize: 20, height: 1.1))),
        IconButton(onPressed: onPressedminus, icon: const Icon(Icons.remove)),
      ]),
      const Spacer(),
      Text("$price dh",
          style: const TextStyle(
              color: Colorapp.red, fontSize: 18, fontWeight: FontWeight.bold))
    ]);
  }
}
