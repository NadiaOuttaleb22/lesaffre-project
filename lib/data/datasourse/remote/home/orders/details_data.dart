import 'package:prj/core/class/crud.dart';
import 'package:prj/linkapi.dart';

class DetailsData {
  Crud crud;

  DetailsData(this.crud);

  getData(String ordersid) async {
    var response = await crud.postData(Linkapi.details, {"id": ordersid});
    return response.fold((l) => l, (r) => r);
  }
}
