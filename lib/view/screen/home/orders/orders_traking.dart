import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/controler/home/orders/orderstraking_controller.dart';
import 'package:prj/core/class/handlingdataview.dart';
import 'package:prj/view/widget/home/orders/orderslistcard.dart';

class OrdersTraking extends StatelessWidget {
  const OrdersTraking({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderstrakingController());
    return Scaffold(
      appBar: AppBar(title: const Text("Orders")),
      body: Container(
          padding: const EdgeInsets.all(10),
          child: GetBuilder<OrderstrakingController>(
              builder: (controller) => Handlingdataview(
                  statusrequest: controller.statusrequest,
                  widget: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) => CardOrderslist(
                      listdata: controller.data[index],
                    ),
                  )))),
    );
  }
}
