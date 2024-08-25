import 'package:get/get.dart';
import 'package:prj/core/class/statusrequest.dart';
import 'package:prj/core/functions/handlingdatacontroller.dart';
import 'package:prj/data/datasourse/remote/test_data.dart';

class TestController extends GetxController {
  TestData testData = TestData(Get.find());

  List data = [];
  late Statusrequest statusrequest;

  getData() async {
    statusrequest = Statusrequest.loading;
    update();
    print("Fetching data...");
    var response = await testData.GetData();
    statusrequest = handlingData(response);
    if (Statusrequest.success == statusrequest) {
      if (response['status'] == 'succes') {
        data.addAll(response['data']);
        print("Data fetched successfully: $data");
      } else {
        statusrequest = Statusrequest.failure;
      }
    } else {
      print("Failed to fetch data: $response");
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
