import 'package:api_getx/routes/app_routes.dart';
import 'package:api_getx/themes/themes.dart';
import 'package:api_getx/views/location/location_screen.dart';
import 'package:api_getx/views/screens/Auth/sign_up/sign_up.dart';
import 'package:api_getx/views/screens/User/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'views/screens/Auth/login/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'shooter app',
          theme: Themes().lightTheme,

          darkTheme: Themes().darkTheme,

          initialRoute: AppRoutes.locationScreen,
          getPages: AppRoutes.routes,
        home: LocationScreen()
      ),
      designSize: Size(333, 900),
    );
  }
}
