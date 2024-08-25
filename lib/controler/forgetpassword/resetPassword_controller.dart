import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/core/class/statusrequest.dart';
import 'package:prj/core/constant/rootes.dart';
import 'package:prj/core/functions/handlingdatacontroller.dart';
import 'package:prj/data/datasourse/remote/forgetPassword/resetpassword.dart';

abstract class ResetpasswordController extends GetxController {
  void resetPasword();
  void goToSuccesPassword();
}

class ResetpasswordControllerImp extends ResetpasswordController {
  Statusrequest statusrequest = Statusrequest.none;
  ResetpasswordData resetpasswordData = ResetpasswordData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController password;
  late TextEditingController repassword;
  String? email;

  @override
  void onInit() {
    super.onInit();
    email = Get.arguments['userEmail'];
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
  void resetPasword() async {
    // Safeguard to ensure formstate is not null
    final formdata = formstate.currentState;

    if (formdata == null) {
      print('Form state is not initialized.');
      return;
    }
    if (password.text != repassword.text) {
      Get.defaultDialog(title: 'Warning', middleText: 'Password Not match');
    } else {
      if (formstate.currentState!.validate()) {
        statusrequest = Statusrequest.loading;
        update();
        print("Fetching data...");
        var response =
            await resetpasswordData.postdata(email!, repassword.text);
        print('=====================await');
        statusrequest = handlingData(response);
        if (Statusrequest.success == statusrequest) {
          if (response['status'] == 'succes') {
            Get.offNamed(approote.succesIcon);
          }
          print('fin=============');
        } else {
          print("Failed to fetch data: $response");
          Get.defaultDialog(title: 'Warning', middleText: 'try again');
          statusrequest = Statusrequest.failure;
        }
        update();
      } else {
        print('not valid');
      }
    }
  }

  bool isShowPassword = true;
  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }
}
