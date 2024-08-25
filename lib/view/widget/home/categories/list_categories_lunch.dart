import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:prj/controler/home/user_type_home/adminhomepagecontroller.dart';
import 'package:prj/core/constant/color.dart';
import 'package:prj/data/model/categorieslunchmodel.dart';
import 'package:prj/linkapi.dart';

class ListCategoriesLunch extends GetView<AdminhomepagecontrollerImp> {
  const ListCategoriesLunch({super.key});

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

class CategoriesLunch extends GetView<AdminhomepagecontrollerImp> {
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
          controller.goToItems(controller.categories, i!,
              categoriesLunchModel.categoriesId.toString());
        },
        child: Column(
          children: [
            SvgPicture.network(
              "${Linkapi.imageHomelunch}/${categoriesLunchModel.categoriesImage}",
              width: 70,
              height: 70,

              // Indicateur de chargement
            ),
            Text(
              "${categoriesLunchModel.categoriesName}",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colorapp.grey,
                  fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
