import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:prj/controler/home/provider/neworders_controller.dart';
import 'package:prj/core/constant/color.dart';
import 'package:prj/core/constant/rootes.dart';
import 'package:prj/core/constant/styles.dart';
import 'package:prj/data/model/oders_model.dart';

class OrdersPreparationList extends GetView<OrdersUnderPreparationController> {
  final OrdersModel listdata;
  const OrdersPreparationList({super.key, required this.listdata});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        margin: const EdgeInsets.only(bottom: 10),
        child: Card(
            color: const Color.fromARGB(255, 231, 233, 233),
            child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              controller.archive(listdata.ordersId.toString());
                              Get.snackbar(
                                  "success", "the orders has been archived");
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueGrey.shade50,
                            ),
                            child: const Icon(
                              Icons.archive_outlined,
                              color: Colors.blueGrey,
                              size: 18,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "Order Number #${listdata.ordersId}",
                            style: Styles.pricestyletext,
                          ),
                          const Spacer(),
                          Text(
                            Jiffy.parse('${listdata.ordersCreate}').fromNow(),
                            style: Styles.hintstyle,
                          ),
                        ],
                      ),
                      const Divider(),
                      Text(
                        "Orders Price: ${listdata.ordersPrice} DH",
                        style: Styles.textnormal,
                      ),
                      Text(
                        "Delivery Price: ${listdata.ordersPricedelivery} DH",
                        style: Styles.textnormal,
                      ),
                      Text(
                        "Status : ${controller.printOrdersStatus(listdata.ordersStatus.toString())}",
                        style: Styles.textnormal,
                      ),
                      const Divider(),
                      /* Row(
                children: [
                  Column(
                    children: [
                      if (listdata.ordersStatus == 1)
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.deepOrange.shade100,

                            border: Border.all(
                              color: Colors.grey, // Couleur du cadre
                              width: 1.0, // Épaisseur du cadre
                            ),
                            borderRadius: BorderRadius.circular(
                                8.0), // Arrondi des coins du cadre
                          ),
                          child: MaterialButton(
                            onPressed: () {
                              controller.onTheWay(listdata.ordersId.toString());
                            },
                            child: const Text(
                              "On the way",
                              style: Styles.textnormal2,
                            ),
                          ),
                        ),
                    ],
                  )
                ],
              ), */

                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Orders Price total: ${listdata.ordersTotalprice} DH",
                              style: Styles.textnormal2,
                            ),
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
