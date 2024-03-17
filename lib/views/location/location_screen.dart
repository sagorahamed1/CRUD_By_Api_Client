import 'package:api_getx/contstant/constants.dart';
import 'package:api_getx/views/widgets/custom_text.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown_search/flutter_dropdown_search.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:textfield_search/textfield_search.dart';


class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final TextEditingController searchController = TextEditingController();
  final searchcontroller = TextEditingController();
  //
  // List <String> locations = [];
  // List emptyList = [];
  //
  // void getLocation(String query) async {
  //   try{
  //
  //     const apiKey = "AIzaSyAJrp3VvbO4E4jo7HRgqsk7EP8mPIZStxQ";
  //     final uri = Uri.https(
  //       "maps.googleapis.com",
  //       "/maps/api/place/autocomplete/json",
  //       {
  //         "input": query,
  //         "key": apiKey,
  //       },
  //     );
  //
  //     final response = await http.get(uri);
  //
  //     print("==========status code ${response.statusCode} \n body============= ${response.body}");
  //     if (response.statusCode == 200) {
  //       final Map data = jsonDecode(response.body);
  //       var predictions = data["predictions"];
  //       print("predictions ===========> $predictions");
  //       if(data["predictions"] == null){
  //         emptyList.add(predictions);
  //       }else{
  //         setState(() {
  //           locations.add(data["predictions"][0]["description"]);
  //         });
  //       }
  //
  //
  //
  //     } else {
  //       throw Exception('Failed to load places');
  //     }
  //   }catch(e,s){
  //     print("============================== e error $e");
  //     print("============================== s error $s");
  //   }
  // }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration.zero, () {
      // getLocation(searchController.text);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
        child: Column(
          children: [

            //
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
            //   child: Column(
            //     children: [
            //       //
            //       FlutterDropdownSearch(
            //         textController: searchController,
            //         items: locations,
            //         dropdownHeight: 150,
            //       ),
            //
            //
            //       // TextField(
            //       //   controller: searchController,
            //       //   onChanged: (value) {
            //       //     setState(() {
            //       //       placeAutoComplete(searchController.text);
            //       //     });
            //       //   },
            //       // ),
            //
            //     ],
            //   ),
            // ),





            Expanded(
                child: TextFieldSearch(
                    label: '',
                    itemsInView: 5,
                    controller: searchcontroller,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 8.h),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                        isDense: true,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0),
                        )),
                    future: () {

                      return GoogleApiService.fetchSuggestions(searchcontroller.text);

                    }
                )
            ),

            ///-------------------------------search botton------------------>

            Container(
              height: 40.h,
              width: 45.w,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color:Colors.white),
              child: Center(
                  child: CustomText(
                    text: "search",
                    color: Colors.white,
                    fontsize: 8.h,
                  )),
            )



            // ElevatedButton(onPressed: (){}, child: Text("Country List"))


          ],
        ),
      ),
    );
  }

}




class GoogleApiService{


  static  Future<List<String>> fetchSuggestions(String input)async{
    final response = await http.get(Uri.parse('${ApiConstants.googleBaseUrl}?input=$input&key=${ApiConstants.googleApiKey}'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final predictions = jsonData['predictions'] as List<dynamic>;

      var  _suggestions = predictions.map((prediction) => prediction['description'].toString()).toList();


      print("=============================${_suggestions}");

      return _suggestions;
    } else {
      throw Exception('Failed to load suggestions');
    }
  }




}

