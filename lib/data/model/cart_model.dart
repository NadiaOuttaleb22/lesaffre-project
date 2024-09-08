class CartModel {
  var itemsprice;
  var countitems;
  var cardItemsid;
  var cardUsersid;
  var cardOrders;
  var itemsId;
  var itemsName;
  var itemsPrice;
  var itemsDiscount;
  var itemsImage;
  var usersName;

  CartModel(
      {this.itemsprice,
      this.countitems,
      this.cardItemsid,
      this.cardUsersid,
      this.cardOrders,
      this.itemsId,
      this.itemsName,
      this.itemsPrice,
      this.itemsDiscount,
      this.itemsImage,
      this.usersName});

  CartModel.fromJson(Map<String, dynamic> json) {
    itemsprice = json['itemsprice'];
    countitems = json['countitems'];
    cardItemsid = json['card_itemsid'];
    cardUsersid = json['card_usersid'];
    cardOrders = json['card_orders'];
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsImage = json['items_image'];
    usersName = json['users_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemsprice'] = this.itemsprice;
    data['countitems'] = this.countitems;
    data['card_itemsid'] = this.cardItemsid;
    data['card_usersid'] = this.cardUsersid;
    data['card_orders'] = this.cardOrders;
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_price'] = this.itemsPrice;
    data['items_discount'] = this.itemsDiscount;
    data['items_image'] = this.itemsImage;
    data['users_name'] = this.usersName;
    return data;
  }
}
