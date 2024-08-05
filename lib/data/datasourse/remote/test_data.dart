import 'package:prj/core/class/crud.dart';
import 'package:prj/linkapi.dart';

class TestData {
  Crud crud;

  TestData(this.crud);

  // ignore: non_constant_identifier_names
  GetData() async {
    var response = await crud.postData(Linkapi.test, {});
    return response.fold((l) => l, (r) => r);
  }
}
