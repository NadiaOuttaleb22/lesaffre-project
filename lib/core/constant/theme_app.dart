import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/core/constant/color.dart';
import 'package:prj/core/constant/styles.dart';

class ThemeApp extends GetxController {
  ThemeData themeapp = ThemeData(
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colorapp.primaryColors),
    appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: Colorapp.primaryColors),
        backgroundColor: Colors.white,
        titleTextStyle: Styles.appbar),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      bodyLarge: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
          height: 2,
          color: Colorapp.grey),
    ),
    primaryColor: const Color.fromARGB(255, 205, 20, 20),
  );
}
