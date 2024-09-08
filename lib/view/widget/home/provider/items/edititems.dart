import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/controler/home/provider/items_controllers.dart';
import 'package:prj/core/constant/styles.dart';
import 'package:prj/core/functions/validateurinput.dart';
import 'package:prj/core/shared/costumtextformglobal.dart';

class Edititems extends StatelessWidget {
  const Edititems({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditItemsController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Edit items"),
        ),
        body: GetBuilder<EditItemsController>(
            builder: (controller) => Container(
                  padding: const EdgeInsets.all(10),
                  child: Form(
                    key: controller.formstate,
                    child: ListView(
                      children: [
                        Costumtextformglobal(
                            hint: "Enter item name",
                            label: "item name",
                            iconData: Icons.emoji_objects_outlined,
                            mycontroller: controller.name,
                            valid: (val) {
                              return validInput(val!, 1, 15, "type");
                            }),
                        const SizedBox(height: 15),
                        Costumtextformglobal(
                            hint: "Enter item description",
                            label: "item description",
                            iconData: Icons.description_outlined,
                            mycontroller: controller.description,
                            valid: (val) {
                              return validInput(val!, 5, 50, "type");
                            }),
                        const SizedBox(height: 15),
                        Costumtextformglobal(
                            hint: "Enter item price",
                            label: "item price",
                            iconData: Icons.price_change_outlined,
                            mycontroller: controller.price,
                            valid: (val) {
                              return validInput(val!, 1, 5, "");
                            }),
                        const SizedBox(height: 15),
                        Costumtextformglobal(
                            hint: "Enter item discount",
                            label: "item discount",
                            iconData: Icons.discount_outlined,
                            mycontroller: controller.discount,
                            valid: (val) {
                              return validInput(val!, 1, 15, "type");
                            }),
                        const SizedBox(height: 15),
                        RadioListTile(
                            title: Text("hide"),
                            value: "0",
                            groupValue: controller.active,
                            onChanged: (val) {
                              controller.changeStatusActive(val);
                            }),
                        RadioListTile(
                            title: const Text("active"),
                            value: '1',
                            groupValue: controller.active,
                            onChanged: (val) {
                              controller.changeStatusActive(val);
                            }),
                        const SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.green.shade100),
                          child: MaterialButton(
                              onPressed: () {
                                controller.shooseImage();
                              },
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("choose image item"),
                                  Icon(Icons.image_outlined)
                                ],
                              )),
                        ),
                        const SizedBox(height: 10),
                        controller.file != null
                            ? Image.file(controller.file!,
                                height: 100, width: 100)
                            : const Text(
                                "Aucune image sélectionnée",
                                textAlign: TextAlign.center,
                                style: Styles.hintstyle,
                              ),
                        const SizedBox(height: 10),
                        MaterialButton(
                            onPressed: () {
                              controller.editItems();
                            },
                            child: const Text("save"))
                      ],
                    ),
                  ),
                )));
  }
}
