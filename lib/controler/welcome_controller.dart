import 'package:get/get.dart';
import 'package:prj/core/constant/rootes.dart';

abstract class WelcomeController extends GetxController {
  gotoSignUp();
}

class WelcomeControllerImp extends WelcomeController {
  @override
  gotoSignUp() {
    Get.toNamed(approote.signUp);
  }
}
