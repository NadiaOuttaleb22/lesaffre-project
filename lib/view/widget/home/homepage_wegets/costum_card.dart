import 'package:flutter/material.dart';
import 'package:prj/core/constant/color.dart';

class CostumCard extends StatelessWidget {
  final String titl;
  final String body;
  const CostumCard({super.key, required this.titl, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            height: 150,
            decoration: BoxDecoration(
                color: Colorapp.primaryColors,
                borderRadius: BorderRadius.circular(20)),
            child: ListTile(
              title: Text(
                titl,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              subtitle: Text(
                body,
                style: const TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ),
          Positioned(
            top: -20,
            right: -20,
            child: Container(
              height: 160,
              width: 160,
              decoration: BoxDecoration(
                  color: Colorapp.secondColor,
                  borderRadius: BorderRadius.circular(130)),
            ),
          )
        ],
      ),
    );
  }
}
