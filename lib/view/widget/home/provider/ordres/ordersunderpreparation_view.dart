import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/controler/home/provider/neworders_controller.dart';
import 'package:prj/core/class/handlingdataview.dart';
import 'package:prj/core/class/statusrequest.dart';
import 'package:prj/view/widget/home/provider/ordres/orders_preparation_list.dart';

class OrdersunderpreparationView
    extends GetView<OrdersUnderPreparationController> {
  const OrdersunderpreparationView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersUnderPreparationController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Orders Under Preparation"),
        ),
        body: Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              ElevatedButton(
                  onPressed: () {
                    controller.underpreparationdata.isNotEmpty
                        ? (
                            controller.archiveAllData(),
                            Get.snackbar(
                                "Success", "All Orders Has Been Archived")
                          )
                        : Get.snackbar("failure", "No data");
                  },
                  child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.archive_outlined),
                        SizedBox(width: 20),
                        Text("Archive all")
                      ])),
              const SizedBox(height: 8),
              Expanded(
                  child: GetBuilder<OrdersUnderPreparationController>(
                      builder: (controller) => Handlingdataview(
                          statusrequest:
                              controller.underpreparationdata.isNotEmpty
                                  ? controller.statusrequest
                                  : Statusrequest.none,
                          widget: ListView.builder(
                              itemCount: controller.underpreparationdata.length,
                              itemBuilder: (context, index) =>
                                  OrdersPreparationList(
                                      listdata: controller
                                          .underpreparationdata[index])))))
            ])));
  }
}
