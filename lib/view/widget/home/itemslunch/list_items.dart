import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/controler/home/favorite_lunch/favorite_controller.dart';
import 'package:prj/controler/home/items_lunch/itemslunchcontroller.dart';
import 'package:prj/core/constant/color.dart';
import 'package:prj/data/model/items_lunck_model.dart';
import 'package:prj/linkapi.dart';

class ListItems extends GetView<ItemslunchcontrollerImp> {
  final ItemLunchModel itemLunchModel;
  final bool active;
  const ListItems(
      {super.key, required this.itemLunchModel, required this.active});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          controller.goToPageProduct(itemLunchModel);
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                  tag: "${itemLunchModel.itemsId}",
                  child: CachedNetworkImage(
                    imageUrl:
                        "${Linkapi.imageHomelunchitems}/${itemLunchModel.itemsImage!}",
                    height: 100,
                    width: 100,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                const SizedBox(height: 10),
                Text(itemLunchModel.itemsName!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 44, 43, 43),
                        fontSize: 19,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                Text(itemLunchModel.itemsDesc!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colorapp.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.w600)),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${itemLunchModel.itemsPrice!.toString()} dh",
                        style: const TextStyle(
                            color: Colorapp.red,
                            fontSize: 17,
                            fontWeight: FontWeight.bold)),
                    GetBuilder<FavoriteController>(
                        builder: (controller) => IconButton(
                            onPressed: () {
                              if (controller
                                      .isfavorite[itemLunchModel.itemsId] ==
                                  1) {
                                controller.setFavorite(
                                    itemLunchModel.itemsId, 0);
                                controller.removeFavorite(
                                    itemLunchModel.itemsId.toString());
                              } else {
                                controller.setFavorite(
                                    itemLunchModel.itemsId, 1);
                                controller.addFavorite(
                                    itemLunchModel.itemsId.toString());
                              }
                            },
                            icon: Icon(
                              controller.isfavorite[itemLunchModel.itemsId] == 0
                                  ? Icons.favorite_border_rounded
                                  : Icons.favorite_rounded,
                              size: 28,
                              color: Colors.red[400],
                            )))
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
