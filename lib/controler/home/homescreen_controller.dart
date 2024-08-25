import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/view/screen/home/homepage_user_type/adminhomepage.dart';
import 'package:prj/view/screen/home/setting.dart';

abstract class HomescreenController extends GetxController {
  changepage(int i);
}

class HomescreenControllerImp extends HomescreenController {
  int currentpage = 0;
  List listpage = [
    const Adminhomepage(),
    const Setting(),
    const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text('profil'),
        )
      ],
    ),
    const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text('favorite'),
        )
      ],
    )
  ];

  List titleButtonappbar = ["Home", "Setting", "Profil", "add users"];

  List<IconData> iconbuttonappbar = [
    Icons.home_outlined,
    Icons.settings_applications_outlined,
    Icons.person_2_outlined,
    Icons.person_add_alt
  ];

  @override
  changepage(i) {
    currentpage = i;
    update();
  }
}
