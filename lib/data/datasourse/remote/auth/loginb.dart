import 'package:prj/core/class/crud.dart';
import 'package:prj/linkapi.dart';
//import 'package:prj/linkapi.dart';

/* class SignupData {
  Crud crud;

  SignupData(this.crud);

  // ignore: non_constant_identifier_names
  postdata(
    String username,
    String usersLogin,
    String userEmail,
    String userPassword,
    String userAcces,
    String usertype,
  ) async {
    var response = await crud.postData(Linkapi.signUp, {
      "users_name": username,
      "users_login": usersLogin,
      "users_email": userEmail,
      "users_password": userPassword,
      "users_acces": userAcces,
      "users_type": usertype,
    });

    return response.fold((l) => l, (r) => r);
  }
} */
class LoginData {
  Crud crud;
  LoginData(this.crud);

  postdata(String usersLogin, String userPassword) async {
    var response = await crud.postData(Linkapi.login, {
      "usersLogin": usersLogin,
      "userPassword": userPassword,
    });

    print('usersLogin: $usersLogin');
    print('Password: $userPassword');
    print('===========================');
    print(response);

    return response.fold((l) => l, (r) => r);
  }
}
