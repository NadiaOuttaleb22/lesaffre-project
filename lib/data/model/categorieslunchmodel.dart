class CategoriesLunchModel {
  int? categoriesId;
  String? categoriesName;
  String? categoriesImage;
  String? categoriesCreate;

  CategoriesLunchModel(
      {this.categoriesId,
      this.categoriesName,
      this.categoriesImage,
      this.categoriesCreate});

  CategoriesLunchModel.fromJson(Map<String, dynamic> json) {
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesImage = json['categories_image'];
    categoriesCreate = json['categories_create'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categories_id'] = this.categoriesId;
    data['categories_name'] = this.categoriesName;
    data['categories_image'] = this.categoriesImage;
    data['categories_create'] = this.categoriesCreate;
    return data;
  }
}
