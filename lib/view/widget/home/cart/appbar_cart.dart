import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/core/constant/color.dart';

class AppbarCart extends StatelessWidget {
  final String title;
  const AppbarCart({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(15),
        alignment: Alignment.center,
        child: Row(children: [
          Expanded(
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.arrow_back)))),
          Expanded(
              child: Container(
            alignment: Alignment.center,
            child: Text(
              title,
              style: const TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: Colorapp.primaryColors),
            ),
          )),
          const Spacer(),
        ]));
  }
}
