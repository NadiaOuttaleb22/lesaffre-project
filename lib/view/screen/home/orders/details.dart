import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/controler/home/orders/details_controller.dart';
import 'package:prj/core/class/handlingdataview.dart';
import 'package:prj/core/constant/styles.dart';

class DetailsOrders extends StatelessWidget {
  const DetailsOrders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DetailsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders details"),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: GetBuilder<DetailsController>(
          builder: (controller) => Handlingdataview(
            statusrequest: controller.statusrequest,
            widget: ListView(
              children: [
                Card(
                  child: Column(
                    children: [
                      ...List.generate(controller.data.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "User Name : ${controller.data[index].usersName}",
                                style: Styles.pricestyletext,
                              ),
                              const Divider(),
                              Text(
                                "Item: ${controller.data[index].itemsName}",
                                style: Styles.textnormal,
                              ),
                              const Divider(),
                              Text(
                                "Quantity: ${controller.data[index].countitems}",
                                style: Styles.textnormal,
                              ),
                              const Divider(),
                              Text(
                                "Price: ${controller.data[index].itemsprice} DH",
                                style: Styles.textnormal,
                              ),
                              const Divider(),
                            ],
                          ),
                        );
                      }),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Card(
                          color: const Color.fromARGB(255, 230, 230, 231),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: ListTile(
                              title: Text(
                                "TOTAL: ${controller.ordersmodel.ordersTotalprice} DH",
                                textAlign: TextAlign.center,
                                style: Styles.pricestyletext,
                              ),
                              subtitle: const Text(
                                "Address: LESAFFRE FES HAY NAJJAH",
                                textAlign: TextAlign.center,
                                style: Styles.hintstyle,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
