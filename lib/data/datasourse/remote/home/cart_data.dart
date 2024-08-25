import 'package:prj/core/class/crud.dart';
import 'package:prj/linkapi.dart';

class CartData {
  Crud crud;

  CartData(this.crud);

  addToCart(String usersid, String itemsid, String discount) async {
    var response = await crud.postData(Linkapi.cardadd, {
      "cart_usersid": usersid.toString(),
      "card_itemsid": itemsid.toString(),
      "dicount": discount.toString()
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteFromCart(String usersid, String itemsid) async {
    var response = await crud.postData(Linkapi.cardremove, {
      "cart_usersid": usersid.toString(),
      "card_itemsid": itemsid.toString()
    });
    return response.fold((l) => l, (r) => r);
  }

  getCountItemsCart(String usersid, String itemsid) async {
    var response = await crud.postData(Linkapi.cardcount, {
      "cart_usersid": usersid.toString(),
      "card_itemsid": itemsid.toString()
    });
    return response.fold((l) => l, (r) => r);
  }

  viewCart(String usersid) async {
    var response = await crud.postData(Linkapi.cardview, {
      "cart_usersid": usersid.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  checkCoupon(String couponname) async {
    var response = await crud.postData(Linkapi.checkcoupon, {
      "couponname": couponname.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
