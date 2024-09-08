import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:prj/controler/home/provider/categories_contorollers.dart';
import 'package:prj/core/constant/styles.dart';
import 'package:prj/data/model/categorieslunchmodel.dart';
import 'package:prj/linkapi.dart';

class Cardcategorieslist extends GetView<ProviderfoodController> {
  final CategoriesLunchModel categoriesLunchModel;
  const Cardcategorieslist({super.key, required this.categoriesLunchModel});

  @override
  Widget build(BuildContext context) {
    Get.put(ProviderfoodController());
    return Card(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 2,
              child: SvgPicture.network(
                "${Linkapi.imageHomelunch}/${categoriesLunchModel.categoriesImage}",
                height: 70,
              ),
            ),
            Expanded(
                flex: 4,
                child: InkWell(
                  onTap: () {
                    controller.goToPageItems(
                        categoriesLunchModel.categoriesId.toString());
                  },
                  child: ListTile(
                    subtitle:
                        Text(categoriesLunchModel.categoriesCreate.toString()),
                    title: Text(
                      "${categoriesLunchModel.categoriesName}",
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
                      "do you want to delete ${categoriesLunchModel.categoriesName}",
                  onCancel: () {},
                  onConfirm: () {
                    controller.removeCategories(
                        categoriesLunchModel.categoriesId.toString(),
                        categoriesLunchModel.categoriesImage.toString());
                    Get.back();
                  },
                );
              },
              color: Colors.red.shade800,
              icon: const Icon(
                Icons.delete_outline_outlined,
              ),
            ),
            IconButton(
              onPressed: () {
                // Naviguer vers la page EditCategoriesPage
                controller.goToPageEdit(categoriesLunchModel);
              },
              icon: Icon(
                Icons.edit_outlined,
                color: Colors.blue.shade900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
