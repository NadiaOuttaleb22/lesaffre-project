import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/core/constant/rootes.dart';

abstract class ChangepassController extends GetxController {
  resetPasword();

  goToWelcome();
}

class ChangepassControllerImp extends ChangepassController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController newpassword;

  @override
  void onInit() {
    newpassword = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    newpassword.dispose();

    super.dispose();
  }

  @override
  goToWelcome() {
    Get.toNamed(approote.welcome);
  }

  @override
  resetPasword() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      Get.offNamed(approote.welcome);
    } else {
      print('not valid');
    }
  }
}
