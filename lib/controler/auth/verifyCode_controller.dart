import 'package:get/get.dart';
import 'package:prj/core/constant/rootes.dart';

abstract class VerifycodeController extends GetxController {
  checkCode();

  goToRessetPassword(String verificationCode);
}

class VerifycodeControllerImp extends VerifycodeController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  goToRessetPassword(verificationCode) {
    Get.offNamed(approote.resetPassword);
  }

  @override
  checkCode() {}
}
