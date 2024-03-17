import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/dimentions.dart';

class Themes {
  final lightTheme = ThemeData.light().copyWith(
    ///-------------------------elevated button theme------------------------->
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(20),
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.maxFinite, 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),

      ///-----------------app bar theme------------------>
      appBarTheme: const AppBarTheme(
          color: Colors.white,
          // backgroundColor: Colors.white10,
          centerTitle: true,
          elevation: 5,
          shadowColor: Colors.green),


    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(),


      disabledBorder: OutlineInputBorder(),


      enabledBorder: OutlineInputBorder(),
    )
  );


  ///----------------------------dart theme------------------------------->
  final darkTheme = ThemeData.dark().copyWith(

      ///-------------------------elevated button theme------------------------->
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.backgroundColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(20),
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.maxFinite, 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),


      ///-----------------app bar theme------------------>
      appBarTheme: const AppBarTheme(
          centerTitle: false,
          color: Colors.transparent,
          elevation: 0,
          shadowColor: Colors.white10),

      ///--------------------text filed themes----------------------->
      inputDecorationTheme: InputDecorationTheme(
          contentPadding:
               EdgeInsets.symmetric(vertical: 14.h, horizontal: 10.h),
          filled: true,
          fillColor: AppColors.fieldColor,
          hintStyle: TextStyle(
              fontSize: 16.h, fontWeight: FontWeight.w400, color: Colors.white),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
              borderSide: BorderSide(color: AppColors.borderColor, width: 1)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
              borderSide: BorderSide(color: AppColors.borderColor, width: 1))));
}
