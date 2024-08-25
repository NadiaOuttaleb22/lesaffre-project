import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/controler/home/homescreen_controller.dart';
import 'package:prj/core/constant/color.dart';
import 'package:prj/core/constant/rootes.dart';
import 'package:prj/view/widget/home/homepage_wegets/botton_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomescreenControllerImp());
    return GetBuilder<HomescreenControllerImp>(
        builder: (controller) => Scaffold(
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colorapp.primaryColors,
              onPressed: () {
                Get.toNamed(approote.card);
              },
              child: const Icon(Icons.shopping_cart_outlined),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: const BottonHome(),
            body: controller.listpage.elementAt(controller.currentpage)));
  }
}
