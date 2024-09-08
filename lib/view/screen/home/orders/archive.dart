import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/controler/home/orders/archive_controller.dart';
import 'package:prj/core/class/handlingdataview.dart';
import 'package:prj/view/widget/home/orders/archivelistcard.dart';

class ArchiveOrders extends StatelessWidget {
  const ArchiveOrders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ArchiveController());
    return Scaffold(
      appBar: AppBar(title: const Text("Orders")),
      body: Container(
          padding: const EdgeInsets.all(10),
          child: GetBuilder<ArchiveController>(
              builder: (controller) => Handlingdataview(
                  statusrequest: controller.statusrequest,
                  widget: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) => Archivelistcard(
                      listdata: controller.data[index],
                    ),
                  )))),
    );
  }
}
