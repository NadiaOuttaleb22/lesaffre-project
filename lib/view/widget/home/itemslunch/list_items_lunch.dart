import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/controler/home/user_type_home/adminhomepagecontroller.dart';
import 'package:prj/core/constant/color.dart';
import 'package:prj/data/model/items_lunck_model.dart';
import 'package:prj/linkapi.dart';

class ListItemsLunch extends GetView<AdminhomepagecontrollerImp> {
  const ListItemsLunch({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        ElevatedButton(
          onPressed: controller.areRadiosDisabled.value
              ? null // Désactive le bouton si les radios sont désactivées
              : () async {
                  await controller.submitSelectedItem();
                },
          child: Obx(() => Text(
                controller.areRadiosDisabled.value
                    ? "Veuillez patienter..."
                    : "Submit",
                style: TextStyle(
                    color: controller.areRadiosDisabled.value
                        ? Colorapp.grey
                        : Colorapp.primaryColors),
              )),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.6,
          ),
          itemBuilder: (context, i) {
            return Obx(() => ItemsLunch(
                  itemLunchModel: ItemLunchModel.fromJson(controller.items[i]),
                  groupValue: controller.selectedItem.value,
                  onChanged: controller.areRadiosDisabled.value
                      ? null
                      : (value) {
                          controller.selectItem(value);
                        },
                ));
          },
        )
      ],
    );
  }
}

class ItemsLunch extends StatelessWidget {
  final ItemLunchModel itemLunchModel;
  final String groupValue;
  final Function(String?)? onChanged;

  const ItemsLunch(
      {super.key,
      required this.itemLunchModel,
      required this.groupValue,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Image.network(
                  "${Linkapi.imageHomelunchitems}/${itemLunchModel.itemsImage}",
                  width: 100,
                  height: 100,
                  fit: BoxFit.fill,
                ),
              ),
              Text(
                itemLunchModel.itemsName!,
                style: const TextStyle(
                  color: Color.fromARGB(255, 64, 62, 62),
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Text(
                '${itemLunchModel.itemsDesc}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Text(
                ' discount : ${itemLunchModel.itemsDiscount.toString()} %',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Row(children: [
                Text(
                  '${itemLunchModel.itemsPrice} DH',
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.lineThrough, // Ligne traversante
                    decorationColor:
                        Colors.red, // Couleur de la ligne traversante
                    decorationThickness:
                        2.5, // Épaisseur de la ligne traversante
                  ),
                ),
                const Spacer(),
                Text(
                  "${(itemLunchModel.itemsPrice! - itemLunchModel.itemsPrice! * itemLunchModel.itemsDiscount! / 100)} DH",
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ]),
              Radio<String>(
                value: itemLunchModel.itemsId.toString(),
                groupValue: groupValue,
                onChanged: onChanged,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/* 
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/controler/home/user_type_home/adminhomepagecontroller.dart';
import 'package:prj/data/model/items_lunck_model.dart';
import 'package:prj/linkapi.dart';

class ListItemsLunch extends GetView<AdminhomepagecontrollerImp> {
  const ListItemsLunch({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // ListView pour permettre le défilement des items
        ListView(
          
          padding: const EdgeInsets.all(8.0),
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.items.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, i) {
                return ItemsLunch(
                  itemLunchModel: ItemLunchModel.fromJson(controller.items[i]),
                  groupValue: controller.selectedItem.value,
                  onChanged: (value) {
                    controller.selectItem(value);
                  },
                );
              },
            ),
            const SizedBox(height: 80), // Espace pour ne pas couvrir les items
          ],
        ),
        // Bouton Submit fixé en bas
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(16.0),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                controller.submitSelectedItem();
              },
              child: const Text("Submit"),
            ),
          ),
        ),
      ],
    );
  }
}

class ItemsLunch extends StatelessWidget {
  final ItemLunchModel itemLunchModel;
  final String groupValue;
  final Function(String?)? onChanged;

  const ItemsLunch(
      {super.key,
      required this.itemLunchModel,
      required this.groupValue,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(children: [
            Stack(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Image.network(
                    "${Linkapi.imageHomelunchitems}/${itemLunchModel.itemsImage}",
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20)),
                ),
                Positioned(
                  left: 29,
                  top: 5,
                  child: Text(
                    itemLunchModel.itemsName!,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 244, 244, 244),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
          ]),
          Radio<String>(
            value: itemLunchModel.itemsId.toString(),
            groupValue: groupValue,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
 */