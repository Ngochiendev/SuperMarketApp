import 'package:get/get.dart';
import 'package:sale_app/Src/Pages/Screen/AllScreen.dart';
import 'package:sale_app/Src/Pages/auth/SignUpScreen.dart';
import 'package:sale_app/Src/Pages/auth/SigninScreen.dart';
import 'package:sale_app/Src/Pages/auth/SplashScreen.dart';

abstract class AppPage {
  static final pages = <GetPage>[
    GetPage(
      name: PageRoutes.splashRoute,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: PageRoutes.SigninRoute,
      page: () => SignInScreen(),
    ),
    GetPage(
      name: PageRoutes.SignupRoute,
      page: () => const SignUpScreen(),
    ),
    GetPage(
      name: PageRoutes.AllPageRoute,
      page: () => AllScreen(),
    ),
  ];
}

abstract class PageRoutes {
  static const String splashRoute = '/splash';
  static const String SigninRoute = '/signin';
  static const String SignupRoute = '/signup';
  //this is all page ...
  static const String AllPageRoute = '/';
}
