import 'dart:io';

import 'package:prj/core/class/crud.dart';
import 'package:prj/linkapi.dart';

class ItemsData {
  Crud crud;

  ItemsData(this.crud);

  getDataItems(String id) async {
    var response = await crud.postData(Linkapi.viewItems, {"id": id});
    return response.fold((l) => l, (r) => r);
  }

  addItems(Map data, File file) async {
    var response =
        await crud.addRequestWithImageOne(Linkapi.addItems, data, file);
    return response.fold((l) => l, (r) => r);
  }

  removeItems(Map data) async {
    var response = await crud.postData(Linkapi.removeItems, data);
    return response.fold((l) => l, (r) => r);
  }

  editItems(Map data, [File? file]) async {
    var response;
    if (file == null) {
      response = await crud.postData(Linkapi.editItems, data);
    } else {
      response =
          await crud.addRequestWithImageOne(Linkapi.editItems, data, file);
    }

    return response.fold((l) => l, (r) => r);
  }
}
