import 'dart:convert';

import 'package:api_getx/contstant/constants.dart';
import 'package:api_getx/routes/app_routes.dart';
import 'package:api_getx/services/api_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class AuthController extends GetxController {


  ///<===sign up===>
  final emailController = TextEditingController();
  final passWordControler = TextEditingController();
  var signUploading = false.obs;

  handleSignUp() async {
    Map<String, String> header = {"Content-Type": 'application/json'};

    var body = {
      "email": emailController.text.trim(),
      "password": passWordControler.text,
    };

    var response = await ApiClient.postData(
        ApiConstants.signUp, jsonEncode(body),
        headers: header);



    if (response.statusCode == 201) {
      debugPrint("=============Complete sign up");
    }
    signUploading(false);
  }




  ///<===============log in===================>
  RxBool loginLoading = false.obs;

  heandleLogin() async {
    loginLoading(true);

    Map<String, String> header = {"Content-Type": "application/json"};

    var body = {
      "email": emailController.text.trim(),
      "password": passWordControler.text,
    };

    var response = await ApiClient.postData(
        ApiConstants.login, jsonEncode(body),
        headers: header);
    if (response.statusCode == 200) {
      var responsebody = jsonDecode(response.body);
      var token = responsebody["token"];
      if(token != null){
        // Get.offAllNamed(AppRoutes.userScreen);
      }
      print("=========================$body \n $token");
    }
    loginLoading(false);
  }
}
