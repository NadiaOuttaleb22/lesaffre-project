import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/controler/home/provider/neworders_controller.dart';
import 'package:prj/core/class/handlingdataview.dart';
import 'package:prj/core/constant/styles.dart';
import 'package:prj/data/model/facture_model.dart';
import 'package:prj/view/widget/home/provider/ordres/archivelist.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';

Future<void> _generatePdf(List<FactureModel> orders) async {
  final pdf = pw.Document();

  pdf.addPage(pw.Page(build: (pw.Context context) {
    return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text("Orders Summary", style: const pw.TextStyle(fontSize: 24)),
          pw.Divider(),
          pw.ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text("Order name: ${order.usersId}"),
                      pw.Text("Order name: ${order.usersName}"),
                      pw.Text("Quantity: ${order.totalOrders}"),
                      pw.Text("Quantity: ${order.totalPrice}"),
                      pw.Divider()
                    ]);
              })
        ]);
  }));
  await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save());
}

class Archivelistview extends GetView<FactureController> {
  const Archivelistview({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ArchiveProviderController());
    Get.put(FactureController());

    return Scaffold(
        appBar: AppBar(
          title: const Text("Archive"),
        ),
        body: Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              ElevatedButton(
                  onPressed: () {
                    controller.changeStatus();
                    _generatePdf(controller.data);
                  },
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.picture_as_pdf_outlined,
                          color: Colors.red.shade900,
                        ),
                        const SizedBox(width: 20),
                        const Text(
                          "Get All Factures",
                          style: Styles.textnormal2,
                        )
                      ])),
              const SizedBox(height: 8),
              Expanded(
                  child: GetBuilder<ArchiveProviderController>(
                      builder: ((controller) => Handlingdataview(
                          statusrequest: controller.statusrequest,
                          widget: ListView.builder(
                              itemCount: controller.dataarchive.length,
                              itemBuilder: ((context, index) => Archivelist(
                                  listdata: controller.dataarchive[index])))))))
            ])));
  }
}
