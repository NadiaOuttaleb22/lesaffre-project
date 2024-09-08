import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:prj/core/class/statusrequest.dart';
import 'package:prj/core/constant/rootes.dart';
import 'package:prj/core/functions/handlingdatacontroller.dart';
import 'package:prj/core/functions/uploadimage.dart';
import 'package:prj/data/datasourse/remote/home/provider/categories_data.dart';
import 'package:prj/data/model/categorieslunchmodel.dart';

class ProviderfoodController extends GetxController {
  FoodData foodData = FoodData(Get.find());
  List<CategoriesLunchModel> data = [];

  Statusrequest statusrequest = Statusrequest.none;

  getCategories() async {
    data.clear();
    statusrequest = Statusrequest.loading;
    update();
    var response = await foodData.getDataView();
    statusrequest = handlingData(response);
    if (Statusrequest.success == statusrequest) {
      if (response['status'] == 'succes') {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => CategoriesLunchModel.fromJson(e)));
      }
    } else {
      Get.snackbar("failure", "No data");
    }
    update();
  }

  myBack() {
    Get.offAllNamed(approote.providerHomePage);
    return Future.value(false);
  }

  removeCategories(String id, String image) async {
    statusrequest = Statusrequest.loading;
    update();
    var response = await foodData.removeCategoris({
      "categories_id": id,
      "categories_image": image,
    });
    statusrequest = handlingData(response);
    if (Statusrequest.success == statusrequest) {
      if (response['status'] == 'succes') {
        Get.snackbar("Success", "the Categories was removed");
        getCategories();
      }
    } else {
      Get.snackbar("failure", "try again");
    }
    update();
  }

  goToPageEdit(CategoriesLunchModel categoriesmodel) {
    Get.toNamed(approote.editcategories,
        arguments: {"categoriesmodel": categoriesmodel});
  }

  goToPageItems(String categoriesid) {
    Get.toNamed(approote.viewitems, arguments: {"categoriesid": categoriesid});
  }

  @override
  void onInit() {
    getCategories();

    super.onInit();
  }
}

class EditController extends GetxController {
  FoodData foodData = FoodData(Get.find());
  late CategoriesLunchModel categoriesmodel;

  File? file;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController name;

  Statusrequest statusrequest = Statusrequest.none;

  shooseImage() async {
    file = await fileUploadGallery();
    if (file != null) {
      update();
    } else {
      Get.snackbar("Erreur", "Aucune image sélectionnée.");
    }
  }

  editCategoris() async {
    if (formstate.currentState!.validate()) {
      statusrequest = Statusrequest.loading;
      update();

      Map<String, String> data = {
        "categories_name": name.text,
        "categories_id": categoriesmodel.categoriesId.toString(),
        "imageold": categoriesmodel.categoriesImage!,
      };

      try {
        // print("Image sélectionnée : ${file.path}");

        var response = await foodData.editCategories(data, file);
        statusrequest = handlingData(response);
        if (Statusrequest.success == statusrequest) {
          if (response['status'] == 'succes') {
            Get.snackbar("Succès", "La catégorie a été modifiée avec succès.");
            Get.offNamed(approote.viewcategories);
            ProviderfoodController c = Get.find();
            c.getCategories(); // Actualise la liste des catégories
          } else {
            Get.snackbar("Erreur", "Échec de modifier de la catégorie.");
          }
        } else {
          Get.snackbar("Erreur", "Une erreur s'est produite.");
        }
      } catch (e) {
        Get.snackbar("Erreur", "Impossible de modifier la catégorie : $e");
      }

      update();
    }
  }

  @override
  void onInit() {
    categoriesmodel = Get.arguments["categoriesmodel"];
    name = TextEditingController();
    name.text = categoriesmodel.categoriesName!;

    super.onInit();
  }
}

class AddController extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  FoodData foodData = FoodData(Get.find());
  File? file;
  late TextEditingController name;
  Statusrequest statusrequest = Statusrequest.none;

  // Sélection d'une image depuis la galerie
  shooseImage() async {
    file = await fileUploadGallery();
    if (file != null) {
      update();
    } else {
      Get.snackbar("Erreur", "Aucune image sélectionnée.");
    }
  }

  // Ajout d'une catégorie avec une image
  addCategories() async {
    if (formstate.currentState!.validate()) {
      if (file == null) {
        Get.snackbar(
            "Erreur", "Veuillez sélectionner une image avant de continuer.");
        return;
      }

      statusrequest = Statusrequest.loading;
      update();

      Map<String, String> data = {
        "categories_name": name.text,
      };

      try {
        print("Image sélectionnée : ${file!.path}");

        var response = await foodData.addCategoris(data, file!);
        statusrequest = handlingData(response);
        if (Statusrequest.success == statusrequest) {
          if (response['status'] == 'succes') {
            Get.snackbar("Succès", "La catégorie a été ajoutée avec succès.");
            Get.offNamed(approote.viewcategories);
            ProviderfoodController c = Get.find();
            c.getCategories(); // Actualise la liste des catégories
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
    super.onInit();
  }
}
