class SummaryModel {
  var itemsName;
  var totalOrders;
  var totalPrice;

  SummaryModel({this.itemsName, this.totalOrders, this.totalPrice});

  SummaryModel.fromJson(Map<String, dynamic> json) {
    itemsName = json['items_name'];
    totalOrders = json['total_orders'];
    totalPrice = json['total_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['items_name'] = this.itemsName;
    data['total_orders'] = this.totalOrders;
    data['total_price'] = this.totalPrice;
    return data;
  }
}
