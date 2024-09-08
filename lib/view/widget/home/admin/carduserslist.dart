import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/controler/home/admin/users_controllsers.dart';
import 'package:prj/core/constant/imageassets_and_lottie.dart';
import 'package:prj/core/constant/styles.dart';
import 'package:prj/data/model/users_model.dart';

class Carduserslist extends GetView<ViewUsersController> {
  final UsersModel usersModel;
  const Carduserslist({super.key, required this.usersModel});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewUsersController());
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(
            8.0), // Ajout de padding à la place de Expanded
        child: Row(
          children: [
            Flexible(
              flex: 2,
              child: Image.asset(
                Imageassets.avatar,
                width: 100,
                height: 100,
              ),
            ),
            Flexible(
              flex: 6,
              child: InkWell(
                onTap: () {
                  controller.goToPageDetails(
                      usersModel.usersId.toString(), usersModel);
                },
                child: ListTile(
                  subtitle: Text(usersModel.usersName),
                  title: Text(
                    usersModel.usersLogin,
                    style: Styles.textnormal2,
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                // Suppression de l'utilisateur
                Get.defaultDialog(
                  title: "Warning",
                  middleText: "Do you want to delete this user?",
                  onCancel: () {},
                  onConfirm: () {
                    controller.removeUsers(usersModel.usersId.toString());
                    Get.back();
                  },
                );
              },
              color: Colors.red.shade800,
              icon: const Icon(
                Icons.delete_outline_outlined,
              ),
            ),
            IconButton(
              onPressed: () {
                controller.goToPageEdit(
                    usersModel.usersId.toString(), usersModel);
              },
              icon: Icon(
                Icons.edit_outlined,
                color: Colors.blue.shade900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
