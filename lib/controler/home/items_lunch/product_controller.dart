import 'package:get/get.dart';
import 'package:prj/core/class/statusrequest.dart';
import 'package:prj/core/functions/handlingdatacontroller.dart';
import 'package:prj/core/services/sercice.dart';
import 'package:prj/data/datasourse/remote/home/cart_data.dart';
import 'package:prj/data/model/cart_model.dart';
import 'package:prj/data/model/items_lunck_model.dart';

class ProductControllerImp extends GetxController {
  /* AddAndRemovecartController controllerCart =
      Get.put(AddAndRemovecartController()); */

  CartData cartData = CartData(Get.find());
  late Statusrequest statusrequest;
  Myservices myservices = Get.find();
  List<CartModel> data = [];
  double priceorders = 0;
  int totalitems = 0;

  late ItemLunchModel itemLunchModel;

  int countitems = 0;

  addItems(String itemsid) async {
    //data.clear();
    statusrequest = Statusrequest.loading;
    update();
    print("Fetching data...");
    var response = await cartData.addToCart(
        myservices.sharedPreferences.getString("id")!, itemsid, 0.toString());
    statusrequest = handlingData(response);
    if (Statusrequest.success == statusrequest) {
      if (response['status'] == 'succes') {
        Get.snackbar("Success", "Success to add product to cart");

        //data.addAll(response['data']);
        //print("Data fetched successfully: $data");
      } else {
        statusrequest = Statusrequest.failure;
      }
    } else {
      print("Failed to fetch data: $response");
    }
    update();
  }

  deleteItems(String itemsid) async {
    //data.clear();
    statusrequest = Statusrequest.loading;
    update();
    var response = await cartData.deleteFromCart(
        myservices.sharedPreferences.getString("id")!, itemsid);
    statusrequest = handlingData(response);
    if (Statusrequest.success == statusrequest) {
      if (response['status'] == 'succes') {
        Get.snackbar("Success", "Success to remove product to cart");

        //data.addAll(response['data']);
        //print("Data fetched successfully: $data");
      } else {
        statusrequest = Statusrequest.failure;
      }
    } else {}
    update();
  }

  getCountItems(String itemsid) async {
    //data.clear();
    statusrequest = Statusrequest.loading;
    var response = await cartData.getCountItemsCart(
        myservices.sharedPreferences.getString("id")!, itemsid);
    statusrequest = handlingData(response);
    if (Statusrequest.success == statusrequest) {
      if (response['status'] == 'succes') {
        int countitems = 0;

        countitems = response['data'];
        return countitems;
        //data.addAll(response['data']);
      } else {
        statusrequest = Statusrequest.failure;
      }
    } else {}
    update();
  }

  initialdata() async {
    statusrequest = Statusrequest.loading;
    itemLunchModel = Get.arguments['itemsmodel'];
    countitems = await getCountItems(itemLunchModel.itemsId.toString());
    statusrequest = Statusrequest.success;
    update();
  }

  addd() {
    addItems(itemLunchModel.itemsId.toString());
    countitems++;
    update();
  }

  remove() {
    if (countitems > 0) {
      deleteItems(itemLunchModel.itemsId.toString());
      countitems--;
      update();
    }
  }

  @override
  void onInit() {
    initialdata();
    super.onInit();
  }
}
