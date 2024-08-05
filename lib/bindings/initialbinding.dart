import 'package:get/get.dart';
import 'package:prj/core/class/crud.dart';

class Initialbindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}
