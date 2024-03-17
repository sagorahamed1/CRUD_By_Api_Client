import 'dart:convert';

import 'package:api_getx/contstant/constants.dart';
import 'package:api_getx/services/api_client.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
  }

  RxList userList = [].obs;
  RxBool isLoading = false.obs;

  getData() async {
    isLoading(true);
    try {
      var headers = {"Content-Type": "Application/json"};

      var response =
          await ApiClient.getData(ApiConstants.getUser, headers: headers);

      if (response.statusCode == 200) {

        var responseData = response.body;

        List userData = responseData["data"];

        userList.addAll(List.from(userData));

        // for (var users in userData) {
        //   Users user = Users.formJson(users);
        //   userList.add(user);
        // }

       
      }
    } catch (e) {
      print("================= error e: $e");
    }
    isLoading(false);
  }
}




class Users {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  Users(
      {required this.id,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.avatar});

  factory Users.formJson(Map<String, dynamic> json) {
    return Users(
        id: json["id"],
        email: json['email'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        avatar: json['avatar']);
  }
}
