import 'package:flutter/material.dart';
import 'package:prj/core/constant/color.dart';

class Custumbuttonappbar extends StatelessWidget {
  final void Function()? onPressed;
  final String textbutton;
  final IconData iconData;
  final bool? active;

  const Custumbuttonappbar(
      {super.key,
      required this.textbutton,
      required this.iconData,
      required this.onPressed,
      required this.active});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(iconData,
              color: active == true ? Colorapp.primaryColors : Colorapp.grey),
          Text(textbutton,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color:
                      active == true ? Colorapp.primaryColors : Colorapp.grey))
        ],
      ),
    );
  }
}
