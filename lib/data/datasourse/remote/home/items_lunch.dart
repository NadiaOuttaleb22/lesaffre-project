import 'package:prj/core/class/crud.dart';
import 'package:prj/linkapi.dart';

class ItemsLunchData {
  Crud crud;

  ItemsLunchData(this.crud);

  // ignore: non_constant_identifier_names
  GetData(String id, String userid) async {
    var response = await crud.postData(
        Linkapi.itemslunch, {"id": id.toString(), "iduser": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
