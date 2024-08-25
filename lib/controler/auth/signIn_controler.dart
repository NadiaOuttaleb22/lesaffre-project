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
  Statusrequest statusrequest = Statusrequest.none;

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
      var response = await loginData.postdata(loginn.text, password.text);
      statusrequest = handlingData(response);
      if (Statusrequest.success == statusrequest) {
        if (response['status'] == 'succes') {
          Get.offNamed(approote.changepassword,
              arguments: {"userLogin": loginn.text});
        } else {
          update();
        }
      } else {
        Get.defaultDialog(
            title: 'Warning', middleText: 'Login Or password not Corrects');
        statusrequest = Statusrequest.failure;
      }
      update();
    }
  }

  @override
  void onInit() {
    /* FirebaseMessaging.instance.getToken().then((value) {
      print("vale: $value");
      String? token = value;
    }); */
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
