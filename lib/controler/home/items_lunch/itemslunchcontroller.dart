import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/controler/home/user_type_home/adminhomepagecontroller.dart';
import 'package:prj/core/class/statusrequest.dart';
import 'package:prj/core/constant/rootes.dart';
import 'package:prj/core/functions/handlingdatacontroller.dart';
import 'package:prj/core/services/sercice.dart';
import 'package:prj/data/datasourse/remote/home/items_lunch.dart';
import 'package:prj/data/model/items_lunck_model.dart';

abstract class Itemslunchcontroller extends SearchMixController {
  initialData();
  changeCat(int val, String catval);
  getitems(String id);
  goToPageProduct(ItemLunchModel itemLunchModel);
}

class ItemslunchcontrollerImp extends Itemslunchcontroller {
  List categories = [];
  String? categoriesid;
  int? selectedCat;
  Myservices myservices = Get.find();
  ItemsLunchData itemsLunchData = ItemsLunchData(Get.find());
  List data = [];

  @override
  initialData() {
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedCat'];
    categoriesid = Get.arguments["categoriesid"];

    getitems(categoriesid!);
  }

  @override
  void onInit() {
    search = TextEditingController();

    initialData();
    super.onInit();
  }

  @override
  getitems(id) async {
    data.clear();
    statusrequest = Statusrequest.loading;
    update();
    var response = await itemsLunchData.GetData(
        id, myservices.sharedPreferences.getString("id")!);
    statusrequest = handlingData(response);
    if (Statusrequest.success == statusrequest) {
      if (response['status'] == 'succes') {
        data.addAll(response['data']);
      } else {
        statusrequest = Statusrequest.failure;
      }
    }
    update();
  }

  @override
  changeCat(val, catval) {
    selectedCat = val;
    categoriesid = catval;
    getitems(categoriesid!);

    update();
  }

  @override
  goToPageProduct(itemLunchModel) {
    Get.toNamed(approote.productdetails, arguments: {
      "itemsmodel": itemLunchModel,
    });
  }
}
