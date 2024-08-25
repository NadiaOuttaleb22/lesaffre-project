class ItemLunchModel {
  int? itemsId;
  String? itemsName;
  String? itemsDesc;
  String? itemsImage;
  int? itemsActive;
  int? itemsPrice; //////////////////////
  int? itemsDiscount;
  String? itemsCreate;
  int? itemsCat;
  int? categoriesId;
  String? categoriesName;
  String? categoriesImage;
  String? categoriesCreate;
  int? favorite;

  ItemLunchModel(
      {this.itemsId,
      this.itemsName,
      this.itemsDesc,
      this.itemsImage,
      this.itemsActive,
      this.itemsPrice,
      this.itemsDiscount,
      this.itemsCreate,
      this.itemsCat,
      this.categoriesId,
      this.categoriesName,
      this.categoriesImage,
      this.categoriesCreate,
      this.favorite});

  ItemLunchModel.fromJson(Map<String, dynamic> json) {
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsDesc = json['items_desc'];
    itemsImage = json['items_image'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsCreate = json['items_create'];
    itemsCat = json['items_cat'];
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesImage = json['categories_image'];
    categoriesCreate = json['categories_create'];
    favorite = json['favorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_desc'] = this.itemsDesc;
    data['items_image'] = this.itemsImage;
    data['items_active'] = this.itemsActive;
    data['items_price'] = this.itemsPrice;
    data['items_discount'] = this.itemsDiscount;
    data['items_create'] = this.itemsCreate;
    data['items_cat'] = this.itemsCat;
    data['categories_id'] = this.categoriesId;
    data['categories_name'] = this.categoriesName;
    data['categories_image'] = this.categoriesImage;
    data['categories_create'] = this.categoriesCreate;
    data['favorite'] = this.favorite;
    return data;
  }
}
