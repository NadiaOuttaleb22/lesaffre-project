class FactureModel {
  var usersId;
  var usersName;
  var totalPrice;
  var totalOrders;

  FactureModel(
      {this.usersId, this.usersName, this.totalPrice, this.totalOrders});

  FactureModel.fromJson(Map<String, dynamic> json) {
    usersId = json['users_id'];
    usersName = json['users_name'];
    totalPrice = json['total_price'];
    totalOrders = json['total_orders'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['users_id'] = this.usersId;
    data['users_name'] = this.usersName;
    data['total_price'] = this.totalPrice;
    data['total_orders'] = this.totalOrders;
    return data;
  }
}
