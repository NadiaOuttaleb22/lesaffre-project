import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/core/class/statusrequest.dart';
import 'package:prj/core/constant/rootes.dart';
import 'package:prj/core/functions/handlingdatacontroller.dart';
import 'package:prj/data/datasourse/remote/home/admin/users_data.dart';
import 'package:prj/data/model/users_model.dart';

class ViewUsersController extends GetxController {
  UsersData usersData = UsersData(Get.find());
  List<UsersModel> data = [];
  String? usersId;
  UsersModel? usersModel;

  Statusrequest statusrequest = Statusrequest.none;

  getUsers() async {
    data.clear();
    statusrequest = Statusrequest.loading;
    update();
    var response = await usersData.getDataUsers();
    statusrequest = handlingData(response);
    if (Statusrequest.success == statusrequest) {
      if (response['status'] == 'succes') {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => UsersModel.fromJson(e)));
      }
    } else {
      Get.snackbar("failure", "No data");
    }
    update();
  }

  removeUsers(String usersId) async {
    statusrequest = Statusrequest.loading;
    update();
    var response = await usersData.removeUsers(usersId);
    statusrequest = handlingData(response);
    if (Statusrequest.success == statusrequest) {
      if (response['status'] == 'succes') {
        Get.snackbar("Success", "the user was removed");
        getUsers();
      }
    } else {
      Get.snackbar("failure", "try again");
    }
    update();
  }

  myBack() {
    Get.offAllNamed(approote.viewUsers);
    return Future.value(false);
  }

  goToPageEdit(String usersId, UsersModel usersModel) {
    Get.toNamed(approote.editUsers,
        arguments: {"usersId": usersId, "usersModel": usersModel});
  }

  goToPageDetails(String usersId, UsersModel usersModel) {
    Get.toNamed(approote.detailsusers,
        arguments: {"usersId": usersId, "usersModel": usersModel});
  }

  @override
  void onInit() {
    //categoriesid = Get.arguments["categoriesid"];
    getUsers();

    super.onInit();
  }
}

class AddUsersController extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  UsersData usersData = UsersData(Get.find());

  late TextEditingController loginn;
  late TextEditingController password;
  late TextEditingController email;
  late TextEditingController username;

  bool isShowPassword = true;
  String access = "1";
  String typeUser = "1";

  Statusrequest statusrequest = Statusrequest.none;

  showPassword() {
    isShowPassword = !isShowPassword;
    update();
  }

  updateRadio(String? value) {
    access = value!;
    update();
  }

  updateRadioUser(String? value) {
    typeUser = value!;
    update();
  }

  addUsers() async {
    if (formstate.currentState!.validate()) {
      statusrequest = Statusrequest.loading;
      update();
      Map data = {
        "username": username.text,
        "usersLogin": loginn.text,
        "userEmail": email.text,
        "userPassword": password.text,
        "userAcces": access,
        "userType": typeUser,
      };
      var response = await usersData.addUsers(data);
      statusrequest = handlingData(response);
      if (Statusrequest.success == statusrequest) {
        if (response['status'] == 'succes') {
          ViewUsersController u = Get.put(ViewUsersController());
          u.getUsers();

          Get.offNamed(approote.viewUsers);
        } else {
          update();
        }
      } else {
        Get.defaultDialog(title: 'Warning', middleText: 'Email Already Exists');
        statusrequest = Statusrequest.failure;
      }
      update();
      // You can handle the radio value here if needed
      //
    }
  }

  @override
  void onInit() {
    loginn = TextEditingController();
    password = TextEditingController();
    username = TextEditingController();
    email = TextEditingController();

    super.onInit();
  }
}

class EditUsersController extends GetxController {
  UsersData usersData = UsersData(Get.find());
  late UsersModel usersModel;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late String usersId;
  late TextEditingController loginn;
  late TextEditingController email;
  late TextEditingController username;
  late String access;
  late String typeUser;

  bool isShowPassword = true;

  Statusrequest statusrequest = Statusrequest.none;

  showPassword() {
    isShowPassword = !isShowPassword;
    update();
  }

  updateRadio(String? value) {
    access = value!;
    update();
  }

  updateRadioUser(String? value) {
    typeUser = value!;
    update();
  }

  editUsers() async {
    if (formstate.currentState!.validate()) {
      statusrequest = Statusrequest.loading;
      update();
      Map data = {
        "users_id": usersId,
        "users_name": username.text,
        "users_login": loginn.text,
        "users_email": email.text,
        "users_acces": access,
        "users_type": typeUser,
      };
      var response = await usersData.editUsers(data);
      statusrequest = handlingData(response);
      print("===========================================$statusrequest");
      if (Statusrequest.success == statusrequest) {
        if (response['status'] == 'succes') {
          Get.snackbar("Succès", "Le item a été modifiée avec succès.");
          ViewUsersController u = Get.put(ViewUsersController());
          u.getUsers();

          Get.offNamed(approote.viewUsers);
        } else {
          Get.defaultDialog(
              title: 'Warning', middleText: 'Email Already Exists');
          statusrequest = Statusrequest.failure;
        }
      } else {
        Get.defaultDialog(
            title: 'Warning', middleText: 'Email Already Existsssss');
        statusrequest = Statusrequest.failure;
      }
      update();
      // You can handle the radio value here if needed
      //
    }
  }

  @override
  void onInit() {
    usersId = Get.arguments["usersId"];
    usersModel = Get.arguments["usersModel"];

    loginn = TextEditingController();
    //password = TextEditingController();
    username = TextEditingController();
    email = TextEditingController();

    loginn.text = usersModel.usersLogin;
    email.text = usersModel.usersEmail;
    username.text = usersModel.usersName;
    access = usersModel.usersAcces.toString();
    typeUser = usersModel.usersType.toString();

    super.onInit();
  }
}

class DetailsUsersController extends GetxController {
  UsersData usersData = UsersData(Get.find());
  List<UsersModel> data = [];
  late String usersId;
  late UsersModel usersModel;

  Statusrequest statusrequest = Statusrequest.none;

  getDaitails() async {
    data.clear();
    statusrequest = Statusrequest.loading;
    update();
    var response = await usersData.getDetails(usersId);
    statusrequest = handlingData(response);
    if (Statusrequest.success == statusrequest) {
      if (response['status'] == 'succes') {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => UsersModel.fromJson(e)));
      }
    } else {
      Get.snackbar("failure", "No data");
    }
    update();
  }

  tradUserType(val) {
    if (val == "1") {
      return 'Normal users';
    } else if (val == "2") {
      return 'Admin';
    } else {
      return 'Provider';
    }
  }

  tradUserAcces(val) {
    if (val == "1") {
      return 'breackFast';
    } else {
      return 'lunch';
    }
  }

  @override
  void onInit() {
    usersId = Get.arguments["usersId"];
    usersModel = Get.arguments["usersModel"];

    getDaitails();

    super.onInit();
  }
}
