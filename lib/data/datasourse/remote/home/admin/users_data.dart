import 'package:prj/core/class/crud.dart';
import 'package:prj/linkapi.dart';

class UsersData {
  Crud crud;

  UsersData(this.crud);

  getDataUsers() async {
    var response = await crud.postData(Linkapi.viewUsers, {});
    return response.fold((l) => l, (r) => r);
  }

  getDetails(String id) async {
    var response = await crud.postData(Linkapi.detailsUsers, {"id": id});
    return response.fold((l) => l, (r) => r);
  }

  addUsers(Map data) async {
    var response = await crud.postData(Linkapi.addUsers, data);
    return response.fold((l) => l, (r) => r);
  }

  removeUsers(String id) async {
    var response = await crud.postData(Linkapi.removeUsers, {"users_id": id});
    return response.fold((l) => l, (r) => r);
  }

  editUsers(Map data) async {
    var response = await crud.postData(Linkapi.editUsers, data);
    return response.fold((l) => l, (r) => r);
  }
}
