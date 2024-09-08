import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/controler/home/admin/users_controllsers.dart';
import 'package:prj/core/class/handlingdataview.dart';

class DetailsUsers extends GetView<DetailsUsersController> {
  const DetailsUsers({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DetailsUsersController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("User Details"),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 8,
                shadowColor: Colors.grey.withOpacity(0.5),
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GetBuilder<DetailsUsersController>(
                        builder: (controller) => Handlingdataview(
                            statusrequest: controller.statusrequest,
                            widget: ListView.builder(
                                itemCount: controller.data.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Center(
                                          child: Text(
                                            "",
                                            style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blueAccent,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        ListTile(
                                          leading: const Icon(Icons.person,
                                              color: Colors.blueAccent),
                                          title: const Text("Login"),
                                          subtitle: Text(controller
                                              .data[index].usersLogin),
                                        ),
                                        const Divider(),
                                        ListTile(
                                          leading: const Icon(Icons.email,
                                              color: Colors.orangeAccent),
                                          title: const Text("Email"),
                                          subtitle: Text(controller
                                              .data[index].usersEmail),
                                        ),
                                        const Divider(),
                                        ListTile(
                                          leading: const Icon(Icons.security,
                                              color: Colors.redAccent),
                                          title: const Text("Access"),
                                          subtitle: Text(controller
                                              .tradUserAcces(controller
                                                  .data[index].usersAcces)),
                                        ),
                                        const Divider(),
                                        ListTile(
                                            leading: const Icon(Icons.category,
                                                color: Colors.purpleAccent),
                                            title: const Text("User Type"),
                                            subtitle: Text(controller
                                                .tradUserType(controller
                                                    .data[index].usersType))),
                                        const Divider(),
                                        ListTile(
                                            leading: const Icon(
                                                Icons.date_range,
                                                color: Colors.greenAccent),
                                            title: const Text("Created At"),
                                            subtitle: Text(controller
                                                .data[index].usersCreate))
                                      ]);
                                })))))));
  }
}
