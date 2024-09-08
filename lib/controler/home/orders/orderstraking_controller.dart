import 'package:get/get.dart';
import 'package:prj/core/class/statusrequest.dart';
import 'package:prj/core/functions/handlingdatacontroller.dart';
import 'package:prj/core/services/sercice.dart';
import 'package:prj/data/datasourse/remote/home/orders/orderstraking_data.dart';
import 'package:prj/data/model/oders_model.dart';

class OrderstrakingController extends GetxController {
  Myservices myservices = Get.find();
  OrderstrakingData orderstrakingData = OrderstrakingData(Get.find());
  List<OrdersModel> data = [];
  Statusrequest statusrequest = Statusrequest.none;

  getOrders() async {
    data.clear();
    statusrequest = Statusrequest.loading;
    update();
    var response = await orderstrakingData
        .getData(myservices.sharedPreferences.getString("id")!);
    statusrequest = handlingData(response);
    if (Statusrequest.success == statusrequest) {
      if (response['status'] == 'succes') {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusrequest = Statusrequest.failure;
      }
    }
    update();
  }

  deleteOrders(String ordersid) async {
    data.clear();
    statusrequest = Statusrequest.loading;
    update();
    var response = await orderstrakingData.deleteData(ordersid);
    statusrequest = handlingData(response);
    if (Statusrequest.success == statusrequest) {
      if (response['status'] == 'succes') {
        getOrders();
      } else {
        statusrequest = Statusrequest.failure;
      }
    }
    update();
  }

  printOrdersStatus(String val) {
    if (val == "0") {
      return "await Approval";
    } else if (val == "1") {
      return "The order is Being Prepare";
    } else if (val == "2") {
      return "On the way";
    } else {
      return "Archive";
    }
  }

  @override
  void onInit() {
    getOrders();

    super.onInit();
  }
}
