import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:prj/binding.dart';
import 'package:prj/bindings/initialbinding.dart';
import 'package:prj/core/constant/color.dart';
import 'package:prj/core/localization/changelocal.dart';
import 'package:prj/core/localization/tran.dart';
import 'package:prj/core/services/sercice.dart';
import 'package:prj/rootes.dart';
//import 'package:prj/test.dart';
//import 'package:prj/view/screen/auth/language.dart';
//import 'package:prj/view/screen/onborging.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialservises();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    localController controller = Get.put(localController());
    return GetMaterialApp(
      translations: mytrans(),
      debugShowCheckedModeBanner: false,
      title: 'flutter demo',
      locale: controller.lang,
      theme: ThemeData(
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          bodyLarge: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              height: 2,
              color: Colorapp.grey),
        ),
        primaryColor: const Color.fromARGB(255, 205, 20, 20),
      ),
      //initialBinding: Mybinding(),
      initialBinding: Initialbindings(),
      /* home: const Test(), */
      //routes: routes,
      getPages: roote,
    );
  }
}
