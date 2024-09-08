import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/controler/home/provider/items_controllers.dart';
import 'package:prj/core/constant/styles.dart';
import 'package:prj/data/model/items_lunck_model.dart';
import 'package:prj/linkapi.dart';

class ViewitemsList extends GetView<ViewItemsController> {
  final ItemLunchModel itemLunchModel;
  const ViewitemsList({super.key, required this.itemLunchModel});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewItemsController());
    return Card(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 2,
              child: CachedNetworkImage(
                //"${Linkapi.imageHomelunchitems}/${itemLunchModel.itemsImage}",
                height: 70,
                imageUrl:
                    "${Linkapi.imageHomelunchitems}/${itemLunchModel.itemsImage}",
              ),
            ),
            Expanded(
                flex: 4,
                child: InkWell(
                  onTap: () {
                    controller.goToPageEdit(
                        controller.categoriesid, itemLunchModel);
                  },
                  child: ListTile(
                    subtitle: Text(itemLunchModel.itemsCreate.toString()),
                    title: Text(
                      "${itemLunchModel.itemsName}",
                      style: Styles.textnormal2,
                    ),
                  ),
                )),
            const Spacer(),
            IconButton(
              onPressed: () {
                // Suppression de la catégorie
                Get.defaultDialog(
                  title: "warning",
                  middleText:
                      "do you want to delete ${itemLunchModel.itemsName}",
                  onCancel: () {},
                  onConfirm: () {
                    controller.removeItems(itemLunchModel.itemsId.toString(),
                        itemLunchModel.itemsImage.toString());
                    Get.back();
                  },
                );
              },
              color: Colors.red.shade800,
              icon: const Icon(
                Icons.delete_outline_outlined,
              ),
            ),
            /*  IconButton(
              onPressed: () {
                controller.goToPageEdit(itemLunchModel);
              },
              icon: Icon(
                Icons.edit_outlined,
                color: Colors.blue.shade900,
              ),
            ), */
          ],
        ),
      ),
    );
  }
}
