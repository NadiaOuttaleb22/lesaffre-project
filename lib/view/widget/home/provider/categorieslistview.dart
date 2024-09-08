import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/controler/home/provider/neworders_controller.dart';
import 'package:prj/controler/home/provider/categories_contorollers.dart';
import 'package:prj/core/class/handlingdataview.dart';
import 'package:prj/view/widget/home/provider/ordres/neworderslist.dart';

class Categorieslistview extends GetView<ProviderfoodController> {
  const Categorieslistview({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProviderfoodController());
    return Container(
        padding: const EdgeInsets.all(10),
        child: GetBuilder<NewordersController>(
            builder: ((controller) => Handlingdataview(
                statusrequest: controller.statusrequest,
                widget: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: ((context, index) =>
                        Neworderslist(listdata: controller.data[index])))))));
  }
}
