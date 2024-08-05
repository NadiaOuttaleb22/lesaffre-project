import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:prj/core/class/statusrequest.dart';
import 'package:prj/core/constant/imageassets.dart';

class Handlingdataview extends StatelessWidget {
  final Statusrequest statusrequest;
  final Widget widget;
  const Handlingdataview(
      {super.key, required this.statusrequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusrequest == Statusrequest.loading
        ? Center(child: Lottie.asset(Imageassets.loading))
        : statusrequest == Statusrequest.offlinefailure
            ? Center(child: Lottie.asset(Imageassets.offline))
            : statusrequest == Statusrequest.serverfailure
                ? Center(child: Lottie.asset(Imageassets.server))
                : statusrequest == Statusrequest.failure
                    ? Center(child: Lottie.asset(Imageassets.nodata))
                    : widget;
  }
}
