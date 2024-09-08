import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/view/screen/home/admin/adminsetting.dart';
import 'package:prj/view/screen/home/homepage_user_type/adminhomepage.dart';
import 'package:prj/view/screen/home/setting.dart';
import 'package:prj/view/widget/home/itemslunch/list_items_lunch.dart';

abstract class HomescreenControllerAdmin extends GetxController {
  changepage(int i);
}

class HomescreenControllerAdminImp extends HomescreenControllerAdmin {
  int currentpage = 0;
  List listpage = [
    const Adminhomepage(),
    const Setting(),
    const ListItemsLunch(),
    const Adminsetting(),
  ];

  List titleButtonappbar = ["Home", "Setting", "Offers", "Admin"];

  List<IconData> iconbuttonappbar = [
    Icons.home_outlined,
    Icons.settings_applications_outlined,
    Icons.discount_outlined,
    Icons.admin_panel_settings_outlined
  ];

  @override
  changepage(i) {
    currentpage = i;
    update();
  }
}
