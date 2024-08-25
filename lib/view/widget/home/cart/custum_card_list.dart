import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:prj/core/constant/color.dart';
import 'package:prj/linkapi.dart';

class CustumCardList extends StatelessWidget {
  final String name;
  final String price;
  final int count;
  final String imagname;
  final void Function()? onPressedadd;
  final void Function()? onPressedremove;
  const CustumCardList(
      {super.key,
      required this.name,
      required this.price,
      required this.count,
      required this.imagname,
      required this.onPressedadd,
      required this.onPressedremove});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(children: [
              Expanded(
                  flex: 1,
                  child: CachedNetworkImage(
                      imageUrl: "${Linkapi.imageHomelunchitems}/$imagname",
                      height: 80)),
              Expanded(
                  flex: 2,
                  child: Column(children: [
                    ListTile(
                        title: Text(name),
                        subtitle: Text('$price dh',
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colorapp.primaryColors)))
                  ])),
              Expanded(
                  child: Column(children: [
                SizedBox(
                    height: 36,
                    child: IconButton(
                        onPressed: onPressedadd, icon: const Icon(Icons.add))),
                Text(count.toString()),
                SizedBox(
                    height: 24,
                    child: IconButton(
                        onPressed: onPressedremove,
                        icon: const Icon(Icons.remove)))
              ]))
            ])));
  }
}
