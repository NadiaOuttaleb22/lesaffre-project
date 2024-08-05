import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:prj/core/services/sercice.dart';

class localController extends GetxController {
  Locale? lang;
  Myservices myservices = Get.find();

  changelang(String codelang) {
    Locale locale = Locale(codelang);
    myservices.sharedPreferences.setString("lang", codelang);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? langsherdpref = myservices.sharedPreferences.getString("lang");

    if (langsherdpref == 'fr') {
      lang = const Locale('fr');
    } else if (langsherdpref == 'en') {
      lang = const Locale('en');
    } else {
      lang = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}
