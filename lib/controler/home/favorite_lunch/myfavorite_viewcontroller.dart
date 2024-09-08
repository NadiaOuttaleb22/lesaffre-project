import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/controler/home/admin/adminhomepagecontroller.dart';
import 'package:prj/core/class/statusrequest.dart';
import 'package:prj/core/functions/handlingdatacontroller.dart';
import 'package:prj/core/services/sercice.dart';
import 'package:prj/data/datasourse/remote/home/myfavorite_view_data.dart';
import 'package:prj/data/model/myfavorite_model.dart';

abstract class MyfavoriteViewcontroller extends SearchMixController {
  Getdata();
  deleteFromFavorite(String favoriteid);
}

class MyfavoriteViewcontrollerImp extends MyfavoriteViewcontroller {
  MyfavoriteViewData myfavoriteViewData = MyfavoriteViewData(Get.find());

  List<MyFavoriteModel> data = [];

  Myservices myservices = Get.find();

  @override
  Getdata() async {
    //data.clear();
    statusrequest = Statusrequest.loading;
    var response = await myfavoriteViewData.GetData(
        myservices.sharedPreferences.getString("id")!);
    statusrequest = handlingData(response);
    if (Statusrequest.success == statusrequest) {
      if (response['status'] == 'succes') {
        List responsedata = response['data'];
        data.addAll(responsedata.map((e) => MyFavoriteModel.fromJson(e)));
      } else {
        statusrequest = Statusrequest.failure;
      }
    }
    update();
  }

  @override
  deleteFromFavorite(favoriteid) {
    /*  data.clear();
    statusrequest = Statusrequest.loading;
    print("Fetching data..."); */
    myfavoriteViewData.deleteDataFromFavorite(favoriteid);
    /* statusrequest = handlingData(response);
    if (Statusrequest.success == statusrequest) {
      if (response['status'] == 'succes') { */
    /* List responsedata = response['data'];
        data.addAll(responsedata.map((e) => MyFavoriteModel.fromJson(e)));
        print("data $data"); */
    data.removeWhere((element) => element.favoriteId.toString() == favoriteid);
    /* } else {
        statusrequest = Statusrequest.failure;
      }
    } else {
      print("Failed to fetch data: $response");
    } */
    update();
  }

  @override
  void onInit() {
    search = TextEditingController();
    Getdata();
    super.onInit();
  }
}
