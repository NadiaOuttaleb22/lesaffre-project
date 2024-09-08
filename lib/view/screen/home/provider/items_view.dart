import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/controler/home/provider/items_controllers.dart';
import 'package:prj/core/class/handlingdataview.dart';
import 'package:prj/view/widget/home/provider/items/viewitems.dart';

class ItemsView extends StatelessWidget {
  const ItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    ViewItemsController controller = Get.put(ViewItemsController());

    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Items View'),
      ),
      body: Container(
        padding:
            EdgeInsets.all(screenWidth * 0.03), // 3% de la largeur de l'écran
        child: GetBuilder<ViewItemsController>(
          builder: (controller) => Handlingdataview(
            statusrequest: controller.statusrequest,
            // ignore: deprecated_member_use
            widget: WillPopScope(
              onWillPop: () {
                return controller.myBack();
              },
              child: ListView.builder(
                padding: EdgeInsets.all(
                    screenWidth * 0.02), // 2% de la largeur de l'écran
                itemCount: controller.data.length,
                itemBuilder: (context, index) => ViewitemsList(
                  itemLunchModel: controller.data[index],
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "unique_tag_1",
        onPressed: () {
          controller.goToAddItems(controller.categoriesid);
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .endFloat, // Positionne le bouton en bas à droite
    );
  }
}
