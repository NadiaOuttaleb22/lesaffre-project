import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/controler/auth/succesiconadd_controller.dart';
import 'package:prj/view/widget/auth/custumButtomAuth.dart';

class Succesiconadd extends StatelessWidget {
  const Succesiconadd({super.key});

  @override
  Widget build(BuildContext context) {
    SuccesiconaddControllerImp controllerImp =
        Get.put(SuccesiconaddControllerImp());
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
            const Text('the client has been added successfully'),
            const Text('data'),
            const Spacer(),
            SizedBox(
                width: double.infinity,
                child: custumButtomAuth(
                    text: "back",
                    onPressed: () {
                      controllerImp.gotoPageWelcome();
                    })),
            const SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}
