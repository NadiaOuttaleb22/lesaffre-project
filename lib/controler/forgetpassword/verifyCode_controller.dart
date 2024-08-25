import 'package:get/get.dart';
import 'package:prj/core/class/statusrequest.dart';
import 'package:prj/core/constant/rootes.dart';
import 'package:prj/core/functions/handlingdatacontroller.dart';
import 'package:prj/data/datasourse/remote/forgetPassword/verifycode.dart';

abstract class VerifycodeController extends GetxController {
  checkCode();
  resend();

  goToRessetPassword(String verificationCode);
}

class VerifycodeControllerImp extends VerifycodeController {
  String? email;
  VerifycodeData verifycodeData = VerifycodeData(Get.find());
  Statusrequest statusrequest = Statusrequest.none;

  @override
  void onInit() {
    super.onInit();
    email = Get.arguments['userEmail'];
  }

  @override
  goToRessetPassword(verificationCode) async {
    statusrequest = Statusrequest.loading;
    update();
    print("Fetching data...");
    var response = await verifycodeData.postdata(email!, verificationCode);
    print('=====================await');
    statusrequest = handlingData(response);
    if (Statusrequest.success == statusrequest) {
      if (response['status'] == 'succes') {
        Get.offNamed(approote.resetPassword, arguments: {'userEmail': email});
      } else {
        update();
      }
      print('fin=============');
    } else {
      print("Failed to fetch data: $response");
      Get.defaultDialog(title: 'Warning', middleText: 'Code not correct');
      statusrequest = Statusrequest.failure;
    }
    update();
  }

  @override
  checkCode() {}

  @override
  resend() {
    verifycodeData.resendData(email!);
  }
}
