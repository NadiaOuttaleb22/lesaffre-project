import 'package:prj/core/class/crud.dart';
import 'package:prj/linkapi.dart';

class MyfavoriteViewData {
  Crud crud;

  MyfavoriteViewData(this.crud);

  // ignore: non_constant_identifier_names
  GetData(String id) async {
    var response =
        await crud.postData(Linkapi.viewfavorite, {"id": id.toString()});
    return response.fold((l) => l, (r) => r);
  }

  deleteDataFromFavorite(String id) async {
    var response =
        await crud.postData(Linkapi.deletefromfavorite, {"id": id.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
