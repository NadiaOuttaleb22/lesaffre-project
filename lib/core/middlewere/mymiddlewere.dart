import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:prj/core/constant/rootes.dart';
import 'package:prj/core/services/sercice.dart';

class Mymiddlewere extends GetMiddleware {
  @override
  int? get priority => 1;

  Myservices myservices = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if (myservices.sharedPreferences.getString('step') == '2') {
      if (myservices.sharedPreferences.getString('typeuser') == '1') {
        return const RouteSettings(name: approote.normalHomePage);
      } else if (myservices.sharedPreferences.getString('typeuser') == '2') {
        return const RouteSettings(name: approote.welcome);
      } else if (myservices.sharedPreferences.getString('typeuser') == '3') {
        return const RouteSettings(name: approote.providerHomePage);
      }
    }
    if (myservices.sharedPreferences.getString('step') == '1') {
      return const RouteSettings(name: approote.login);
    }

    return null;
  }
}
