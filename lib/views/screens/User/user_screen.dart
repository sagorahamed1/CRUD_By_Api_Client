import 'package:api_getx/controller/user_controler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UserScreen extends StatelessWidget {
  final UserController userController = Get.put(UserController());
  final ScrollController scrollController = ScrollController();

  UserScreen() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        userController.isLoadMore();
        print("=========================is load more");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ///-------------------------------user list--------------------------->
            Expanded(
              // height: 400,
              child: Obx(
                () => ListView.builder(
                  controller: scrollController,
                  itemCount: userController.userList.length,
                  itemBuilder: (context, index) {
                    var users = userController.userList[index];
                    return GestureDetector(
                      onTap: () {
                        userController.handleDelete();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: SizedBox(
                          height: 80.h,
                          child: Card(
                            elevation: 5,
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                    NetworkImage("${users.avatar}"),
                              ),
                              title: Row(
                                children: [
                                  Text("${users.firstName} "),
                                  Text("${users.lastName}"),
                                ],
                              ),
                              subtitle: Text("${users.email}"),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            SizedBox(
              height: 20.h,
            ),

            ///--------------------------unknown list-------------------->
            Obx(
              () => Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: Colors.green,

                  ),
                  child: ListView.builder(
                    itemCount: userController.unKnownLists.length,
                    itemBuilder: (context, index) {
                      var unknow = userController.unKnownLists[index];
                      String ColorCode = unknow.color;

                      return Card(
                          // color: Color(0xff),
                          elevation: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${unknow.name}",
                                  style: TextStyle(color: Colors.red),
                                ),

                                Text(
                                  "${unknow.year.toString()}",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ],
                            ),

                          ));
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
