import 'package:api_getx/controller/user_controler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserScreen extends StatelessWidget {
  UserScreen({super.key});

  final userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: 800,
          child: Obx(() => ListView.builder(
                itemCount: userController.userList.length,
                itemBuilder: (context, index) {
                  var users = userController.userList[index];
                  return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage("${users["avatar"]}"),
                        ),
                        title: Row(
                          children: [
                            Text("${users["first_name"]} "),
                            Text("${users["last_name"]}"),
                          ],
                        ),


                        subtitle: Text("${users['email']}"),
                      )
                  );
                },
              )),
        ),
      ),
    );
  }
}
