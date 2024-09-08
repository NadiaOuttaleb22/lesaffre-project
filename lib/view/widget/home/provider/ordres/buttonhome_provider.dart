import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/controler/home/provider/homescreen_controller.dart';
import 'package:prj/view/widget/home/homepage_wegets/custumbuttonappbar.dart';

class ButtonhomeProvider extends StatelessWidget {
  const ButtonhomeProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomescreenControllerProviderImp>(
      builder: (controller) => BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...List.generate(controller.listpage.length + 1, ((index) {
              int i = index > 2 ? index - 1 : index;
              return index != 2
                  ? Flexible(
                      child: Padding(
                        padding: const EdgeInsets
                            .symmetric(), // Ajuster l'espacement
                        child: Custumbuttonappbar(
                          textbutton: controller.titleButtonappbar[i],
                          iconData: controller.iconbuttonappbar[i],
                          onPressed: () {
                            controller.changepage(i);
                          },
                          active: controller.currentpage == i,
                        ),
                      ),
                    )
                  : Container();
            }))
          ],
        ),
      ),
    );
  }
}
