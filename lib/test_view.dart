import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/controler/test_controller.dart';
import 'package:prj/core/class/handlingdataview.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
        appBar: AppBar(
            title: const Text('dataa'),
            backgroundColor: const Color.fromARGB(255, 197, 3, 3)),
        body: GetBuilder<TestController>(builder: (controller) {
          return Handlingdataview(
              statusrequest: controller.statusrequest,
              widget: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("${controller.data[index]['users_name']}"),
                      subtitle:
                          Text("${controller.data[index]['users_email']}"),
                    );
                  }));
        }));
  }
}
