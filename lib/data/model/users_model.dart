class UsersModel {
  var usersId;
  var usersName;
  var usersLogin;
  var usersEmail;
  var usersPassword;
  var usersAcces;
  var usersType;
  var usersVerifycode;
  var usersCreate;

  UsersModel(
      {this.usersId,
      this.usersName,
      this.usersLogin,
      this.usersEmail,
      this.usersPassword,
      this.usersAcces,
      this.usersType,
      this.usersVerifycode,
      this.usersCreate});

  UsersModel.fromJson(Map<String, dynamic> json) {
    usersId = json['users_id'];
    usersName = json['users_name'];
    usersLogin = json['users_login'];
    usersEmail = json['users_email'];
    usersPassword = json['users_password'];
    usersAcces = json['users_acces'];
    usersType = json['users_type'];
    usersVerifycode = json['users_verifycode'];
    usersCreate = json['users_create'];
  }
}
