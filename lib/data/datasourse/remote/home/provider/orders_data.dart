import 'package:prj/core/class/crud.dart';
import 'package:prj/linkapi.dart';

class OrdersData {
  Crud crud;

  OrdersData(this.crud);
  //views
  getData() async {
    var response = await crud.postData(Linkapi.neworders, {});
    return response.fold((l) => l, (r) => r);
  }

  getOrdersUnderPreparationData() async {
    var response = await crud.postData(Linkapi.ordersunderpreparation, {});
    return response.fold((l) => l, (r) => r);
  }

  getArchive() async {
    var response = await crud.postData(Linkapi.archiveView, {});
    return response.fold((l) => l, (r) => r);
  }

  getSummary() async {
    var response = await crud.postData(Linkapi.summaryorders, {});
    return response.fold((l) => l, (r) => r);
  }

  getFacture() async {
    var response = await crud.postData(Linkapi.getallfacture, {});
    return response.fold((l) => l, (r) => r);
  }

  //actions
  sendAndPrepareData() async {
    var response = await crud.postData(Linkapi.sendProvider, {});
    return response.fold((l) => l, (r) => r);
  }

  archiveOrders(String ordersid) async {
    var response =
        await crud.postData(Linkapi.archiveProvider, {"ordersid": ordersid});
    return response.fold((l) => l, (r) => r);
  }

  archiveAllOrders() async {
    var response = await crud.postData(Linkapi.archiveall, {});
    return response.fold((l) => l, (r) => r);
  }

  modifyStatusFacture() async {
    var response = await crud.postData(Linkapi.modifystatusfacture, {});
    return response.fold((l) => l, (r) => r);
  }
}
