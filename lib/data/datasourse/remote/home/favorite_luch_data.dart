import 'package:prj/core/class/crud.dart';
import 'package:prj/linkapi.dart';

class FavoriteLuchData {
  Crud crud;

  FavoriteLuchData(this.crud);

  addFavorite(String usersid, String itemsid) async {
    var response = await crud.postData(Linkapi.addfavorite, {
      "favorite_usersid": usersid.toString(),
      "favorite_itemsid": itemsid.toString()
    });
    return response.fold((l) => l, (r) => r);
  }

  removeFavorite(String usersid, String itemsid) async {
    var response = await crud.postData(Linkapi.removefavorite, {
      "favoriteusersid": usersid.toString(),
      "favoriteitemsid": itemsid.toString()
    });
    return response.fold((l) => l, (r) => r);
  }
}
