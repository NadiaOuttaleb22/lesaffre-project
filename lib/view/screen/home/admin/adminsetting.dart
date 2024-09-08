import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/controler/home/admin/users_controllsers.dart';
import 'package:prj/core/class/handlingdataview.dart';
import 'package:prj/core/constant/rootes.dart';
import 'package:prj/core/constant/styles.dart';
import 'package:prj/view/widget/home/admin/carduserslist.dart';

class Adminsetting extends StatelessWidget {
  const Adminsetting({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // Instancier le controller avec Get.put
    ViewUsersController controller = Get.put(ViewUsersController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Setting"),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Alignement à gauche
          children: [
            const Text(
              'List of users',
              style: Styles.pricestyle,
            ),
            const SizedBox(height: 10),
            Expanded(
              // Utilisation correcte de Expanded dans un parent Column
              child: GetBuilder<ViewUsersController>(
                builder: (controller) => Handlingdataview(
                  statusrequest: controller.statusrequest,
                  widget: WillPopScope(
                    onWillPop: () {
                      return controller.myBack();
                    },
                    child: ListView.builder(
                      padding: EdgeInsets.all(screenWidth * 0.02),
                      itemCount: controller.data.length,
                      itemBuilder: (context, index) => Carduserslist(
                        usersModel: controller.data[index],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "unique_tag_2",
        onPressed: () {
          Get.toNamed(approote.addUsers);
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
