import 'package:get/get.dart';
import 'package:prj/controler/auth/forgetpass_Controller.dart';

class Mybinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgetpassControllerImp(), fenix: true);
    //Get.lazyPut(() => (), fenix: true);
  }
}
