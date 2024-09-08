import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/controler/home/admin/adminhomepagecontroller.dart';
import 'package:prj/core/class/statusrequest.dart';
import 'package:prj/core/functions/handlingdatacontroller.dart';
import 'package:prj/core/services/sercice.dart';
import 'package:prj/data/datasourse/remote/home/cart_data.dart';
import 'package:prj/data/datasourse/remote/home/home_data.dart';
import 'package:prj/data/model/items_lunck_model.dart';

class OffersController extends SearchMixController {
  Myservices myservices = Get.find();
  HomeData homeData = HomeData(Get.find());
  ItemLunchModel itemLunchModel = ItemLunchModel();
  CartData cartData = CartData(Get.find());

  List categories = [];
  List items = [];

  @override
  void onInit() {
    search = TextEditingController();

    getdata();
    super.onInit();
  }

  selectItem(String? value) {
    selectedItem.value = value!;

    print(selectedItem.value);
    update();
  }

  // Utilisez RxString pour rendre selectedItem observable
  var selectedItem = ''.obs;
  var areRadiosDisabled = false.obs;
  getdata() async {
    statusrequest = Statusrequest.loading;
    update();
    var response = await homeData.GetData();
    statusrequest = handlingData(response);
    if (Statusrequest.success == statusrequest) {
      if (response['status'] == 'succes') {
        categories.addAll(response['categories_lunch']);
        items.addAll(response['items_lunch']);
      } else {
        statusrequest = Statusrequest.failure;
      }
    }
    update();
  }

  addItems(String itemsid) async {
    //data.clear();
    statusrequest = Statusrequest.loading;
    update();
    var response = await cartData.addToCart(
        myservices.sharedPreferences.getString("id")!, itemsid, 1.toString());
    statusrequest = handlingData(response);
    if (Statusrequest.success == statusrequest) {
      if (response['status'] == 'succes') {
        Get.snackbar("succes", "succes to add product to cart");
        //data.addAll(response['data']);
        //print("Data fetched successfully: $data");
      } else {
        statusrequest = Statusrequest.failure;
      }
    }
    update();
  }

  addd() {
    addItems(itemLunchModel.itemsId.toString());
    update();
  }

  void disableRadios() {
    areRadiosDisabled.value = true;

    // Réactiver les radios après un certain temps
    Future.delayed(const Duration(minutes: 1), () {
      areRadiosDisabled.value = false;
      update();
    });
  }

  submitSelectedItem() async {
    if (selectedItem.value.isNotEmpty) {
      await addItems(selectedItem.value);
      Get.snackbar("Success", "Item successfully submitted!");

      selectedItem = ''.obs;
      disableRadios();
    } else {
      Get.snackbar("Error", "Please select an item before submitting.");
    }
  }
}
