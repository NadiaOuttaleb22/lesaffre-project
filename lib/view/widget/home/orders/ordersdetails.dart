import 'package:flutter/material.dart';
import 'package:prj/core/constant/styles.dart';
/* 
class Ordersdetails extends StatelessWidget {
  const Ordersdetails({super.key});

  @override
  Widget build(BuildContext context) {
     Get.put(DetailsController());
    return Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: GetBuilder<DetailsController>(builder: (controller) => Handlingdataview(statusrequest:controller.statusrequest , widget: ListView(children: [
          Card(
            child: Column(
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: 
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    color: const Color.fromARGB(255, 230, 230, 231),
                    child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: const ListTile(
                          title: Text(
                            "Price: 100 DH",
                            textAlign: TextAlign.center,
                            style: Styles.pricestyletext,
                          ),
                          subtitle: Text(
                            "adress : lesaffre FES hay NAJJAH",
                            textAlign: TextAlign.center,
                            style: Styles.hintstyle,
                          ),
                        )),
                  ),
                )
              ],
            ),
          ),
        ]))));
  }
} */

class Textdetails extends StatelessWidget {
  final String text;
  const Textdetails({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: Styles.pricestyle,
    );
  }
}
/* 
class TableOrdersDetails extends StatelessWidget {
  const TableOrdersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
                    children: const [
                      TableRow(children: [
                        Textdetails(text: 'Items'),
                        Textdetails(text: 'Qty'),
                        Textdetails(text: 'Price'),
                      ]),
                      /* TableRow(children: [
                        Text(
                          "tacos chicken",
                          textAlign: TextAlign.center,
                          style: Styles.textnormal,
                        ),
                        Text(
                          "4",
                          textAlign: TextAlign.center,
                          style: Styles.textnormal,
                        ),
                        Text(
                          "100 DH",
                          textAlign: TextAlign.center,
                          style: Styles.textnormal,
                        )
                      ]), */
                      ...List.generate(contro, generator)
                    ],
                  );
  }
}
 */