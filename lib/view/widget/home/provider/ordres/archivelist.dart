import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:prj/controler/home/provider/neworders_controller.dart';
import 'package:prj/core/constant/color.dart';
import 'package:prj/core/constant/rootes.dart';
import 'package:prj/core/constant/styles.dart';
import 'package:prj/data/model/oders_model.dart';

class Archivelist extends GetView<ArchiveProviderController> {
  final OrdersModel listdata;
  const Archivelist({super.key, required this.listdata});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Card(
            color: const Color.fromARGB(255, 231, 233, 233),
            child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Text(
                          "Order Number #${listdata.ordersId}",
                          style: Styles.pricestyletext,
                        ),
                        const Spacer(),
                        Text(Jiffy.parse('${listdata.ordersCreate}').fromNow(),
                            style: Styles.hintstyle)
                      ]),
                      const Divider(),
                      Text("Orders Price: ${listdata.ordersPrice} DH",
                          style: Styles.textnormal),
                      Text("Delivery Price: ${listdata.ordersPricedelivery} DH",
                          style: Styles.textnormal),
                      Text(
                          "Status : ${controller.printOrdersStatus(listdata.ordersStatus.toString())}",
                          style: Styles.textnormal),
                      const Divider(),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                "Orders Price total: ${listdata.ordersTotalprice} DH",
                                style: Styles.textnormal2),
                            const Spacer(),
                            MaterialButton(
                                onPressed: () {
                                  Get.toNamed(approote.ordersdetails,
                                      arguments: {"ordersmodel": listdata});
                                },
                                color: Colorapp.red2Color,
                                child: const Text("details",
                                    style: Styles.textnormal))
                          ])
                    ]))));
  }
}
