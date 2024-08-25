import 'package:flutter/material.dart';

import 'package:prj/controler/forgetpassword/resetPassword_controller.dart';
import 'package:get/get.dart';
import 'package:prj/core/class/handlingdataview.dart';
import 'package:prj/core/functions/alertexit.dart';
import 'package:prj/core/functions/validateurinput.dart';
//import 'package:prj/controler/auth/forgetpass_Controller.dart';
import 'package:prj/view/widget/auth/custumButtomAuth.dart';
import 'package:prj/view/widget/auth/logo.dart';
import 'package:prj/view/widget/auth/textformauth.dart';
//import 'package:prj/view/widget/auth/textformauth.dart';

class Resetpasword extends StatelessWidget {
  const Resetpasword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetpasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 251, 251, 251),
          elevation: 0.0,
          title: const Text('Reset Password',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color.fromARGB(255, 108, 107, 107))),
        ),
        // ignore: deprecated_member_use
        body: WillPopScope(
            onWillPop: alertExitApp,
            child: GetBuilder<ResetpasswordControllerImp>(
                builder: (controllerImp) => HandlingdatRequest(
                    statusrequest: controllerImp.statusrequest,
                    widget: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 40),
                      child: Form(
                        key: controllerImp.formstate,
                        child: ListView(
                          children: [
                            const LogoAuth(),
                            const SizedBox(height: 10),
                            const SizedBox(height: 20),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: const Text(
                                  'please enter your new password',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey)),
                            ),
                            const SizedBox(height: 50),
                            GetBuilder<ResetpasswordControllerImp>(
                                builder: (controllerImp) => CustomtextFormAuth(
                                      obscuretxt: controllerImp.isShowPassword,
                                      onTapIcon: () {
                                        controllerImp.showPassword();
                                      },
                                      hint: 'Enter Your New Password ',
                                      iconData: Icons.lock_outlined,
                                      label: 'Password',
                                      mycontroller: controllerImp.password,
                                      valid: (val) {
                                        return validInput(
                                            val!, 5, 30, 'password');
                                      },
                                    )),
                            const SizedBox(height: 20),
                            GetBuilder<ResetpasswordControllerImp>(
                                builder: (controllerImp) => CustomtextFormAuth(
                                      obscuretxt: controllerImp.isShowPassword,
                                      onTapIcon: () {
                                        controllerImp.showPassword();
                                      },
                                      hint: 'Re Enter Your Password ',
                                      iconData: Icons.lock_outlined,
                                      label: 'Password',
                                      mycontroller: controllerImp.repassword,
                                      valid: (val) {
                                        return validInput(
                                            val!, 5, 30, 'repassword');
                                      },
                                    )),
                            const SizedBox(height: 30),
                            custumButtomAuth(
                              text: "Save",
                              onPressed: () {
                                controllerImp.resetPasword();
                              },
                            )
                          ],
                        ),
                      ),
                    )))));
  }
}
