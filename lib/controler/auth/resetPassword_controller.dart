/* import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/core/constant/rootes.dart';

abstract class ResetpasswordController extends GetxController {
  resetPasword();

  goToSuccesPassword();
}

class ResetpasswordControllerImp extends ResetpasswordController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController password;
  late TextEditingController repassword;

  @override
  void onInit() {
    password = TextEditingController();
    repassword = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();

    super.dispose();
  }

  @override
  goToSuccesPassword() {
    Get.offNamed(approote.succesIcon);
  }

  @override
  resetPasword() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      Get.offNamed(approote.succesIcon);
      Get.delete<ResetpasswordControllerImp>();
    } else {
      print('not valid');
    }
  }
}
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/core/constant/rootes.dart';

abstract class ResetpasswordController extends GetxController {
  void resetPasword();
  void goToSuccesPassword();
}

class ResetpasswordControllerImp extends ResetpasswordController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController password;
  late TextEditingController repassword;

  @override
  void onInit() {
    super.onInit();
    password = TextEditingController();
    repassword = TextEditingController();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
    super.dispose();
  }

  @override
  void goToSuccesPassword() {
    Get.offNamed(approote.succesIcon);
  }

  @override
  void resetPasword() {
    // Safeguard to ensure formstate is not null
    final formdata = formstate.currentState;

    if (formdata == null) {
      print('Form state is not initialized.');
      return;
    }

    if (formdata.validate()) {
      goToSuccesPassword();
      /* Get.delete<
          ResetpasswordControllerImp>(); */ // Consider if you really need to delete the controller here
    } else {
      print('Form is not valid.');
    }
  }

  bool isShowPassword = true;
  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }
}
