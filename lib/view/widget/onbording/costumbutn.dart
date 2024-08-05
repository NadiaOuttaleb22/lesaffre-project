import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/controler/onboControler.dart';

class costumbutn extends GetView<Onbocontrolerimp> {
  const costumbutn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 2),
        textColor: Colors.white,
        onPressed: () {
          controller.next();
        },
        color: const Color.fromARGB(255, 174, 21, 79),
        child: const Text('Continue',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
      ),
    );
  }
}
