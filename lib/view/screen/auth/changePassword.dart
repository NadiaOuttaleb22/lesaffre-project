import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/controler/auth/changepass_controller.dart';
import 'package:prj/core/class/handlingdataview.dart';
import 'package:prj/core/functions/alertexit.dart';
import 'package:prj/core/functions/validateurinput.dart';
import 'package:prj/view/widget/auth/custumButtomAuth.dart';
import 'package:prj/view/widget/auth/logo.dart';
import 'package:prj/view/widget/auth/textformauth.dart';

class Changepassword extends StatelessWidget {
  const Changepassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ChangepassControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 251, 251, 251),
          elevation: 0.0,
          title: const Text('Change password',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color.fromARGB(255, 108, 107, 107))),
        ),
        // ignore: deprecated_member_use
        body: WillPopScope(
            onWillPop: alertExitApp,
            child: GetBuilder<ChangepassControllerImp>(
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
                                  'do you like change your password ?',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey)),
                            ),
                            const SizedBox(height: 50),
                            CustomtextFormAuth(
                                hint: 'Enter new password',
                                iconData: Icons.password_outlined,
                                label: 'password',
                                mycontroller: controllerImp.newpassword,
                                valid: (val) {
                                  return validInput(val!, 5, 30, 'password');
                                }),
                            const SizedBox(height: 30),
                            CustomtextFormAuth(
                                hint: 'Enter new password',
                                iconData: Icons.password_outlined,
                                label: 'Repassword',
                                mycontroller: controllerImp.Renewpassword,
                                valid: (val) {
                                  return validInput(val!, 5, 30, 'password');
                                }),
                            const SizedBox(height: 30),
                            custumButtomAuth(
                              text: "change",
                              onPressed: () {
                                controllerImp.resetPasword();
                              },
                            ),
                          ],
                        ),
                      ),
                    )))));
  }
}
