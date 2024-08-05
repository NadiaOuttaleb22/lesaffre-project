import 'package:prj/core/class/statusrequest.dart';

handlingData(response) {
  if (response is Statusrequest) {
    print("Handling data: $response");
    return response;
  } else {
    print("Handling data: success");
    return Statusrequest.success;
  }
}
