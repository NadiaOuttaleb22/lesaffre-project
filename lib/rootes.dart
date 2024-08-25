import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:prj/core/constant/rootes.dart';
import 'package:prj/core/middlewere/mymiddlewere.dart';
import 'package:prj/view/screen/auth/changePassword.dart';
import 'package:prj/view/screen/forgetPassword/ResetPasword.dart';
import 'package:prj/view/screen/forgetPassword/forgetPass.dart';
import 'package:prj/view/screen/forgetPassword/succesIcon.dart';
import 'package:prj/view/screen/auth/login.dart';
import 'package:prj/view/screen/forgetPassword/succes.dart';
import 'package:prj/view/screen/forgetPassword/verifyCode.dart';
import 'package:prj/view/screen/auth/singup.dart';
import 'package:prj/view/screen/auth/succesiconadd.dart';
import 'package:prj/view/screen/home/cart.dart';
import 'package:prj/view/screen/home/checkout.dart';
import 'package:prj/view/screen/home/items.dart';
import 'package:prj/view/screen/home/myfavorite.dart';
import 'package:prj/view/screen/home/nagivatorbar.dart';
import 'package:prj/view/screen/home/homepage_user_type/normalhomapage.dart';
import 'package:prj/view/screen/home/homepage_user_type/providerhomepage.dart';
import 'package:prj/view/screen/onborging.dart';
import 'package:prj/view/screen/home/productdetails.dart';

List<GetPage<dynamic>>? roote = [
  GetPage(
      name: '/', page: () => const Onborging(), middlewares: [Mymiddlewere()]),

  //GetPage(name: "/", page: () => const CustomCard()),
  //GetPage(name: "/", page: () => const Productdetails()),

  GetPage(name: approote.login, page: () => const Login()),
  GetPage(name: approote.onbording, page: () => const Onborging()),
  GetPage(name: approote.forgetpass, page: () => const Forgetpass()),
  GetPage(name: approote.verifyCode, page: () => const Verifycode()),
  GetPage(name: approote.resetPassword, page: () => const Resetpasword()),
  GetPage(
      name: approote.succesResetPasword, page: () => const SuccesResetPass()),
  GetPage(name: approote.welcome, page: () => const HomeScreen()),
  GetPage(name: approote.changepassword, page: () => const Changepassword()),
  GetPage(name: approote.succesIcon, page: () => const Succesicon()),
  GetPage(name: approote.succesIconAdd, page: () => const Succesiconadd()),
  GetPage(name: approote.signUp, page: () => const Singup()),

  //home page
  GetPage(
      name: approote.providerHomePage, page: () => const Providerhomepage()),
  GetPage(name: approote.normalHomePage, page: () => const Normalhomapage()),
  GetPage(name: approote.itemslunch, page: () => const Items()),

  //product details
  GetPage(name: approote.productdetails, page: () => const Productdetails()),
  //favorite
  GetPage(name: approote.myfavorite, page: () => const Myfavorite()),
  //card
  GetPage(name: approote.card, page: () => const CustomCard()),
  //checkOut

  GetPage(name: approote.checkout, page: () => const Checkout()),
];
