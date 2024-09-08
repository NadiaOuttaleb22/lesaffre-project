import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prj/controler/home/provider/neworders_controller.dart';
import 'package:prj/core/class/handlingdataview.dart';
import 'package:prj/data/model/summary_model.dart';
import 'package:prj/view/widget/home/provider/ordres/neworderslist.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';

Future<void> _generatePdf(List<SummaryModel> orders) async {
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
                      pw.Text("Order name: ${order.itemsName}"),
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

class Neworderslistview extends GetView<NewordersController> {
  const Neworderslistview({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NewordersController());
    return Scaffold(
        appBar: AppBar(title: const Text("Orders List"), actions: [
          IconButton(
              icon: const Icon(Icons.picture_as_pdf),
              onPressed: () {
                controller.data.isNotEmpty
                    ? (
                        controller.sendAndPrepare(),
                        _generatePdf(controller.summarydata)
                      )
                    : Get.snackbar("failure", "the list Is Empty");
              })
        ]),
        body: Container(
            padding: const EdgeInsets.all(10),
            child: GetBuilder<NewordersController>(
                builder: ((controller) => Handlingdataview(
                    statusrequest: controller.statusrequest,
                    widget: ListView.builder(
                        itemCount: controller.data.length,
                        itemBuilder: ((context, index) => Neworderslist(
                            listdata: controller.data[index]))))))));
  }
}
