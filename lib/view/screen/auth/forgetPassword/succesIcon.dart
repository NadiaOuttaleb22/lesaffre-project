import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/controler/auth/succesicon_controller.dart';
import 'package:prj/view/widget/auth/custumButtomAuth.dart';

class Succesicon extends StatelessWidget {
  const Succesicon({super.key});

  @override
  Widget build(BuildContext context) {
    SuccesiconControllerImp controllerImp = Get.put(SuccesiconControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 251, 251, 251),
        elevation: 0.0,
        title: const Text('Succes ',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color.fromARGB(255, 108, 107, 107))),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Center(
              child: Icon(
                Icons.check_circle_outline_outlined,
                size: 100,
                color: Color.fromARGB(255, 179, 7, 62),
              ),
            ),
            const Text('data'),
            const Text('data'),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              child: custumButtomAuth(
                  text: "go to login",
                  onPressed: () {
                    controllerImp.gotoPageLogin();
                  }),
            )
          ],
        ),
      ),
    );
  }
}
