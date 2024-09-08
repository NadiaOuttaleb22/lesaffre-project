import 'dart:io';

import 'package:prj/core/class/crud.dart';
import 'package:prj/linkapi.dart';

class FoodData {
  Crud crud;

  FoodData(this.crud);

  getDataView() async {
    var response = await crud.postData(Linkapi.viewCategories, {});
    return response.fold((l) => l, (r) => r);
  }

  addCategoris(Map data, File file) async {
    var response =
        await crud.addRequestWithImageOne(Linkapi.addCategories, data, file);
    return response.fold((l) => l, (r) => r);
  }

  removeCategoris(Map data) async {
    var response = await crud.postData(Linkapi.removecategories, data);
    return response.fold((l) => l, (r) => r);
  }

  editCategories(Map data, [File? file]) async {
    var response;
    if (file == null) {
      response = await crud.postData(Linkapi.editcategories, data);
    } else {
      response =
          await crud.addRequestWithImageOne(Linkapi.editcategories, data, file);
    }

    return response.fold((l) => l, (r) => r);
  }
}
