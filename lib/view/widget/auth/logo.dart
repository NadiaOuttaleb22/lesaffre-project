import 'package:flutter/material.dart';
import 'package:prj/core/constant/imageassets.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Imageassets.logo,
      width: 100,
      height: 50,
    );
  }
}
