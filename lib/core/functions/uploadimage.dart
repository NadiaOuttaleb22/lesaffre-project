import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

Future<File?> imageUploadCamera() async {
  try {
    final XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 80);

    if (file != null) {
      return File(file.path);
    } else {
      print("Aucune image sélectionnée.");
      return null;
    }
  } catch (e) {
    print("Erreur lors de la prise de photo : $e");
    return null;
  }
}

Future<File?> fileUploadGallery() async {
  try {
    final XFile? file = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 80, // Ajuste la qualité de l'image si nécessaire
    );

    if (file != null) {
      return File(file.path);
    } else {
      print("Aucune image sélectionnée.");
      return null;
    }
  } catch (e) {
    print("Erreur lors de la sélection d'image : $e");
    return null;
  }
}

Future<void> showBottomMenu(Future<File?> Function() fileUploadGallery,
    Future<File?> Function() imageUploadCamera) {
  return Get.bottomSheet(
    Container(
      height: 150,
      color: Colors.white,
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.camera_alt),
            title: Text('Prendre une photo'),
            onTap: () async {
              File? image = await imageUploadCamera();
              if (image != null) {
                print('Image capturée : ${image.path}');
              }
              Get.back(); // Fermer le bottom sheet
            },
          ),
          ListTile(
            leading: Icon(Icons.photo),
            title: Text('Choisir depuis la galerie'),
            onTap: () async {
              File? image = await fileUploadGallery();
              if (image != null) {
                print('Image sélectionnée : ${image.path}');
              }
              Get.back(); // Fermer le bottom sheet
            },
          ),
        ],
      ),
    ),
  );
}
