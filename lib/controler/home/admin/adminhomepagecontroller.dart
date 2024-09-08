import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/core/class/statusrequest.dart';
import 'package:prj/core/constant/rootes.dart';
import 'package:prj/core/functions/handlingdatacontroller.dart';
import 'package:prj/core/services/sercice.dart';
import 'package:prj/data/datasourse/remote/home/cart_data.dart';
import 'package:prj/data/datasourse/remote/home/home_data.dart';
import 'package:prj/data/model/items_lunck_model.dart';

abstract class Adminhomepagecontroller extends SearchMixController {
  gotoSignUp();
  initialData();
  goToItems(List categories, int selectedCat, String categoryid);
  getdata();
}

class AdminhomepagecontrollerImp extends Adminhomepagecontroller {
  Myservices myservices = Get.find();
  HomeData homeData = HomeData(Get.find());
  CartData cartData = CartData(Get.find());

  ItemLunchModel itemLunchModel = ItemLunchModel();

  List categories = [];
  List items = [];
  List settings = [];
  String titlesetting = "";
  String bodysetting = "";

  String? username;
  String? id;

  @override
  initialData() {
    //selectedItem.value = itemLunchModel.itemsId.toString();

    username = myservices.sharedPreferences.getString('name');
    id = myservices.sharedPreferences.getString('id');
  }

  @override
  void onInit() {
    search = TextEditingController();
    initialData();
    getdata();
    super.onInit();
  }

  @override
  getdata() async {
    statusrequest = Statusrequest.loading;

    update();
    var response = await homeData.GetData();
    statusrequest = handlingData(response);
    if (Statusrequest.success == statusrequest) {
      if (response['status'] == 'succes') {
        categories.addAll(response['categories_lunch']);
        items.addAll(response['items_lunch']);
        settings.addAll(response['setting']);
        titlesetting = settings[0]['setting_title'];
        bodysetting = settings[0]['setting_body'];
      } else {
        statusrequest = Statusrequest.failure;
      }
    }
    update();
  }

  @override
  goToItems(categories, selectedCat, categoryid) {
    Get.toNamed(approote.itemslunch, arguments: {
      "categories": categories,
      "selectedCat": selectedCat,
      "categoriesid": categoryid
    });
  }

  goToPageProduct(itemLunchModel) {
    Get.toNamed(approote.productdetails, arguments: {
      "itemsmodel": itemLunchModel,
    });
  }

  @override
  gotoSignUp() {
    Get.toNamed(approote.signUp);
  }
}

class SearchMixController extends GetxController {
  bool isSearch = false;
  TextEditingController? search;
  List<ItemLunchModel> listdata = [];
  HomeData homeData = HomeData(Get.find());
  Statusrequest statusrequest = Statusrequest.none;

  checkSearch(val) {
    if (val == "") {
      statusrequest = Statusrequest.none;
      isSearch = false;
      update();
      return false;
    }
  }

  bool isSearchFieldNotEmpty() {
    return search!.text.isNotEmpty ? false : true;
  }

  onSearchitems() {
    isSearch = true;
    searchData();
    update();
  }

  searchData() async {
    statusrequest = Statusrequest.loading;
    update();
    var response = await homeData.searchData(search!.text);
    statusrequest = handlingData(response);
    if (Statusrequest.success == statusrequest) {
      if (response['status'] == 'succes') {
        listdata.clear();
        List responsedata = response['data'];
        listdata.addAll(responsedata.map((e) => ItemLunchModel.fromJson(e)));
      } else {
        statusrequest = Statusrequest.failure;
      }
    } else {
      statusrequest = Statusrequest.none;
      Get.snackbar("Warning", "Not Found");
    }
    update();
  }
}
