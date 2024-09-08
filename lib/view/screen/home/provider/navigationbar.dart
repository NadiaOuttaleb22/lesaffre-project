import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/controler/home/provider/homescreen_controller.dart';
import 'package:prj/core/constant/color.dart';
import 'package:prj/core/constant/rootes.dart';
import 'package:prj/view/widget/home/provider/ordres/buttonhome_provider.dart';

class HomeScreenProvider extends StatelessWidget {
  const HomeScreenProvider({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomescreenControllerProviderImp());
    return GetBuilder<HomescreenControllerProviderImp>(
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
            bottomNavigationBar: const ButtonhomeProvider(),
            // ignore: deprecated_member_use
            body: WillPopScope(
                child: controller.listpage.elementAt(controller.currentpage),
                onWillPop: () {
                  Get.defaultDialog(
                    title: "Warning",
                    middleText: "Do you wand to Exit ? ",
                    confirmTextColor: Colors.white,
                    buttonColor: Colorapp.red2Color,
                    onConfirm: () {
                      exit(0);
                    },
                    onCancel: () {},
                  );
                  return Future.value(false);
                })));
  }
}
