import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/core/constant/rootes.dart';

abstract class ForgetpassController extends GetxController {
  checkEmail();

  go_To_Verify_code();
}

class ForgetpassControllerImp extends ForgetpassController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;

  @override
  void onInit() {
    email = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  @override
  go_To_Verify_code() {
    Get.offNamed(approote.verifyCode);
  }

  @override
  checkEmail() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      Get.offNamed(approote.verifyCode);
      //Get.delete<ForgetpassControllerImp>();
    } else {
      print('not valid');
    }
  }
}
