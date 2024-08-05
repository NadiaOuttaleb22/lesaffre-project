import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/controler/welcome_controller.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    WelcomeControllerImp controllerImp = Get.put(WelcomeControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: const Text('welcome'),
        ),
        body: Center(
          child: ElevatedButton(
              onPressed: () {
                controllerImp.gotoSignUp();
              },
              child: const Text('add')),
        ));
  }
}
