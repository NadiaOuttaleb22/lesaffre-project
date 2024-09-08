import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/controler/home/admin/homescreen_controller.dart';
import 'package:prj/view/widget/home/homepage_wegets/custumbuttonappbar.dart';

class BottonHome extends StatelessWidget {
  const BottonHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomescreenControllerAdminImp>(
        builder: (controller) => BottomAppBar(
              shape: const CircularNotchedRectangle(),
              notchMargin: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ...List.generate(controller.listpage.length + 1, ((index) {
                    int i = index > 2 ? index - 1 : index;
                    return index != 2
                        ? Custumbuttonappbar(
                            textbutton: controller.titleButtonappbar[i],
                            iconData: controller.iconbuttonappbar[i],
                            onPressed: () {
                              controller.changepage(i);
                            },
                            active: controller.currentpage == i ? true : false)
                        : const Spacer();
                  }))
                ],
              ),
            ));
  }
}
