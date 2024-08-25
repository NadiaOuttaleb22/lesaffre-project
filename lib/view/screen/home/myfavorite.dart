import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/controler/home/favorite_lunch/myfavorite_viewcontroller.dart';
import 'package:prj/core/class/handlingdataview.dart';
import 'package:prj/core/constant/rootes.dart';
import 'package:prj/view/screen/home/homepage_user_type/adminhomepage.dart';
import 'package:prj/view/widget/home/homepage_wegets/costumappbarHome.dart';
import 'package:prj/view/widget/home/myfavorite/costumlist_favorite.dart';

class Myfavorite extends StatelessWidget {
  const Myfavorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyfavoriteViewcontrollerImp());

    return Scaffold(
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GetBuilder<MyfavoriteViewcontrollerImp>(
            builder: (controller) => ListView(
              children: [
                Costumappbarhome(
                  titleappbar: 'find your meal',
                  onPressedIcon: () {},
                  onPressedSearch: () {
                    controller.onSearchitems();
                  },
                  onPressedIconfavorite: () {
                    Get.toNamed(approote.myfavorite);
                  },
                  onChanged: (val) {
                    controller.checkSearch(val);
                  },
                  mycontroller: controller.search!,
                ),
                const SizedBox(height: 15),
                Handlingdataview(
                    statusrequest: controller.statusrequest,
                    widget: !controller.isSearch
                        ? GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.data.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, childAspectRatio: 0.6),
                            itemBuilder: (context, index) {
                              return CostumlistFavorite(
                                  myFavoriteModel: controller.data[index]);
                            })
                        : ListItemsSearch(
                            listdatamodel: controller.listdata,
                          ))
              ],
            ),
          )),
    );
  }
}
