import 'package:api_getx/controller/auth_controller.dart';
import 'package:api_getx/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final AuthController authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 50,),
            TextField(
              controller: authController.emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: authController.passWordControler,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 20),
             ElevatedButton(
              onPressed: () {
                authController.handleSignUp();
                Get.toNamed(AppRoutes.logInScreen);
              },
              child: const Text('Signup'),
            )
          ],
        ),
      ),
    );
  }
}
