import 'package:prj/core/class/crud.dart';
import 'package:prj/linkapi.dart';

class OrderstrakingData {
  Crud crud;

  OrderstrakingData(this.crud);

  getData(String userid) async {
    var response = await crud.postData(Linkapi.orderstraking, {
      "id": userid.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String ordersid) async {
    var response = await crud.postData(Linkapi.delete, {"ordersid": ordersid});
    return response.fold((l) => l, (r) => r);
  }
}
