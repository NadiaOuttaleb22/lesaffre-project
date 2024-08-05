import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:prj/core/class/statusrequest.dart';
import 'package:prj/core/constant/rootes.dart';
import 'package:prj/core/functions/handlingdatacontroller.dart';
import 'package:prj/data/datasourse/remote/auth/loginb.dart';

abstract class SigninControler extends GetxController {
  login();
  gotoForgetPasword();
  gotochangepassword();
}

class SigninControllerImp extends SigninControler {
  LoginData loginData = LoginData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController loginn;
  late TextEditingController password;
  Statusrequest? statusrequest;

  bool isShowPassword = true;
  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  @override
  login() async {
    if (formstate.currentState!.validate()) {
      statusrequest = Statusrequest.loading;
      update();
      print("Fetching data...");
      var response = await loginData.postdata(loginn.text, password.text);
      print('=====================awit');
      statusrequest = handlingData(response);
      if (Statusrequest.success == statusrequest) {
        if (response['status'] == 'success') {
          Get.offNamed(approote.changepassword);
        } else {
          update();
          Get.defaultDialog(
              title: 'Warning', middleText: 'Email Or password not exists');
          statusrequest = Statusrequest.failure;
        }
        print('fin=============');
      } else {
        print("Failed to fetch data: $response");
      }
      update();
      // You can handle the radio value here if needed
      //
    } else {
      print('not valid');
    }
  }

  @override
  void onInit() {
    loginn = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    loginn.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  gotoForgetPasword() {
    Get.offNamed(approote.forgetpass);
  }

  @override
  gotochangepassword() {
    Get.offNamed(approote.changepassword);
  }
}
