import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/data/datasourse/static/static.dart';
import 'package:prj/controler/onboControler.dart';

class Slidercostum extends GetView<Onbocontrolerimp> {
  const Slidercostum({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (val) {
          controller.onpagechanged(val);
        },
        itemCount: onbordinglist.length,
        itemBuilder: (context, i) => Column(
              children: [
                Text(
                  onbordinglist[i].title!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(height: 30),
                Center(
                    child: ClipOval(
                        child: Image.asset(
                  onbordinglist[i].image!,
                  width: 200,
                  height: 200,
                  fit: BoxFit.fill,
                ))),
                const SizedBox(height: 60),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(onbordinglist[i].body!,
                      style: Theme.of(context).textTheme.bodyLarge),
                )
              ],
            ));
  }
}
