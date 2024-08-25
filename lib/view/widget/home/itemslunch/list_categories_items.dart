import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/controler/home/items_lunch/itemslunchcontroller.dart';
import 'package:prj/core/constant/color.dart';
import 'package:prj/data/model/categorieslunchmodel.dart';

class ListCategoriesItems extends GetView<ItemslunchcontrollerImp> {
  const ListCategoriesItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          return CategoriesLunch(
              i: index,
              categoriesLunchModel:
                  CategoriesLunchModel.fromJson(controller.categories[index]));
        },
      ),
    );
  }
}

class CategoriesLunch extends GetView<ItemslunchcontrollerImp> {
  final CategoriesLunchModel categoriesLunchModel;
  final int? i;
  const CategoriesLunch(
      {super.key, required this.categoriesLunchModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          //controller.goToItems(controller.categories, i!);
          controller.changeCat(
              i!, categoriesLunchModel.categoriesId.toString());
        },
        child: Column(
          children: [
            GetBuilder<ItemslunchcontrollerImp>(
              builder: (controller) => Container(
                padding: const EdgeInsets.only(bottom: 8, right: 10, left: 10),
                decoration: i == controller.selectedCat
                    ? const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 3, color: Colorapp.primaryColors)))
                    : null,
                child: Text(
                  "${categoriesLunchModel.categoriesName}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colorapp.grey,
                      fontSize: 17,
                      fontStyle: FontStyle.italic),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
