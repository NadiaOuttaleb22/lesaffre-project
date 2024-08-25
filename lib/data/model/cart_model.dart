class CartModel {
  double? itemsprice;
  int? countitems;
  int? cardId;
  int? cardUsersid;
  int? cardItemsid;
  int? dicount;
  int? itemsId;
  String? itemsName;
  String? itemsDesc;
  String? itemsImage;
  int? itemsActive;
  int? itemsPrice;
  int? itemsDiscount;
  String? itemsCreate;
  int? itemsCat;

  CartModel(
      {this.itemsprice,
      this.countitems,
      this.cardId,
      this.cardUsersid,
      this.cardItemsid,
      this.dicount,
      this.itemsId,
      this.itemsName,
      this.itemsDesc,
      this.itemsImage,
      this.itemsActive,
      this.itemsPrice,
      this.itemsDiscount,
      this.itemsCreate,
      this.itemsCat});

  CartModel.fromJson(Map<String, dynamic> json) {
    itemsprice = (json['itemsprice'] as num?)?.toDouble();
    countitems = json['countitems'];
    cardId = json['card_id'];
    cardUsersid = json['card_usersid'];
    cardItemsid = json['card_itemsid'];
    dicount = json['dicount'];
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsDesc = json['items_desc'];
    itemsImage = json['items_image'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsCreate = json['items_create'];
    itemsCat = json['items_cat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemsprice'] = this.itemsprice;
    data['countitems'] = this.countitems;
    data['card_id'] = this.cardId;
    data['card_usersid'] = this.cardUsersid;
    data['card_itemsid'] = this.cardItemsid;
    data['dicount'] = this.dicount;
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_desc'] = this.itemsDesc;
    data['items_image'] = this.itemsImage;
    data['items_active'] = this.itemsActive;
    data['items_price'] = this.itemsPrice;
    data['items_discount'] = this.itemsDiscount;
    data['items_create'] = this.itemsCreate;
    data['items_cat'] = this.itemsCat;
    return data;
  }
}
