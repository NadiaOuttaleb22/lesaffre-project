class Linkapi {
  static const String server = "http://192.168.8.129:3000";

  //static const String server = "http://localhost:3000";
  static const String test = "$server/test.php";

  //==================auth===================================//

  static const String signUp = "$server/auth/signup.php";
  static const String login = "$server/auth/login.php"; //

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
  static const String imageHomelunch = "$server/image_home_lunch"; //
  static const String imageHomelunchitems = "$server/image_home_lunch_items"; //
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

  //==================checkout===============================//
  static const String addcheckout = "$server/orders/add.php";
  static const String orderstraking = "$server/orders/orderstraking.php";
  static const String archive = "$server/orders/archive.php";
  static const String details = "$server/orders/details.php";
  static const String delete = "$server/orders/delete.php";

  //==================provider settings======================//
/////////// orders
//action
  static const String archiveProvider =
      "$server/provider/orders/action/archive.php";
  static const String sendProvider = "$server/provider/orders/action/send.php";
  static const String archiveall =
      "$server/provider/orders/action/archiveall.php";

  static const String modifystatusfacture =
      "$server/provider/orders/action/modifyforfacture.php";

//view
  static const String neworders = "$server/provider/orders/view/neworders.php";

  static const String ordersunderpreparation =
      "$server/provider/orders/view/ordersunderpreparation.php";

  static const String archiveView = "$server/provider/orders/view/archive.php";
  static const String summaryorders =
      "$server/provider/orders/view/getitemsview.php";

  static const String getallfacture =
      "$server/provider/orders/view/getallfacture.php";

  /////// foods
  ///lunch

  static const String viewCategories =
      "$server/provider/food/lunch/categories/view.php";
  static const String addCategories =
      "$server/provider/food/lunch/categories/add.php";
  static const String removecategories =
      "$server/provider/food/lunch/categories/remove.php";
  static const String editcategories =
      "$server/provider/food/lunch/categories/edit.php";

  static const String viewItems = "$server/provider/food/lunch/items/view.php";
  static const String addItems = "$server/provider/food/lunch/items/add.php";
  static const String removeItems =
      "$server/provider/food/lunch/items/remove.php";
  static const String editItems = "$server/provider/food/lunch/items/edit.php";

  //admin users
  static const String viewUsers = "$server/admin/view.php";
  static const String addUsers = "$server/admin/add.php";
  static const String removeUsers = "$server/admin/remove.php";
  static const String editUsers = "$server/admin/edit.php";
  static const String detailsUsers = "$server/admin/details.php";
}
