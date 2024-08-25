import 'package:get/get.dart';
import 'package:prj/core/constant/rootes.dart';
import 'package:prj/core/services/sercice.dart';

abstract class SettingController extends GetxController {
  logOut();
}

class SettingControllerImp extends SettingController {
  Myservices myservices = Get.find();

  @override
  logOut() {
    myservices.sharedPreferences.clear();
    Get.offAllNamed(approote.login);
  }
}
