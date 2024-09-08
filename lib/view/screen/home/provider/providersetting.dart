import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/controler/home/provider/neworders_controller.dart';
import 'package:prj/controler/home/provider/categories_contorollers.dart';
import 'package:prj/core/class/handlingdataview.dart';
import 'package:prj/core/constant/rootes.dart';
import 'package:prj/view/widget/home/provider/categories/view_categories.dart';

class Providersetting extends GetView<NewordersController> {
  const Providersetting({super.key});

  @override
  Widget build(BuildContext context) {
    final providerFoodController = Get.put(ProviderfoodController());
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Provider settings"),
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.shopping_cart_outlined),
                    Text('Orders'),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.food_bank_outlined),
                    Text('Foods'),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Première vue : Orders
            ListView(
              padding: EdgeInsets.all(screenWidth * 0.02),
              children: [
                InkWell(
                  onTap: () {
                    Get.toNamed(approote.neworders);
                  },
                  child: Card(
                    color: Colors.blueGrey.shade50,
                    child: SizedBox(
                      width: screenWidth * 0.5, // 50% de la largeur de l'écran
                      child: const ListTile(title: Text('New Orders')),
                    ),
                  ),
                ),
                SizedBox(
                    height: screenHeight * 0.01), // 1% de la hauteur de l'écran
                InkWell(
                  onTap: () {
                    Get.toNamed(approote.ordersunderpreparation);
                  },
                  child: Card(
                    color: Colors.blueGrey.shade50,
                    child: SizedBox(
                      width: screenWidth * 0.5, // 50% de la largeur de l'écran
                      child: ListTile(
                        title: Text(
                          'Orders Under Preparation',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: screenWidth *
                                0.04, // 4% de la largeur de l'écran
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                    height: screenHeight * 0.01), // 1% de la hauteur de l'écran
                InkWell(
                  onTap: () {
                    Get.toNamed(approote.archivesettingprovider);
                  },
                  child: Card(
                    color: Colors.blueGrey.shade50,
                    child: SizedBox(
                      width: screenWidth * 0.5, // 50% de la largeur de l'écran
                      child: ListTile(
                        title: Text(
                          'Orders Archived',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: screenWidth *
                                0.04, // 4% de la largeur de l'écran
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Deuxième vue : Foods
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(
                      screenWidth * 0.03), // 3% de la largeur de l'écran
                  child: GetBuilder<ProviderfoodController>(
                    builder: ((controller) => Handlingdataview(
                          statusrequest: controller.statusrequest,
                          // ignore: deprecated_member_use
                          widget: WillPopScope(
                            onWillPop: () {
                              return controller.myBack();
                            },
                            child: ListView.builder(
                              padding: EdgeInsets.all(screenWidth *
                                  0.02), // 2% de la largeur de l'écran
                              itemCount: providerFoodController.data.length,
                              itemBuilder: (context, index) =>
                                  Cardcategorieslist(
                                categoriesLunchModel:
                                    providerFoodController.data[index],
                              ),
                            ),
                          ),
                        )),
                  ),
                ),
                Positioned(
                  bottom: screenHeight * 0.02, // 2% de la hauteur de l'écran
                  right: screenWidth * 0.02, // 2% de la largeur de l'écran
                  child: FloatingActionButton(
                    heroTag: "unique_tag_1",
                    onPressed: () {
                      Get.toNamed(approote.addcategories);
                    },
                    child: const Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
