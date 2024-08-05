import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/core/class/statusrequest.dart';
import 'package:prj/core/constant/rootes.dart';
import 'package:prj/core/functions/handlingdatacontroller.dart';
import 'package:prj/data/datasourse/remote/auth/signupb.dart';

abstract class SingupController extends GetxController {
  gotoSucces();
}

class SingupControllerImp extends SingupController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController loginn;
  late TextEditingController password;
  late TextEditingController email;
  late TextEditingController username;

  bool isShowPassword = true;
  String access = "1";
  String typeUser = "1";

  late Statusrequest statusrequest;

  showPassword() {
    isShowPassword = !isShowPassword;
    update();
  }

  updateRadio(String? value) {
    access = value!;
    update();
  }

  updateRadioUser(String? value) {
    typeUser = value!;
    update();
  }

  SignupData signupData = SignupData(Get.find());

  List data = [];

  @override
  gotoSucces() async {
    if (formstate.currentState!.validate()) {
      statusrequest = Statusrequest.loading;
      update();
      print("Fetching data...");
      var response = await signupData.postdata(username.text, loginn.text,
          email.text, password.text, access, typeUser);
      print('=====================awit');
      statusrequest = handlingData(response);
      if (Statusrequest.success == statusrequest) {
        if (response['status'] == 'success') {
          Get.offNamed(approote.succesIconAdd);
        } else {
          update();
          Get.defaultDialog(
              title: 'Warning', middleText: 'Email Already Exists');
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
    username = TextEditingController();
    email = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    loginn.dispose();
    password.dispose();
    username.dispose();
    email.dispose();
    super.dispose();
  }
}
