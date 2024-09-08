import 'package:prj/core/class/crud.dart';
import 'package:prj/linkapi.dart';

class CheckoutData {
  Crud crud;

  CheckoutData(this.crud);

  checkout(Map data) async {
    var response = await crud.postData(Linkapi.addcheckout, data);
    return response.fold((l) => l, (r) => r);
  }
}
