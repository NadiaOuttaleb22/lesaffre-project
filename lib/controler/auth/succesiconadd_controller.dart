import 'package:get/get.dart';
import 'package:prj/core/constant/rootes.dart';

abstract class SuccesiconaddController extends GetxController {
  gotoPageWelcome();
}

class SuccesiconaddControllerImp extends SuccesiconaddController {
  @override
  gotoPageWelcome() {
    Get.offNamed(approote.welcome);
  }
}
