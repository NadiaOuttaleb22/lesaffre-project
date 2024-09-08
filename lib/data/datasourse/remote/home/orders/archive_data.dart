import 'package:prj/core/class/crud.dart';
import 'package:prj/linkapi.dart';

class ArchiveData {
  Crud crud;

  ArchiveData(this.crud);

  getData(String userid) async {
    var response = await crud.postData(Linkapi.archive, {
      "id": userid.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
