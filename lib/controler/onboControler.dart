import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/core/constant/rootes.dart';
import 'package:prj/core/services/sercice.dart';
import 'package:prj/data/datasourse/static/static.dart';

abstract class Onbocontroler extends GetxController {
  next();
  onpagechanged(int index);
}

class Onbocontrolerimp extends Onbocontroler {
  int currentpage = 0;
  late PageController pageController;

  Myservices myservices = Get.find();

  @override
  next() {
    currentpage++;
    if (currentpage > onbordinglist.length - 1) {
      myservices.sharedPreferences.setString('onboarding', '1');
      Get.offAllNamed(approote.login);
    } else {
      pageController.animateToPage(currentpage,
          duration: const Duration(microseconds: 900), curve: Curves.easeInOut);
    }
  }

  @override
  onpagechanged(int index) {
    currentpage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
