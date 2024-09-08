import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/controler/home/cart/add_and_removecart_controller.dart';
import 'package:prj/core/constant/color.dart';
import 'package:prj/core/constant/styles.dart';
import 'package:prj/view/widget/home/cart/buttonorder.dart';
import 'package:prj/view/widget/home/cart/custombutton_coupon.dart';

class CustumButomNavbar extends GetView<AddAndRemovecartController> {
  final String total;
  final String discount;
  final String shipping;
  final TextEditingController controllercoupon;
  final void Function()? onApply;
  final String price;

  const CustumButomNavbar(
      {super.key,
      required this.total,
      required this.discount,
      required this.price,
      required this.controllercoupon,
      required this.onApply,
      required this.shipping});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GetBuilder<AddAndRemovecartController>(
            builder: (controller) => controller.nameofcoupon == null
                ? Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(children: [
                      Expanded(
                          flex: 2,
                          child: TextFormField(
                            controller: controllercoupon,
                            decoration: const InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 7, horizontal: 7),
                                hintText: "Coupon Code",
                                hintStyle: Styles.hintstyle,
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)))),
                          )),
                      const SizedBox(width: 10),
                      Expanded(
                          flex: 1,
                          child: CustombuttonCoupon(
                              txt: 'apply', onPressed: onApply))
                    ]))
                : Text(
                    "Coupon Code : ${controller.nameofcoupon}",
                    style: const TextStyle(
                        color: Colorapp.grey, fontWeight: FontWeight.bold),
                  )),
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colorapp.primaryColors, width: 2)),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Text('price',
                      style: TextStyle(
                          color: Colorapp.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 15)),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(price,
                      style: const TextStyle(
                          color: Colorapp.grey, fontWeight: FontWeight.bold)),
                )
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Text('discount',
                      style: TextStyle(
                          color: Colorapp.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 15)),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(discount,
                      style: const TextStyle(
                          color: Colorapp.grey, fontWeight: FontWeight.bold)),
                )
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Text('shipping',
                      style: TextStyle(
                          color: Colorapp.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 15)),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text("$shipping DH",
                      style: const TextStyle(
                          color: Colorapp.grey, fontWeight: FontWeight.bold)),
                )
              ]),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Divider(),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Text('total',
                      style: TextStyle(
                          color: Colorapp.primaryColors,
                          fontWeight: FontWeight.bold,
                          fontSize: 15)),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(total,
                      style: const TextStyle(
                          color: Colorapp.primaryColors,
                          fontWeight: FontWeight.bold)),
                )
              ]),
            ],
          ),
        ),
        ButtonorderCard(
          txt: 'Order',
          onPressed: () {
            controller.goToPageOrders();
            //Get.toNamed(approote.checkout);
            controller.data.isNotEmpty ? controller.checkout() : null;
          },
        ),
      ],
    );
  }
}
