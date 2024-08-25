import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/controler/home/items_lunch/product_controller.dart';
import 'package:prj/core/constant/color.dart';
import 'package:prj/linkapi.dart';

class Topstack extends GetView<ProductControllerImp> {
  const Topstack({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
            height: 150,
            decoration: const BoxDecoration(
                color: Colorapp.primaryColors,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(20)))),
        Positioned(
          top: 30.0,
          left: Get.width / 4,
          right: Get.width / 4,
          child: Hero(
            tag: "${controller.itemLunchModel.itemsId}",
            child: CachedNetworkImage(
              imageUrl:
                  "${Linkapi.imageHomelunchitems}/${controller.itemLunchModel.itemsImage!}",
              height: 200,
              fit: BoxFit.fill,
            ),
          ),
        )
      ],
    );
  }
}
