import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/bindings/initialbinding.dart';

import 'package:prj/core/constant/theme_app.dart';
import 'package:prj/core/services/sercice.dart';
import 'package:prj/rootes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialservises();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    ThemeApp controller = Get.put(ThemeApp());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'lesaffre repas',
      theme: controller.themeapp,
      //initialBinding: Mybinding(),
      initialBinding: Initialbindings(),
      /* home: const Test(), */
      //routes: routes,
      getPages: roote,
    );
  }
}
