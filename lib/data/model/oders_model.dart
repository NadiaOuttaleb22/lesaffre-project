class OrdersModel {
  var ordersId;
  var ordersUsersid;
  var ordersPricedelivery;
  var ordersPrice;
  var ordersCoupon;
  var ordersTotalprice;
  var ordersStatus;
  var ordersCreate;

  OrdersModel(
      {this.ordersId,
      this.ordersUsersid,
      this.ordersPricedelivery,
      this.ordersPrice,
      this.ordersCoupon,
      this.ordersTotalprice,
      this.ordersStatus,
      this.ordersCreate});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersUsersid = json['orders_usersid'];
    ordersPricedelivery = json['orders_pricedelivery'];
    ordersPrice = json['orders_price'];
    ordersCoupon = json['orders_coupon'];
    ordersTotalprice = json['orders_totalprice'];
    ordersStatus = json['orders_status'];
    ordersCreate = json['orders_create'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orders_id'] = this.ordersId;
    data['orders_usersid'] = this.ordersUsersid;
    data['orders_pricedelivery'] = this.ordersPricedelivery;
    data['orders_price'] = this.ordersPrice;
    data['orders_coupon'] = this.ordersCoupon;
    data['orders_totalprice'] = this.ordersTotalprice;
    data['orders_status'] = this.ordersStatus;
    data['orders_create'] = this.ordersCreate;
    return data;
  }
}
