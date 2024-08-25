import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/controler/home/cart/add_and_removecart_controller.dart';
import 'package:prj/core/class/handlingdataview.dart';
import 'package:prj/view/widget/home/cart/custum_butom_navbar.dart';
import 'package:prj/view/widget/home/cart/custum_card_list.dart';
import 'package:prj/view/widget/home/cart/topcart.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddAndRemovecartController());

    return GetBuilder<AddAndRemovecartController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(title: const Text("My cart")),
        bottomNavigationBar: CustumButomNavbar(
            shipping: '0',
            total: "${controller.getTotalPriceOreder()} DH",
            discount: '${controller.discountcoupon}%',
            price: "${controller.priceorders} DH",
            controllercoupon: controller.controllercoupon!,
            onApply: () {
              controller.checkCoupon();
            }),
        body: Handlingdataview(
          statusrequest: controller.statusrequest,
          widget: ListView(children: [
            //const AppbarCart(title: 'My cart'),
            Topcart(
              text: 'you have ${controller.totalitems} items in your list',
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(children: [
                ...List.generate(
                  controller.data.length,
                  (index) => CustumCardList(
                    name: controller.data[index].itemsName!,
                    price: "${controller.data[index].itemsprice}",
                    count: controller.data[index].countitems!,
                    imagname: controller.data[index].itemsImage!,
                    onPressedadd: () async {
                      await controller
                          .add(controller.data[index].itemsId.toString());
                      controller.refreshPage();
                    },
                    onPressedremove: () async {
                      await controller
                          .delete(controller.data[index].itemsId.toString());
                      controller.refreshPage();
                    },
                  ),
                ),
              ]),
            ),
          ]),
        ),
      ),
    );
  }
}

/* controller.data[index].itemsDiscount == 0
                          ? (
                              await controller.add(
                                  controller.data[index].itemsId.toString(), 0),
                              controller.refreshPage()
                            )
                          : controller.data[index].itemsDiscount != 0 &&
                                  controller.data[index].dicount == 0
                              ? (
                                  await controller.add(
                                      controller.data[index].itemsId.toString(),
                                      0),
                                  controller.refreshPage()
                                )
                              : controller.data[index].itemsDiscount != 0 &&
                                      controller.data[index].dicount != 0
                                  ? (
                                      await controller.add(
                                          controller.data[index].itemsId
                                              .toString(),
                                          1),
                                      controller.refreshPage()
                                    )
                                  : null; */
