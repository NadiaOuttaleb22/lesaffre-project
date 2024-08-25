import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:prj/core/class/statusrequest.dart';
import 'package:prj/core/functions/handlingdatacontroller.dart';
import 'package:prj/core/services/sercice.dart';
import 'package:prj/data/datasourse/remote/home/favorite_luch_data.dart';

class FavoriteController extends GetxController {
  Map isfavorite = {};
  FavoriteLuchData favoriteLuchData = FavoriteLuchData(Get.find());
  // List data = [];
  late Statusrequest statusrequest;
  Myservices myservices = Get.find();

  setFavorite(id, value) {
    isfavorite[id] = value;
    update();
  }

  addFavorite(String itemsid) async {
    //data.clear();
    statusrequest = Statusrequest.loading;
    print("Fetching data...");
    var response = await favoriteLuchData.addFavorite(
        myservices.sharedPreferences.getString("id")!, itemsid);
    statusrequest = handlingData(response);
    if (Statusrequest.success == statusrequest) {
      if (response['status'] == 'succes') {
        Get.rawSnackbar(
            title: 'succes',
            messageText: const Text('succes to add product to favorite'));

        //data.addAll(response['data']);
        //print("Data fetched successfully: $data");
      } else {
        statusrequest = Statusrequest.failure;
      }
    } else {
      print("Failed to fetch data: $response");
    }
  }

  removeFavorite(String itemsid) async {
    //data.clear();
    statusrequest = Statusrequest.loading;
    print("Fetching data...");
    var response = await favoriteLuchData.removeFavorite(
        myservices.sharedPreferences.getString("id")!, itemsid);
    statusrequest = handlingData(response);
    if (Statusrequest.success == statusrequest) {
      if (response['status'] == 'succes') {
        Get.rawSnackbar(
            title: 'succes',
            messageText: const Text('succes to remove product to favorite'));
        //data.addAll(response['data']);
        // print("Data fetched successfully: $data");
      } else {
        statusrequest = Statusrequest.failure;
      }
    } else {
      print("Failed to fetch data: $response");
    }
  }
}
