import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/controler/home/items_lunch/product_controller.dart';
import 'package:prj/core/class/handlingdataview.dart';
import 'package:prj/core/constant/color.dart';
import 'package:prj/core/constant/rootes.dart';
import 'package:prj/view/widget/home/productdaitails/price_and_amount.dart';
import 'package:prj/view/widget/home/productdaitails/topstack.dart';

class Productdetails extends StatelessWidget {
  const Productdetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductControllerImp());
    return GetBuilder<ProductControllerImp>(
        builder: (controller) => Scaffold(
            bottomNavigationBar: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              height: 55,
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Colorapp.primaryColors,
                onPressed: () {
                  /* controller.controllerCart.refreshPage(); */
                  Get.toNamed(approote.card);
                },
                child: const Text(
                  'Go to card',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            body: GetBuilder<ProductControllerImp>(
                builder: (controllerImp) => Handlingdataview(
                    statusrequest: controllerImp.statusrequest,
                    widget: ListView(children: [
                      const Topstack(),
                      const SizedBox(height: 50),
                      Container(
                          padding: const EdgeInsets.all(20),
                          child: Column(children: [
                            Text(
                              "${controllerImp.itemLunchModel.itemsName}",
                              style: const TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                  color: Colorapp.thirdColor),
                            ),
                            const SizedBox(height: 20),
                            PriceAndAmount(
                                onPressedplus: () {
                                  controllerImp.addd();

                                },
                                onPressedminus: () {
                                  controllerImp.remove();
                                },
                                count: controllerImp.countitems.toString(),
                                price: controllerImp.itemLunchModel.itemsPrice
                                    .toString()),
                            const SizedBox(height: 20),
                            Text(
                              "${controllerImp.itemLunchModel.itemsDesc} ${controllerImp.itemLunchModel.itemsDesc} ${controllerImp.itemLunchModel.itemsDesc} ${controllerImp.itemLunchModel.itemsDesc}",
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.italic,
                                  color: Colorapp.grey),
                            )
                          ]))
                    ])))));
  }
}
