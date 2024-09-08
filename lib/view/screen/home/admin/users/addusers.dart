import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/controler/home/admin/users_controllsers.dart';
import 'package:prj/core/class/handlingdataview.dart';
import 'package:prj/core/functions/validateurinput.dart';
import 'package:prj/view/widget/auth/custumButtomAuth.dart';
import 'package:prj/view/widget/auth/textformauth.dart';

class Addusers extends StatelessWidget {
  const Addusers({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddUsersController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 251, 251, 251),
        elevation: 0.0,
        title: const Text('Add new user',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color.fromARGB(255, 108, 107, 107))),
      ),
      // Utiliser un SingleChildScrollView à la place de ListView pour éviter les conflits
      body: GetBuilder<AddUsersController>(
          builder: (controllerImp) => HandlingdatRequest(
                statusrequest: controllerImp.statusrequest,
                widget: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 40),
                    child: Form(
                      key: controllerImp.formstate,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: const Text('add client',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey)),
                          ),
                          const SizedBox(height: 40),
                          CustomtextFormAuth(
                              hint: 'Enter user name ',
                              iconData: Icons.person_2_outlined,
                              label: 'name',
                              mycontroller: controllerImp.username,
                              valid: (val) {
                                return validInput(val!, 5, 100, 'username');
                              }),
                          const SizedBox(height: 20),
                          CustomtextFormAuth(
                            hint: 'Enter user Login ',
                            iconData: Icons.login_outlined,
                            label: 'Login',
                            mycontroller: controllerImp.loginn,
                            valid: (val) {
                              return validInput(val!, 5, 100, 'login');
                            },
                          ),
                          const SizedBox(height: 20),
                          GetBuilder<AddUsersController>(
                            builder: (controllerImp) => CustomtextFormAuth(
                              obscuretxt: controllerImp.isShowPassword,
                              onTapIcon: () {
                                controllerImp.showPassword();
                              },
                              hint: 'Enter user Password ',
                              iconData: Icons.lock_outlined,
                              label: 'Password',
                              mycontroller: controllerImp.password,
                              valid: (val) {
                                return validInput(val!, 5, 30, 'password');
                              },
                            ),
                          ),
                          const SizedBox(height: 20),
                          CustomtextFormAuth(
                              hint: 'Enter user email ',
                              iconData: Icons.email_outlined,
                              label: 'email',
                              mycontroller: controllerImp.email,
                              valid: (val) {
                                return validInput(val!, 5, 100, 'email');
                              }),
                          const SizedBox(height: 20),
                          const Text('Acces',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold)),

                          // Ajouter les boutons radio ici
                          GetBuilder<AddUsersController>(
                            builder: (controllerImp) => Column(
                              children: [
                                ListTile(
                                  title: const Text('Dejeuner'),
                                  leading: Radio(
                                    value: '1',
                                    groupValue: controllerImp.access,
                                    onChanged: (value) {
                                      controllerImp.updateRadio(value);
                                    },
                                  ),
                                ),
                                ListTile(
                                  title:
                                      const Text('Dejeuner et Petit Dejeuner'),
                                  leading: Radio(
                                    value: '2',
                                    groupValue: controllerImp.access,
                                    onChanged: (value) {
                                      controllerImp.updateRadio(value);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Text('User type:',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold)),

                          GetBuilder<AddUsersController>(
                            builder: (controllerImp) => Column(
                              children: [
                                ListTile(
                                  title: const Text('Normal users'),
                                  leading: Radio(
                                    value: '1',
                                    groupValue: controllerImp.typeUser,
                                    onChanged: (value) {
                                      controllerImp.updateRadioUser(value);
                                    },
                                  ),
                                ),
                                ListTile(
                                  title: const Text('Admin'),
                                  leading: Radio(
                                    value: '2',
                                    groupValue: controllerImp.typeUser,
                                    onChanged: (value) {
                                      controllerImp.updateRadioUser(value);
                                    },
                                  ),
                                ),
                                ListTile(
                                  title: const Text('Provider'),
                                  leading: Radio(
                                    value: '3',
                                    groupValue: controllerImp.typeUser,
                                    onChanged: (value) {
                                      controllerImp.updateRadioUser(value);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),

                          custumButtomAuth(
                            text: "add ",
                            onPressed: () {
                              controllerImp.addUsers();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )),
    );
  }
}
