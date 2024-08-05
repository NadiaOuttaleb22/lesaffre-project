import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:prj/controler/auth/verifyCode_controller.dart';
import 'package:get/get.dart';
//import 'package:prj/view/widget/auth/custumButtomAuth.dart';
import 'package:prj/view/widget/auth/logo.dart';
//import 'package:prj/view/widget/auth/textformauth.dart';

class Verifycode extends StatelessWidget {
  const Verifycode({super.key});

  @override
  Widget build(BuildContext context) {
    VerifycodeControllerImp controllerImp = Get.put(VerifycodeControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 251, 251, 251),
          elevation: 0.0,
          title: const Text('Verification Code ',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color.fromARGB(255, 108, 107, 107))),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
          child: ListView(
            children: [
              const LogoAuth(),
              const SizedBox(height: 10),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text(
                    'please enter the digit code sent to N@gmail.com',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey)),
              ),
              const SizedBox(height: 50),
              OtpTextField(
                borderRadius: BorderRadius.circular(20),
                fieldWidth: 50.0,

                numberOfFields: 5,
                borderColor: const Color(0xFF512DA8),
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {
                  controllerImp.goToRessetPassword(verificationCode);
                }, // end onSubmit
              ),
              /* const SizedBox(height: 30),
              custumButtomAuth(
                text: "Check Code",
                onPressed: () {},
              ) */
            ],
          ),
        ));
  }
}
