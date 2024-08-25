import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/controler/onboControler.dart';
import 'package:prj/view/widget/onbording/costumbutn.dart';
import 'package:prj/view/widget/onbording/dot.dart';
import 'package:prj/view/widget/onbording/slider.dart';

class Onborging extends StatelessWidget {
  const Onborging({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(Onbocontrolerimp());
    return const Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Expanded(flex: 3, child: Slidercostum()),
        Expanded(
            flex: 1,
            child: Column(
              children: [
                Dottcontroler(),
                Spacer(flex: 2),
                costumbutn(),
              ],
            ))
      ],
    )));
  }
}
