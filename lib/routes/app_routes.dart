import 'package:get/get.dart';

import '../views/screens/Auth/login/login_screen.dart';
import '../views/screens/Auth/sign_up/sign_up.dart';
import '../views/screens/User/user_screen.dart';
import '../views/screens/location/location_screen.dart';


class AppRoutes {
  static const String logInScreen = "/LogInScreen.dart";
  static const String locationScreen = "/LocationScreen.dart";
  static const String signUpScreen = "/SignUpScreen.dart";
  static const String userScreen = "/UserScreen.dart";


  static List<GetPage> get routes => [
    GetPage(name: logInScreen, page: () => LogInScreen()),
    GetPage(name: locationScreen, page: () => LocationScreen()),
    GetPage(name: signUpScreen, page: () => SignUpScreen()),
    GetPage(name: userScreen, page: () => UserScreen()),

  ];
}
