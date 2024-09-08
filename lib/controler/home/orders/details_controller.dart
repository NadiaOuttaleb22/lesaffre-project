import 'package:get/get.dart';
import 'package:prj/core/class/statusrequest.dart';
import 'package:prj/core/functions/handlingdatacontroller.dart';
import 'package:prj/data/datasourse/remote/home/orders/details_data.dart';
import 'package:prj/data/model/cart_model.dart';
import 'package:prj/data/model/oders_model.dart';

class DetailsController extends GetxController {
  late OrdersModel ordersmodel;

  DetailsData detailsData = DetailsData(Get.find());

  List<CartModel> data = [];
  late Statusrequest statusrequest;

  getData() async {
    statusrequest = Statusrequest.loading;
    update();
    var response = await detailsData.getData(ordersmodel.ordersId.toString());
    statusrequest = handlingData(response);
    if (Statusrequest.success == statusrequest) {
      if (response['status'] == 'succes') {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => CartModel.fromJson(e)));
      } else {
        statusrequest = Statusrequest.failure;
      }
    } else {}
    update();
  }

  @override
  void onInit() {
    statusrequest = Statusrequest.none;
    ordersmodel = Get.arguments['ordersmodel'];
    getData();

    super.onInit();
  }
}
