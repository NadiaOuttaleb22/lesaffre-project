import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/controler/home/favorite_lunch/myfavorite_viewcontroller.dart';
import 'package:prj/core/constant/color.dart';
import 'package:prj/data/model/myfavorite_model.dart';
import 'package:prj/linkapi.dart';

class CostumlistFavorite extends GetView<MyfavoriteViewcontrollerImp> {
  final MyFavoriteModel myFavoriteModel;
  const CostumlistFavorite({super.key, required this.myFavoriteModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          //controller.goToPageProduct(itemLunchModel);
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                  tag: "${myFavoriteModel.itemsId}",
                  child: CachedNetworkImage(
                    imageUrl:
                        "${Linkapi.imageHomelunchitems}/${myFavoriteModel.itemsImage!}",
                    height: 100,
                    width: 100,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                const SizedBox(height: 10),
                Text(myFavoriteModel.itemsName!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 44, 43, 43),
                        fontSize: 19,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                Text(myFavoriteModel.itemsDesc!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colorapp.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.w600)),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${myFavoriteModel.itemsPrice!.toString()} dh",
                        style: const TextStyle(
                            color: Colorapp.red,
                            fontSize: 17,
                            fontWeight: FontWeight.bold)),
                    IconButton(
                        onPressed: () {
                          controller.deleteFromFavorite(
                              myFavoriteModel.favoriteId.toString());
                        },
                        icon: const Icon(
                          Icons.delete_outline,
                          color: Colorapp.red,
                        ))
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
