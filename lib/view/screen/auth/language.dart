import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/core/constant/rootes.dart';
import 'package:prj/core/localization/changelocal.dart';
import 'package:prj/view/widget/language/costumLang.dart';

class Language extends GetView<localController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("1".tr, style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: 20),
            Costumlangbotun(
                textlang: "en",
                onPressed: () {
                  controller.changelang("en");
                  Get.offNamed(approote.onbording);
                }),
            Costumlangbotun(
                textlang: "fr",
                onPressed: () {
                  controller.changelang("fr");
                  Get.offNamed(approote.onbording);
                })
          ],
        ),
      ),
    );
  }
}
