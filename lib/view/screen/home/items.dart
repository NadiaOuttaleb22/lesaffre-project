import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/controler/home/favorite_lunch/favorite_controller.dart';
import 'package:prj/controler/home/items_lunch/itemslunchcontroller.dart';
import 'package:prj/core/class/handlingdataview.dart';
import 'package:prj/core/constant/rootes.dart';
import 'package:prj/data/model/items_lunck_model.dart';
import 'package:prj/view/screen/home/homepage_user_type/adminhomepage.dart';
import 'package:prj/view/widget/home/itemslunch/list_items.dart';
import 'package:prj/view/widget/home/homepage_wegets/costumappbarHome.dart';
import 'package:prj/view/widget/home/itemslunch/list_categories_items.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemslunchcontrollerImp());
    ItemslunchcontrollerImp controllerImp = Get.put(ItemslunchcontrollerImp());
    FavoriteController controllerFav = Get.put(FavoriteController());

    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(15),
      child: ListView(
        children: [
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
          const SizedBox(height: 8),
          const ListCategoriesItems(),
          GetBuilder<ItemslunchcontrollerImp>(
              builder: (controller) => Handlingdataview(
                  statusrequest: controller.statusrequest,
                  widget: !controllerImp.isSearch
                      ? GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.data.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 0.6),
                          itemBuilder: (BuildContext context, index) {
                            controllerFav.isfavorite[controller.data[index]
                                    ['items_id']] =
                                controller.data[index]['favorite'];
                            return ListItems(
                                active: false,
                                itemLunchModel: ItemLunchModel.fromJson(
                                    controller.data[index]));
                          })
                      : ListItemsSearch(
                          listdatamodel: controllerImp.listdata,
                        )))
        ],
      ),
    ));
  }
}
