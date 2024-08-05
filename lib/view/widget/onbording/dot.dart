import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/controler/onboControler.dart';
import 'package:prj/data/datasourse/static/static.dart';

class Dottcontroler extends StatelessWidget {
  const Dottcontroler({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Onbocontrolerimp>(
        builder: (controller) => Row(
              // no9at
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    onbordinglist.length,
                    (index) => AnimatedContainer(
                          margin: const EdgeInsets.only(right: 7),
                          duration: const Duration(milliseconds: 900),
                          width: controller.currentpage == index ? 20 : 5,
                          height: 6,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 179, 12, 87),
                              borderRadius: BorderRadius.circular(10)),
                        ))
              ],
            ));
  }
}
