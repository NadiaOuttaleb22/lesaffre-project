import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/controler/home/user_type_home/adminhomepagecontroller.dart';
import 'package:prj/core/class/handlingdataview.dart';
import 'package:prj/core/constant/rootes.dart';
import 'package:prj/data/model/items_lunck_model.dart';
import 'package:prj/linkapi.dart';
import 'package:prj/view/widget/home/homepage_wegets/costum_titlehome.dart';
import 'package:prj/view/widget/home/categories/list_categories_lunch.dart';
import 'package:prj/view/widget/home/homepage_wegets/costum_card.dart';
import 'package:prj/view/widget/home/homepage_wegets/costumappbarHome.dart';
import 'package:prj/view/widget/home/itemslunch/list_items_lunch.dart';

class Adminhomepage extends StatelessWidget {
  const Adminhomepage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AdminhomepagecontrollerImp());
    return GetBuilder<AdminhomepagecontrollerImp>(
        builder: (controllerImp) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView(children: [
              Costumappbarhome(
                titleappbar: 'find your meal',
                onPressedIcon: () {},
                onPressedSearch: () {
                  controllerImp.onSearchitems();
                },
                onPressedIconfavorite: () {
                  Get.toNamed(approote.myfavorite);
                },
                onChanged: (val) {
                  controllerImp.checkSearch(val);
                },
                mycontroller: controllerImp.search!,
              ),
              Handlingdataview(
                  statusrequest: controllerImp.statusrequest,
                  widget: !controllerImp.isSearch
                      ? const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CostumCard(
                                titl: 'Lesafre surprise', body: 'Cashback 20%'),
                            CostumTitlehome(text: 'Categories'),
                            ListCategoriesLunch(),
                            CostumTitlehome(text: 'for you'),
                            ListItemsLunch(),
                          ],
                        )
                      : ListItemsSearch(
                          listdatamodel: controllerImp.listdata,
                        ))
            ])));
  }
}

class ListItemsSearch extends GetView<AdminhomepagecontrollerImp> {
  final List<ItemLunchModel> listdatamodel;
  const ListItemsSearch({super.key, required this.listdatamodel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listdatamodel.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              controller.goToPageProduct(listdatamodel[index]);
            },
            child: Card(
                child: Container(
              padding: const EdgeInsets.all(7),
              child: Row(children: [
                Expanded(
                    child: CachedNetworkImage(
                        imageUrl:
                            "${Linkapi.imageHomelunchitems}/${listdatamodel[index].itemsImage}")),
                Expanded(
                    flex: 2,
                    child: ListTile(
                      title: Text(listdatamodel[index].itemsName!),
                      subtitle: Text(listdatamodel[index].categoriesName!),
                    )),
              ]),
            )),
          );
        });
  }
}

/* ElevatedButton(
              onPressed: () {
                controllerImp.gotoSignUp();
              },
              child: const Text('add')), */