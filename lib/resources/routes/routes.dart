
import 'package:get/get.dart';
import 'package:hrms/resources/routes/routes_name.dart';
import 'package:hrms/view/home.dart';

class AppRoutes {

  static appRoutes() => [
    GetPage(
      name: RouteName.splashScreen,
      page: () => const MyHome() ,
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ),
  ];
}