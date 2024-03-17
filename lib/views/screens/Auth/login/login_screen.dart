import 'package:api_getx/controller/auth_controller.dart';
import 'package:api_getx/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/app_string.dart';
import '../../../widgets/custom_text.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final _authController = AuthController();

    return Scaffold(
      resizeToAvoidBottomInset: true,

      ///-----------------------body sction--------------------------->
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          // clipBehavior: Clip.none,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 150.h,
                ),
                TextField(
                  controller: _authController.emailController,
                  decoration: const InputDecoration(
                    hintText : 'Email',
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _authController.passWordControler,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText : 'Password',
                  ),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    _authController.heandleLogin();
                  },
                  child: const Text('Log In'),
                ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const CustomText(text: "Don't have account", color: Colors.green,top: 10),
                    TextButton(onPressed: (){
                      Get.toNamed(AppRoutes.signUpScreen);
                    }, child: const CustomText(text: "Sign Up", top: 10, color: Colors.red,)),
                  ],
                ),


                const SizedBox(height: 100),
              ],
            )
          ],
        ),
      ),
    );
  }
}
