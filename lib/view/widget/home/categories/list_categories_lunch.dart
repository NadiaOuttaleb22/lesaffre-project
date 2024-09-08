import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:prj/controler/home/provider/providerhomepagecontroller.dart';
import 'package:prj/core/class/handlingdataview.dart';
import 'package:prj/core/constant/color.dart';
import 'package:prj/data/model/categorieslunchmodel.dart';
import 'package:prj/linkapi.dart';

class ListCategoriesLunch extends GetView<ProviderhomepagecontrollerImp> {
  const ListCategoriesLunch({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProviderhomepagecontrollerImp());
    return SizedBox(
        height: 300, // Ajustez la hauteur pour permettre plusieurs lignes.
        child: Handlingdataview(
          statusrequest: controller.statusrequest,
          widget: GridView.builder(
            scrollDirection: Axis.vertical,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // Nombre de colonnes
              crossAxisSpacing: 10.0,
              // Espacement horizontal entre les éléments
              mainAxisSpacing: 20.0, // Espacement vertical entre les éléments
            ),
            itemCount: controller.categories.length,
            itemBuilder: (context, index) {
              return Handlingdataview(
                  statusrequest: controller.statusrequest,
                  widget: CategoriesLunch(
                      i: index,
                      categoriesLunchModel: CategoriesLunchModel.fromJson(
                          controller.categories[index])));
            },
          ),
        ));
  }
}

class CategoriesLunch extends GetView<ProviderhomepagecontrollerImp> {
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
          child: Handlingdataview(
              statusrequest: controller.statusrequest,
              widget: Column(
                children: [
                  /////
                  SvgPicture.network(
                    "${Linkapi.imageHomelunch}/${categoriesLunchModel.categoriesImage}",
                    width: 50,
                    height: 50,
                  ),
                  Text(
                    "${categoriesLunchModel.categoriesName}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colorapp.grey,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ))),
    );
  }
}
