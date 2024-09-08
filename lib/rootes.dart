import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:prj/core/constant/rootes.dart';
import 'package:prj/core/middlewere/mymiddlewere.dart';
import 'package:prj/view/screen/auth/changePassword.dart';
import 'package:prj/view/screen/forgetPassword/ResetPasword.dart';
import 'package:prj/view/screen/forgetPassword/forgetPass.dart';
import 'package:prj/view/screen/forgetPassword/succesIcon.dart';
import 'package:prj/view/screen/auth/login.dart';
import 'package:prj/view/screen/forgetPassword/succes.dart';
import 'package:prj/view/screen/forgetPassword/verifyCode.dart';
import 'package:prj/view/screen/auth/singup.dart';
import 'package:prj/view/screen/auth/succesiconadd.dart';
import 'package:prj/view/screen/home/admin/adminsetting.dart';
import 'package:prj/view/screen/home/admin/users/addusers.dart';
import 'package:prj/view/screen/home/admin/users/detailsusers.dart';
import 'package:prj/view/screen/home/admin/users/editusers.dart';
import 'package:prj/view/screen/home/cart.dart';
import 'package:prj/view/screen/home/checkout.dart';
import 'package:prj/view/screen/home/homepage_user_type/normalhomepagebreackfast.dart';
import 'package:prj/view/screen/home/items.dart';
import 'package:prj/view/screen/home/myfavorite.dart';
import 'package:prj/view/screen/home/admin/nagivatorbar.dart';
import 'package:prj/view/screen/home/homepage_user_type/normalhomapage.dart';
import 'package:prj/view/screen/home/orders/archive.dart';
import 'package:prj/view/screen/home/orders/details.dart';
import 'package:prj/view/screen/home/orders/orders_traking.dart';
import 'package:prj/view/screen/home/provider/items_view.dart';
import 'package:prj/view/screen/home/provider/navigationbar.dart';
import 'package:prj/view/screen/home/provider/providersetting.dart';
import 'package:prj/view/screen/onborging.dart';
import 'package:prj/view/screen/home/productdetails.dart';
import 'package:prj/view/widget/home/provider/categories/add_categoriespage.dart';
import 'package:prj/view/widget/home/provider/items/additems.dart';
import 'package:prj/view/widget/home/provider/items/edititems.dart';
import 'package:prj/view/widget/home/provider/ordres/archivelistview.dart';
import 'package:prj/view/widget/home/provider/categories/editpage_categories.dart';
import 'package:prj/view/widget/home/provider/ordres/neworderslistview.dart';
import 'package:prj/view/widget/home/provider/ordres/ordersunderpreparation_view.dart';

List<GetPage<dynamic>>? roote = [
  GetPage(
      name: '/', page: () => const Onborging(), middlewares: [Mymiddlewere()]),

  //GetPage(name: "/", page: () => const CustomCard()),
  //GetPage(name: "/", page: () => const Productdetails()),

  GetPage(name: approote.login, page: () => const Login()),
  GetPage(name: approote.onbording, page: () => const Onborging()),
  GetPage(name: approote.forgetpass, page: () => const Forgetpass()),
  GetPage(name: approote.verifyCode, page: () => const Verifycode()),
  GetPage(name: approote.resetPassword, page: () => const Resetpasword()),
  GetPage(
      name: approote.succesResetPasword, page: () => const SuccesResetPass()),

  GetPage(name: approote.changepassword, page: () => const Changepassword()),
  GetPage(name: approote.succesIcon, page: () => const Succesicon()),
  GetPage(name: approote.succesIconAdd, page: () => const Succesiconadd()),
  GetPage(name: approote.signUp, page: () => const Singup()),

  //home page
  GetPage(name: approote.welcome, page: () => const HomeScreen()),
  GetPage(
      name: approote.providerHomePage, page: () => const HomeScreenProvider()),
  GetPage(name: approote.normalHomePage, page: () => const Normalhomapage()),
  GetPage(
      name: approote.normalHomePageBreackFast,
      page: () => const Normalhomepagebreackfast()),

  GetPage(name: approote.itemslunch, page: () => const Items()),

  //product details
  GetPage(name: approote.productdetails, page: () => const Productdetails()),
  //favorite
  GetPage(name: approote.myfavorite, page: () => const Myfavorite()),
  //card
  GetPage(name: approote.card, page: () => const CustomCard()),
  //checkOut

  GetPage(name: approote.checkout, page: () => const Checkout()),
  //details orders
  GetPage(name: approote.ordersdetails, page: () => const DetailsOrders()),
  GetPage(name: approote.ordersarchive, page: () => const ArchiveOrders()),
  GetPage(name: approote.orders, page: () => const OrdersTraking()),
  GetPage(name: approote.neworders, page: () => const Neworderslistview()),
  GetPage(
      name: approote.ordersunderpreparation,
      page: () => const OrdersunderpreparationView()),

  GetPage(
      name: approote.archivesettingprovider,
      page: () => const Archivelistview()),
//categories provider
  GetPage(name: approote.addcategories, page: () => const AddCategoriesPage()),
  GetPage(name: approote.viewcategories, page: () => const Providersetting()),
  GetPage(
      name: approote.editcategories, page: () => const EditpageCategories()),
//items
  GetPage(name: approote.additems, page: () => const Additems()),
  GetPage(name: approote.viewitems, page: () => const ItemsView()),
  GetPage(name: approote.editems, page: () => const Edititems()),
//users
  GetPage(name: approote.addUsers, page: () => const Addusers()),
  GetPage(name: approote.viewUsers, page: () => const Adminsetting()),
  GetPage(name: approote.editUsers, page: () => const Editusers()),
  GetPage(name: approote.detailsusers, page: () => const DetailsUsers()),
];
