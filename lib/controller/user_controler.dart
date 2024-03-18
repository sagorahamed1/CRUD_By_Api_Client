import 'dart:convert';
import 'dart:ui';

import 'package:api_getx/contstant/constants.dart';
import 'package:api_getx/services/api_client.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
    isLoadMore();
    getUnknown();
  }

  ///------------------------get user------------------------>
  RxList userList = [].obs;
  int currentPage = 1;
  RxBool isLoading = false.obs;

  Future<void> isLoadMore() async {}

  getData() async {
    isLoading(true);
    try {
      var headers = {"Content-Type": "Application/json"};

      var response = await ApiClient.getData(
          '${ApiConstants.getUser}$currentPage',
          headers: headers);
      print("-----------------------------------------$currentPage");

      if (response.statusCode == 200) {
        var responseData = response.body;

        List userData = responseData["data"];

        for (var users in userData) {
          userList.add(Users.formJson(users));
        }
      }
    } catch (e) {
      print("================= error e: $e");
    }
    isLoading(false);
  }



  ///-------------------------detelet user------------------------>
  handleDelete() async {
    var headers = {'Content-Type': 'Application/json'};

    var response = await ApiClient.deleteData("${ApiConstants.deleteUser}",
        headers: headers);

    if (response.statusCode == 204) {
      print("============user delete successed");
    }
  }


  ///------------------get unknown--------------------------->
  RxList unKnownLists = [].obs;
  RxBool unKnownLoading = false.obs;

  getUnknown()async{
    unKnownLoading(true);

    try{
      var headers = {
        'Content-Type' : 'Application/json'
      };

      var response = await ApiClient.getData(ApiConstants.unKnown,headers: headers);
      if(response.statusCode == 200){
        Map <String, dynamic> unKnownMap = response.body;
        List unKnowList = unKnownMap['data'];

         for(var element in unKnowList){
           unKnownLists.add(UnKnown.fromJson(element));
         }
      }
      unKnownLoading(false);

    }catch(e,s){
      print("========error e : $e");
      print("========error s : $s");
    }
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
        firstName: json['first_name'],
        lastName: json['last_name'],
        avatar: json['avatar']);
  }
}


class UnKnown{
  final int id;
  final String name;
  final int year;
  final String color;
  final String pantone_value;


  UnKnown({required this.id, required this.name, required this.year, required this.color, required this.pantone_value});

  factory UnKnown.fromJson(Map<String, dynamic> json){
    return UnKnown(
        id: json['id'],
        name: json["name"],
        year: json['year'],
        color: json['color'],
        pantone_value: json['pantone_value']);
  }
}
