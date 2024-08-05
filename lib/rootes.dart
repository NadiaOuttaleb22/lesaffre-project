//import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:prj/core/constant/rootes.dart';
import 'package:prj/core/middlewere/mymiddlewere.dart';
import 'package:prj/view/screen/auth/changePassword.dart';
import 'package:prj/view/screen/auth/forgetPassword/ResetPasword.dart';
import 'package:prj/view/screen/auth/forgetPassword/forgetPass.dart';
import 'package:prj/view/screen/auth/forgetPassword/succesIcon.dart';
import 'package:prj/view/screen/auth/login.dart';
import 'package:prj/view/screen/auth/forgetPassword/succes.dart';
import 'package:prj/view/screen/auth/forgetPassword/verifyCode.dart';
import 'package:prj/view/screen/auth/singup.dart';
import 'package:prj/view/screen/auth/succesiconadd.dart';
import 'package:prj/view/screen/onborging.dart';
import 'package:prj/view/widget/welcome.dart';

List<GetPage<dynamic>>? roote = [
  GetPage(
      name: '/', page: () => const Onborging(), middlewares: [Mymiddlewere()]),

  //GetPage(name: "/", page: () => const TestView()),
  //GetPage(name: "/", page: () => const Forgetpass()),

  GetPage(name: approote.login, page: () => const Login()),
  GetPage(name: approote.onbording, page: () => const Onborging()),
  GetPage(name: approote.forgetpass, page: () => const Forgetpass()),
  GetPage(name: approote.verifyCode, page: () => const Verifycode()),
  GetPage(name: approote.resetPassword, page: () => const Resetpasword()),
  GetPage(
      name: approote.succesResetPasword, page: () => const SuccesResetPass()),
  GetPage(name: approote.welcome, page: () => const Welcome()),
  GetPage(name: approote.changepassword, page: () => const Changepassword()),
  GetPage(name: approote.succesIcon, page: () => const Succesicon()),
  GetPage(name: approote.succesIconAdd, page: () => const Succesiconadd()),
  GetPage(name: approote.signUp, page: () => const Singup()),
];
/* 
Map<String, Widget Function(BuildContext)> routes = {
  approote.login: (context) => const Login(),
  approote.onbording: (context) => const Onborging(),
  approote.forgetpass: (context) => const Forgetpass(),
  approote.verifyCode: (context) => const Verifycode(),
  approote.resetPassword: (context) => const Resetpasword(),
  approote.succesResetPasword: (context) => const SuccesResetPass(),
  approote.welcome: (context) => const Welcome(),
  approote.changepassword: (context) => const Changepassword(),
  approote.succesIcon: (context) => const Succesicon(),
};
 */