import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/controler/forgetpassword/forgetpass_controller.dart';
import 'package:prj/core/class/handlingdataview.dart';
import 'package:prj/core/functions/validateurinput.dart';
import 'package:prj/view/widget/auth/custumButtomAuth.dart';
import 'package:prj/view/widget/auth/logo.dart';
import 'package:prj/view/widget/auth/textformauth.dart';

class Forgetpass extends StatelessWidget {
  const Forgetpass({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetpassControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 251, 251, 251),
          elevation: 0.0,
          title: const Text('Forget Password ',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color.fromARGB(255, 108, 107, 107))),
        ),
        body: GetBuilder<ForgetpassControllerImp>(
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
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: const Text(
                                'please enter your email address to recive a verification code ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey)),
                          ),
                          const SizedBox(height: 50),
                          CustomtextFormAuth(
                            hint: 'Enter Your Email ',
                            iconData: Icons.email_outlined,
                            label: 'Email',
                            mycontroller: controllerImp.email,
                            valid: (val) {
                              return validInput(val!, 5, 100, 'email');
                            },
                          ),
                          const SizedBox(height: 30),
                          custumButtomAuth(
                            text: "Check Email",
                            onPressed: () {
                              controllerImp.checkEmail();
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                )));
  }
}

/* 
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/controler/auth/forgetpass_Controller.dart';
import 'package:prj/core/functions/validateurinput.dart';
import 'package:prj/view/widget/auth/custumButtomAuth.dart';
import 'package:prj/view/widget/auth/logo.dart';
import 'package:prj/view/widget/auth/textformauth.dart';

class Forgetpass extends StatelessWidget {
  const Forgetpass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 251, 251, 251),
          elevation: 0.0,
          title: const Text('Forget Password ',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color.fromARGB(255, 108, 107, 107))),
        ),
        body: GetBuilder<ForgetpassControllerImp>(
            builder: (controllerImp) => Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  child: Form(
                    key: controllerImp.formstate,
                    child: ListView(
                      children: [
                        const LogoAuth(),
                        const SizedBox(height: 10),
                        const SizedBox(height: 20),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: const Text(
                              'please enter your email address to recive a verification code ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey)),
                        ),
                        const SizedBox(height: 50),
                        CustomtextFormAuth(
                          hint: 'Enter Your Email ',
                          iconData: Icons.email_outlined,
                          label: 'Email',
                          mycontroller: controllerImp.email,
                          valid: (val) {
                            return validInput(val!, 5, 100, 'email');
                          },
                        ),
                        const SizedBox(height: 30),
                        custumButtomAuth(
                          text: "Check Email",
                          onPressed: () {
                            controllerImp.checkEmail();
                          },
                        )
                      ],
                    ),
                  ),
                )));
  }
}
 */