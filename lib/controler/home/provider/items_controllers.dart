import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:prj/core/class/statusrequest.dart';
import 'package:prj/core/constant/rootes.dart';
import 'package:prj/core/functions/handlingdatacontroller.dart';
import 'package:prj/core/functions/uploadimage.dart';
import 'package:prj/data/datasourse/remote/home/provider/items_data.dart';
import 'package:prj/data/model/items_lunck_model.dart';

class ViewItemsController extends GetxController {
  ItemsData itemsData = ItemsData(Get.find());
  List<ItemLunchModel> data = [];
  late String categoriesid;
  ItemLunchModel? itemLunchModel;

  Statusrequest statusrequest = Statusrequest.none;

  getItems() async {
    data.clear();
    statusrequest = Statusrequest.loading;
    update();
    var response = await itemsData.getDataItems(categoriesid);
    statusrequest = handlingData(response);
    if (Statusrequest.success == statusrequest) {
      if (response['status'] == 'succes') {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => ItemLunchModel.fromJson(e)));
      }
    } else {
      Get.snackbar("failure", "No data");
    }
    update();
  }

  myBack() {
    //Get.offAllNamed(approote.viewcategories);
    Get.back();
    return Future.value(false);
  }

  removeItems(String id, String image) async {
    statusrequest = Statusrequest.loading;
    update();
    var response = await itemsData.removeItems({
      "items_id": id,
      "items_image": image,
    });
    statusrequest = handlingData(response);
    if (Statusrequest.success == statusrequest) {
      if (response['status'] == 'succes') {
        Get.snackbar("Success", "the item was removed");
        getItems();
      }
    } else {
      Get.snackbar("failure", "try again");
    }
    update();
  }

  goToPageEdit(String categoriesId, itemLunchModel) {
    Get.toNamed(approote.editems, arguments: {
      "categoriesid": categoriesId,
      "itemLunchModel": itemLunchModel
    });
  }

  goToAddItems(String categoriesId) {
    Get.toNamed(approote.additems, arguments: {"categoriesid": categoriesId});
  }

  @override
  void onInit() {
    categoriesid = Get.arguments["categoriesid"];
    getItems();

    super.onInit();
  }
}

class EditItemsController extends GetxController {
  ItemsData itemsData = ItemsData(Get.find());
  late String categoriesid;
  late ItemLunchModel itemLunchModel;

  File? file;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController name;
  late TextEditingController description;
  late TextEditingController price;
  late TextEditingController discount;
  String? active;

  Statusrequest statusrequest = Statusrequest.none;

  changeStatusActive(val) {
    active = val;
    update();
  }

  shooseImage() async {
    file = await fileUploadGallery();
    if (file != null) {
      update();
    } else {
      Get.snackbar("Erreur", "Aucune image sélectionnée.");
    }
  }

  editItems() async {
    if (formstate.currentState!.validate()) {
      statusrequest = Statusrequest.loading;
      update();

      Map<String, String> data = {
        "items_id": itemLunchModel.itemsId.toString(),
        "imageold": itemLunchModel.itemsImage!,
        "items_name": name.text,
        "items_desc": description.text,
        "items_active": active.toString(),
        "items_price": price.text,
        "items_discount": discount.text,
        "items_cat": categoriesid,
      };

      try {
        // print("Image sélectionnée : ${file.path}");

        var response = await itemsData.editItems(data, file);
        statusrequest = handlingData(response);
        if (Statusrequest.success == statusrequest) {
          if (response['status'] == 'succes') {
            Get.snackbar("Succès", "Le item a été modifiée avec succès.");
            Get.offNamed(approote.viewitems);
            ViewItemsController c = Get.find();
            c.getItems(); // Actualise la liste des catégories
          } else {
            Get.snackbar("Erreur", "Échec de modifier de la item.");
          }
        } else {
          Get.snackbar("Erreur", "Une erreur s'est produite.");
        }
      } catch (e) {
        Get.snackbar("Erreur", "Impossible de modifier la item : $e");
      }

      update();
    }
  }

  @override
  void onInit() {
    itemLunchModel = Get.arguments["itemLunchModel"];
    categoriesid = Get.arguments["categoriesid"];

    name = TextEditingController();
    discount = TextEditingController();
    description = TextEditingController();
    price = TextEditingController();

    name.text = itemLunchModel.itemsName!;
    discount.text = itemLunchModel.itemsDiscount.toString();
    description.text = itemLunchModel.itemsDesc!;
    price.text = itemLunchModel.itemsPrice.toString();
    active = itemLunchModel.itemsActive.toString();

    super.onInit();
  }
}

class AddItemsController extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  ItemsData itemsData = ItemsData(Get.find());
  File? file;
  late TextEditingController name;
  late TextEditingController description;
  late TextEditingController price;
  late TextEditingController discount;
  late String catid;
  late String categoriesid;

  Statusrequest statusrequest = Statusrequest.none;

  Future<void> showOptionsImage() async {
    await showBottomMenu(shooseImage(), shoseImageCamera());
  }

  // Sélection d'une image depuis la galerie
  shooseImage() async {
    file = await fileUploadGallery();
    if (file != null) {
      update();
    } else {
      Get.snackbar("Erreur", "Aucune image sélectionnée.");
    }
  }

  shoseImageCamera() async {
    file = await imageUploadCamera();
    if (file != null) {
      update();
    } else {
      Get.snackbar("Erreur", "Aucune image sélectionnée.");
    }
  }

  // Ajout d'une catégorie avec une image
  addItems() async {
    if (formstate.currentState!.validate()) {
      if (file == null) {
        Get.snackbar(
            "Erreur", "Veuillez sélectionner une image avant de continuer.");
        return;
      }

      statusrequest = Statusrequest.loading;
      update();

      Map<String, String> data = {
        "items_name": name.text,
        "items_desc": discount.text,
        "items_image": name.text,
        "items_price": price.text,
        "items_discount": discount.text,
        "items_cat": catid,
      };

      try {
        print("Image sélectionnée : ${file!.path}");

        var response = await itemsData.addItems(data, file!);
        statusrequest = handlingData(response);
        if (Statusrequest.success == statusrequest) {
          if (response['status'] == 'succes') {
            Get.snackbar("Succès", "La catégorie a été ajoutée avec succès.");
            Get.offNamed(approote.viewitems);
            ViewItemsController c = Get.find();
            c.getItems(); // Actualise la liste des catégories
          } else {
            Get.snackbar("Erreur", "Échec de l'ajout de la catégorie.");
          }
        } else {
          Get.snackbar("Erreur", "Une erreur s'est produite.");
        }
      } catch (e) {
        Get.snackbar("Erreur", "Impossible d'ajouter la catégorie : $e");
      }

      update();
    }
  }

  @override
  void onInit() {
    name = TextEditingController();
    discount = TextEditingController();
    description = TextEditingController();
    price = TextEditingController();
    categoriesid = Get.arguments["categoriesid"];
    catid = categoriesid;
    super.onInit();
  }
}
