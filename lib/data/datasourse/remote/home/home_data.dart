import 'package:prj/core/class/crud.dart';
import 'package:prj/linkapi.dart';

class HomeData {
  Crud crud;

  HomeData(this.crud);
  GetData() async {
    var response = await crud.postData(Linkapi.homelunch, {});
    return response.fold((l) => l, (r) => r);
  }

  searchData(String search) async {
    var response = await crud.postData(Linkapi.search, {"search": search});
    return response.fold((l) => l, (r) => r);
  }
}
