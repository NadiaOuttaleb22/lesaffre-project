import 'package:get/get.dart';
import 'package:prj/core/class/statusrequest.dart';
import 'package:prj/core/functions/handlingdatacontroller.dart';
import 'package:prj/core/services/sercice.dart';
import 'package:prj/data/datasourse/remote/home/provider/orders_data.dart';
import 'package:prj/data/model/facture_model.dart';
import 'package:prj/data/model/oders_model.dart';
import 'package:prj/data/model/summary_model.dart';

class NewordersController extends GetxController {
  OrdersData ordersData = OrdersData(Get.find());
  List<SummaryModel> summarydata = [];
  List<OrdersModel> data = [];
  Statusrequest statusrequest = Statusrequest.none;

  getOrders() async {
    data.clear();
    statusrequest = Statusrequest.loading;
    update();
    var response = await ordersData.getData();
    statusrequest = handlingData(response);
    if (Statusrequest.success == statusrequest) {
      if (response['status'] == 'succes') {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
      }
    } else {
      Get.snackbar("failure", "No data1");
    }
    update();
  }

  getSummaryOrders() async {
    summarydata.clear();
    statusrequest = Statusrequest.loading;
    update();
    var response = await ordersData.getSummary();
    statusrequest = handlingData(response);
    if (Statusrequest.success == statusrequest) {
      if (response['status'] == 'succes') {
        List listdata = response['data'];
        summarydata.addAll(listdata.map((e) => SummaryModel.fromJson(e)));
      }
    } else {
      Get.snackbar("failure", "No data3");
    }

    update();
  }

  sendAndPrepare() async {
    //data.clear();
    statusrequest = Statusrequest.loading;
    update();
    var response = await ordersData.sendAndPrepareData();
    statusrequest = handlingData(response);
    if (Statusrequest.success == statusrequest) {
      if (response['status'] == 'succes') {
        Get.snackbar("Success", "the orders was approved");
        getOrders();
      } else {
        statusrequest = Statusrequest.failure;
      }
    }

    update();
  }

  printOrdersStatus(String val) {
    if (val == "0") {
      return "waiting send...";
    } else if (val == "1") {
      return "The order is Being Prepare";
    } else {
      return "archive";
    }
  }

  @override
  void onInit() {
    getOrders();
    getSummaryOrders();

    super.onInit();
  }
}

class OrdersUnderPreparationController extends GetxController {
  Myservices myservices = Get.find();
  OrdersData ordersData = OrdersData(Get.find());
  List<SummaryModel> summarydata = [];
  List<OrdersModel> dataarchive = [];
  List<OrdersModel> data = [];
  List<OrdersModel> underpreparationdata = [];
  Statusrequest statusrequest = Statusrequest.none;

  getOrdersUnderPreparation() async {
    underpreparationdata.clear();
    statusrequest = Statusrequest.loading;
    update();
    var response = await ordersData.getOrdersUnderPreparationData();
    statusrequest = handlingData(response);
    if (Statusrequest.success == statusrequest) {
      if (response['status'] == 'succes') {
        List listdata = response['data'];
        underpreparationdata
            .addAll(listdata.map((e) => OrdersModel.fromJson(e)));
      }
    } else {
      Get.snackbar("failure", "No data2");
    }

    update();
  }

  archiveAllData() async {
    //data.clear();
    statusrequest = Statusrequest.loading;
    update();
    var response = await ordersData.archiveAllOrders();
    statusrequest = handlingData(response);
    if (Statusrequest.success == statusrequest) {
      if (response['status'] == 'succes') {
        Get.snackbar("Success", "the orders was approved");
        getOrdersUnderPreparation();
      } else {
        statusrequest = Statusrequest.failure;
      }
    }

    update();
  }

  archive(String ordersid) async {
    //data.clear();
    statusrequest = Statusrequest.loading;
    update();
    var response = await ordersData.archiveOrders(ordersid);
    statusrequest = handlingData(response);
    if (Statusrequest.success == statusrequest) {
      if (response['status'] == 'succes') {
        Get.snackbar("Success", "the orders was archived");
        getOrdersUnderPreparation();
      } else {
        statusrequest = Statusrequest.failure;
      }
    }
    update();
  }

  printOrdersStatus(String val) {
    if (val == "0") {
      return "waiting send...";
    } else if (val == "1") {
      return "The order is Being Prepare";
    } else {
      return "archive";
    }
  }

  @override
  void onInit() {
    getOrdersUnderPreparation();
    super.onInit();
  }
}

class ArchiveProviderController extends GetxController {
  OrdersData ordersData = OrdersData(Get.find());
  List<OrdersModel> dataarchive = [];
  Statusrequest statusrequest = Statusrequest.none;
  getArchive() async {
    dataarchive.clear();
    statusrequest = Statusrequest.loading;
    update();
    var response = await ordersData.getArchive();
    statusrequest = handlingData(response);
    if (Statusrequest.success == statusrequest) {
      if (response['status'] == 'succes') {
        List listdata = response['data'];
        dataarchive.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
      }
    } else {
      Get.snackbar("failure", "No dataaaaaaaaaaaaaaaaa");
    }

    update();
  }

  printOrdersStatus(String val) {
    if (val == "0") {
      return "waiting send...";
    } else if (val == "1") {
      return "The order is Being Prepare";
    } else {
      return "archive";
    }
  }

  @override
  void onInit() {
    getArchive();

    super.onInit();
  }
}

class FactureController extends GetxController {
  OrdersData ordersData = OrdersData(Get.find());
  List<FactureModel> data = [];
  Statusrequest statusrequest = Statusrequest.none;

  getFacture() async {
    data.clear();
    statusrequest = Statusrequest.loading;
    update();
    var response = await ordersData.getFacture();
    statusrequest = handlingData(response);
    if (Statusrequest.success == statusrequest) {
      if (response['status'] == 'succes') {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => FactureModel.fromJson(e)));
      }
    } else {
      Get.snackbar("failure", "No data1");
    }
    update();
  }

  changeStatus() async {
    //data.clear();
    statusrequest = Statusrequest.loading;
    update();
    var response = await ordersData.modifyStatusFacture();
    statusrequest = handlingData(response);
    if (Statusrequest.success == statusrequest) {
      if (response['status'] == 'succes') {
        //Get.snackbar("Success", "the orders was approved");
      } else {
        statusrequest = Statusrequest.failure;
      }
    }

    update();
  }

  @override
  void onInit() {
    getFacture();
    super.onInit();
  }
}
