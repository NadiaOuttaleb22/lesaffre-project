class Linkapi {
  static const String server = "http://192.168.8.129/lesaffre";
  static const String test = "$server/test.php";

  //==================auth===================================//

  static const String signUp = "$server/auth/signup.php";
  static const String login = "$server/auth/login.php";

  //==================forget Password=========================//

  static const String checkEmail = "$server/forgetPassword/checkEmail.php";
  static const String verifyCode = "$server/forgetPassword/verifyCode.php";
  static const String resetPassword =
      "$server/forgetPassword/ressetPassword.php";
  static const String changePassword = "$server/auth/changepassword.php";
  static const String resendcode = "$server/auth/resendcode.php";

  //==================Home===================================//
  static const String homelunch = "$server/home.php";

  //==================imageHomeLunch========================//
  static const String imageHomelunch = "$server/image_home_lunch/";
  static const String imageHomelunchitems = "$server/image_home_lunch_items/";
  //==================items lunch===========================//

  static const String itemslunch = "$server/items/itemslunch.php";
  static const String search = "$server/items/search.php";

  //==================favorite luch=========================//

  static const String addfavorite = "$server/favorite/add_favorite.php";
  static const String removefavorite = "$server/favorite/remove.php";
  static const String viewfavorite = "$server/favorite/view.php";
  static const String deletefromfavorite =
      "$server/favorite/deletefromfavorite.php";

  //==================Card==================================//
  static const String cardadd = "$server/cart/add.php";
  static const String cardremove = "$server/cart/delete.php";
  static const String cardview = "$server/cart/view.php";
  static const String cardcount = "$server/cart/get_count_items.php";

  //==================Coupon=================================//
  static const String checkcoupon = "$server/coupon/checkcoupon.php";
}
