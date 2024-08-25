import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/core/class/statusrequest.dart';
import 'package:prj/core/constant/rootes.dart';
import 'package:prj/core/functions/handlingdatacontroller.dart';
import 'package:prj/core/services/sercice.dart';
import 'package:prj/data/datasourse/remote/auth/changepassword.dart';

abstract class ChangepassController extends GetxController {
  resetPasword();

  goToWelcome();
}

class ChangepassControllerImp extends ChangepassController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController newpassword;
  late TextEditingController Renewpassword;

  String? login;
  List data = [];
  Statusrequest statusrequest = Statusrequest.none;
  ChangepasswordData changepasswordData = ChangepasswordData(Get.find());
  Myservices myservices = Get.find();

  @override
  void onInit() {
    newpassword = TextEditingController();
    Renewpassword = TextEditingController();

    login = Get.arguments['userLogin'];
    super.onInit();
  }

  @override
  void dispose() {
    newpassword.dispose();

    super.dispose();
  }

  @override
  goToWelcome() {
    Get.offNamed(approote.welcome);
  }

  @override
  resetPasword() async {
    if (newpassword.text != Renewpassword.text) {
      return Get.defaultDialog(
          title: 'Warning', middleText: 'Password Not match');
    }
    if (formstate.currentState!.validate()) {
      statusrequest = Statusrequest.loading;
      update();
      var response =
          await changepasswordData.postdata(login!, newpassword.text);
      statusrequest = handlingData(response);
      if (Statusrequest.success == statusrequest) {
        if (response['status'] == 'succes') {
          myservices.sharedPreferences
              .setString('id', response['data']['users_id'].toString());
          myservices.sharedPreferences
              .setString('login', response['data']['users_login']);
          myservices.sharedPreferences
              .setString('name', response['data']['users_name']);
          myservices.sharedPreferences
              .setString('email', response['data']['users_email']);
          myservices.sharedPreferences
              .setString('password', response['data']['users_password']);
          myservices.sharedPreferences
              .setString('typeuser', response['data']['users_type']);
          myservices.sharedPreferences
              .setString('acces', response['data']['users_acces']);
          myservices.sharedPreferences.setString('step', '2');

          data.add(response['data']);
          String userType = response['data']['users_type'];
          if (userType == '1') {
            Get.offNamed(approote.normalHomePage);
          } else if (userType == '2') {
            Get.offNamed(approote.welcome);
          } else {
            Get.offNamed(approote.providerHomePage);
          }
        }
      } else {
        Get.defaultDialog(title: 'Warning', middleText: 'try again');
        statusrequest = Statusrequest.failure;
      }
      update();
    }
  }
}
