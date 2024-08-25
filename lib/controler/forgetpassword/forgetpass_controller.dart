import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/core/class/statusrequest.dart';
import 'package:prj/core/constant/rootes.dart';
import 'package:prj/core/functions/handlingdatacontroller.dart';
import 'package:prj/data/datasourse/remote/forgetPassword/checkemail.dart';

abstract class ForgetpassController extends GetxController {
  checkEmail();
}

class ForgetpassControllerImp extends ForgetpassController {
  CheckemailData checkemailData = CheckemailData(Get.find());

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

  Statusrequest statusrequest = Statusrequest.none;
  @override
  checkEmail() async {
    if (formstate.currentState!.validate()) {
      statusrequest = Statusrequest.loading;
      update();
      var response = await checkemailData.postdata(email.text);
      statusrequest = handlingData(response);
      if (Statusrequest.success == statusrequest) {
        if (response['status'] == 'succes') {
          Get.offNamed(approote.verifyCode,
              arguments: {"userEmail": email.text});
        } else {
          update();
        }
      } else {
        Get.defaultDialog(title: 'Warning', middleText: 'Email Not founds');
        statusrequest = Statusrequest.failure;
      }
      update();
    }
  }
}
