import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/controler/home/navigator_bar/setting_controller.dart';
import 'package:prj/core/constant/color.dart';
import 'package:prj/core/constant/imageassets_and_lottie.dart';
import 'package:prj/core/constant/rootes.dart';
import 'package:url_launcher/url_launcher.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    SettingControllerImp controllerImp = Get.put(SettingControllerImp());
    return Container(
      child: ListView(children: [
        Stack(clipBehavior: Clip.none, alignment: Alignment.center, children: [
          Container(
            height: Get.width / 3,
            color: Colorapp.primaryColors,
          ),
          Positioned(
              top: Get.width / 5.9,
              child: const CircleAvatar(
                  radius: 66, backgroundImage: AssetImage(Imageassets.avatar)))
        ]),
        const SizedBox(height: 90),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: const Text('Disable notification'),
                  onTap: () {},
                  trailing: Transform.scale(
                    scale: 0.7, // Réduit la taille du Switch
                    child: Switch(
                      onChanged: (val) {},
                      value: true,
                      activeColor: Colors.green,
                      inactiveThumbColor: Colors.grey,
                      inactiveTrackColor: Colors.red.withOpacity(0.5),
                      activeTrackColor: Colors.greenAccent,
                    ),
                  ),
                ),
                const Divider(),
                ListTile(
                  title: const Text('Orders'),
                  onTap: () {
                    Get.toNamed(approote.orders);
                  },
                  trailing: const Icon(
                    Icons.shopping_cart_checkout,
                    color: Colorapp.grey,
                  ),
                ),
                const Divider(),
                ListTile(
                  title: const Text('Archive'),
                  onTap: () {
                    Get.toNamed(approote.ordersarchive);
                  },
                  trailing: const Icon(
                    Icons.archive_outlined,
                    color: Colorapp.grey,
                  ),
                ),
                const Divider(),
                ListTile(
                  title: const Text('About us'),
                  onTap: () {},
                  trailing: const Icon(
                    Icons.help_outline_rounded,
                    color: Colorapp.grey,
                  ),
                ),
                const Divider(),
                ListTile(
                  title: const Text('Contact us'),
                  onTap: () async {
                    await launchUrl(Uri.parse("tel:+212762603654"));
                  },
                  trailing: const Icon(
                    Icons.phone_callback,
                    color: Colorapp.grey,
                  ),
                ),
                const Divider(),
                ListTile(
                  title: const Text('Logout'),
                  onTap: () {
                    controllerImp.logOut();
                  },
                  trailing: const Icon(
                    Icons.exit_to_app_rounded,
                    color: Colorapp.grey,
                  ),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
