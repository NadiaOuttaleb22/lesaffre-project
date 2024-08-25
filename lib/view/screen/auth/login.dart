import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/controler/auth/signin_controler.dart';
import 'package:prj/core/class/handlingdataview.dart';
import 'package:prj/core/functions/alertexit.dart';
import 'package:prj/core/functions/validateurinput.dart';
import 'package:prj/view/widget/auth/custumButtomAuth.dart';
import 'package:prj/view/widget/auth/logo.dart';
import 'package:prj/view/widget/auth/textformauth.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SigninControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 251, 251, 251),
          elevation: 0.0,
          title: const Text('Sign In ',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color.fromARGB(255, 108, 107, 107))),
        ),
        // ignore: deprecated_member_use
        body: WillPopScope(
            onWillPop: alertExitApp,
            child: GetBuilder<SigninControllerImp>(
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
                              const Text('WELCOME',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(height: 20),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: const Text(
                                    'Sign In With Your Login And Password',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey)),
                              ),
                              const SizedBox(height: 50),
                              CustomtextFormAuth(
                                hint: 'Enter Your Login ',
                                iconData: Icons.login_sharp,
                                label: 'Login',
                                mycontroller: controllerImp.loginn,
                                valid: (val) {
                                  return validInput(val!, 5, 100, 'login');
                                },

                                //mycontroler
                              ),
                              const SizedBox(height: 30),
                              GetBuilder<SigninControllerImp>(
                                  builder: (controllerImp) =>
                                      CustomtextFormAuth(
                                        obscuretxt:
                                            controllerImp.isShowPassword,
                                        onTapIcon: () {
                                          controllerImp.showPassword();
                                        },
                                        hint: 'Enter Your Password ',
                                        iconData: Icons.lock_outlined,
                                        label: 'Password',
                                        mycontroller: controllerImp.password,
                                        valid: (val) {
                                          return validInput(
                                              val!, 5, 30, 'password');
                                        },
                                      )),
                              const SizedBox(height: 20),
                              InkWell(
                                  onTap: () {
                                    controllerImp.gotoForgetPasword();
                                  },
                                  child: const Text("Forget Password",
                                      textAlign: TextAlign.end)),
                              custumButtomAuth(
                                text: "Sign In ",
                                onPressed: () {
                                  controllerImp.login();
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ))));
  }
}
