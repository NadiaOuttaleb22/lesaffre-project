import 'package:flutter/material.dart';

class Costumappbarhome extends StatelessWidget {
  final String titleappbar;
  final void Function()? onPressedIconfavorite;
  final void Function()? onPressedSearch;
  final void Function(String)? onChanged;
  final TextEditingController mycontroller;
  const Costumappbarhome(
      {super.key,
      required this.titleappbar,
      required this.onPressedIconfavorite,
      required this.onPressedSearch,
      required this.onChanged,
      required this.mycontroller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Expanded(
              child: TextFormField(
            controller: mycontroller,
            onChanged: onChanged,
            decoration: InputDecoration(
                prefixIcon: IconButton(
                    onPressed: onPressedSearch, icon: const Icon(Icons.search)),
                hintText: titleappbar,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15)),
                filled: true,
                fillColor: const Color.fromARGB(255, 212, 210, 210)),
          )),
          const SizedBox(width: 8),
          Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 212, 210, 210),
                borderRadius: BorderRadius.circular(15)),
            width: 60,
            height: 60,
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: IconButton(
              onPressed: onPressedIconfavorite,
              icon: const Icon(Icons.favorite_border_rounded),
              color: const Color.fromARGB(255, 76, 76, 76),
            ),
          )
        ],
      ),
    );
  }
}
