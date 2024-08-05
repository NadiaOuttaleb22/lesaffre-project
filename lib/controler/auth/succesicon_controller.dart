import 'package:get/get.dart';
import 'package:prj/core/constant/rootes.dart';

abstract class SuccesiconController extends GetxController {
  gotoPageLogin();
}

class SuccesiconControllerImp extends SuccesiconController {
  @override
  gotoPageLogin() {
    Get.offNamed(approote.login);
  }
}
