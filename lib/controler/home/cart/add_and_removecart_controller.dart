import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/core/class/statusrequest.dart';
import 'package:prj/core/functions/handlingdatacontroller.dart';
import 'package:prj/core/services/sercice.dart';
import 'package:prj/data/datasourse/remote/home/cart_data.dart';
import 'package:prj/data/model/cart_model.dart';
import 'package:prj/data/model/coupon_model.dart';

class AddAndRemovecartController extends GetxController {
  TextEditingController? controllercoupon;
  CartData cartData = CartData(Get.find());
  late Statusrequest statusrequest;
  Myservices myservices = Get.find();
  List<CartModel> data = [];
  double priceorders = 0.0;
  int totalitems = 0;
  CouponModel? couponModel;
  int? discountcoupon = 0;
  String? nameofcoupon;

  @override
  void onInit() {
    controllercoupon = TextEditingController();
    super.onInit();
    View(); // Charge les données lors de l'initialisation du contrôleur
  }

  add(String itemsid) async {
    //data.clear();
    statusrequest = Statusrequest.loading;
    update();
    var response = await cartData.addToCart(
        myservices.sharedPreferences.getString("id")!, itemsid, 0.toString());
    statusrequest = handlingData(response);
    if (Statusrequest.success == statusrequest) {
      if (response['status'] == 'succes') {
        Get.rawSnackbar(
            title: 'succes',
            messageText: const Text('succes to add product to cart',
                style: TextStyle(color: Colors.white)));

        //data.addAll(response['data']);
        //print("Data fetched successfully: $data");
      } else {
        statusrequest = Statusrequest.failure;
      }
    }
    update();
  }

  delete(String itemsid) async {
    //data.clear();
    statusrequest = Statusrequest.loading;
    update();
    var response = await cartData.deleteFromCart(
        myservices.sharedPreferences.getString("id")!, itemsid);
    statusrequest = handlingData(response);
    if (Statusrequest.success == statusrequest) {
      if (response['status'] == 'succes') {
        Get.rawSnackbar(
            title: 'succes',
            messageText: const Text(
              'succes to remove product to cart',
              style: TextStyle(color: Colors.white),
            ));

        //data.addAll(response['data']);
        //print("Data fetched successfully: $data");
      } else {
        statusrequest = Statusrequest.failure;
      }
    } else {}
    update();
  }

  View() async {
    statusrequest = Statusrequest.loading;
    update();
    data.clear();

    var response =
        await cartData.viewCart(myservices.sharedPreferences.getString("id")!);
    statusrequest = handlingData(response);

    if (Statusrequest.success == statusrequest) {
      if (response['status'] == 'succes') {
        if (response['data']['status'] == 'succes') {
          data.clear();
          var dataresponse = response['data']['data'];
          var dataresponsecountprice = response['countprice'];

          data.clear();

          data.addAll(List<CartModel>.from(
              dataresponse.map((e) => CartModel.fromJson(e))));

          totalitems =
              int.parse(dataresponsecountprice['totalcount'].toString());
          priceorders =
              double.parse(dataresponsecountprice['totalprice'].toString());
        }
      } else {
        statusrequest = Statusrequest.failure;
      }
    }

    update();
  }

  checkCoupon() async {
    //data.clear();
    statusrequest = Statusrequest.loading;
    update();
    var response = await cartData.checkCoupon(controllercoupon!.text);
    statusrequest = handlingData(response);
    if (Statusrequest.success == statusrequest) {
      if (response['status'] == 'succes') {
        Map<String, dynamic> datacoupon = response['data'];
        couponModel = CouponModel.fromJson(datacoupon);
        discountcoupon = int.parse(couponModel!.couponDiscount.toString());
        nameofcoupon = couponModel!.couponName;
      }
    } else {
      statusrequest = Statusrequest.none;
      discountcoupon = 0;
      nameofcoupon = null;
    }
    update();
  }

  getTotalPriceOreder() {
    return (priceorders - priceorders * discountcoupon! / 100);
  }

  resetVar() {
    totalitems = 0;
    priceorders = 0.0;
    data.clear();
  }

  refreshPage() {
    resetVar();
    View();
  }
}
