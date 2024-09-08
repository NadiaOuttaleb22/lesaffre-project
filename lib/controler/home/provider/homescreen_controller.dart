import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/view/screen/home/provider/providersetting.dart';
import 'package:prj/view/screen/home/homepage_user_type/providerhomepage.dart';
import 'package:prj/view/screen/home/setting.dart';
import 'package:prj/view/widget/home/itemslunch/list_items_lunch.dart';

abstract class HomescreenControllerProvider extends GetxController {
  changepage(int i);
}

class HomescreenControllerProviderImp extends HomescreenControllerProvider {
  int currentpage = 0;
  List listpage = [
    const Providerhomepage(),
    const Setting(),
    const ListItemsLunch(),
    const Providersetting()
  ];

  List titleButtonappbar = ["Home", "Setting", "Offers", "Prv"];

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
