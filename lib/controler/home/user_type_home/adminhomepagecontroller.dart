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

  String? username;
  String? id;
  // Utilisez RxString pour rendre selectedItem observable
  var selectedItem = ''.obs;
  var areRadiosDisabled = false.obs;

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

  selectItem(String? value) {
    selectedItem.value = value!;

    print(selectedItem.value);
    update();
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

  addItems(String itemsid) async {
    //data.clear();
    statusrequest = Statusrequest.loading;
    update();
    var response = await cartData.addToCart(
        myservices.sharedPreferences.getString("id")!, itemsid, 1.toString());
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

  deleteItems(String itemsid) async {
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
      Get.rawSnackbar(
        title: 'Success',
        messageText: const Text('Item successfully submitted!',
            style: TextStyle(color: Colors.white)),
      );
      selectedItem = ''.obs;
      disableRadios();
    } else {
      Get.rawSnackbar(
        title: 'Error',
        messageText: const Text('Please select an item before submitting.',
            style: TextStyle(color: Colors.white)),
      );
    }
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
    }
    update();
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
    } else {}
    update();
  }
}
