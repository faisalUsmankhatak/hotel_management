import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hotel_management/app_confiq/app_colors.dart';
class AppStyles extends GetxController{
  static TextStyle textButtonStyles=TextStyle(
    color: AppColors.greenGridientTowColor,
    fontSize: 12.sp
  );

  static TextStyle appLightStyle=TextStyle(
     fontFamily: 'Roboto-Regular',
      fontSize: 16.sp
  );
  static TextStyle appHeadingStyle=TextStyle(
    fontFamily: 'Roboto-Black',
    fontSize: 22.sp,
  );
  static TextStyle appBarStyle=TextStyle(
      fontFamily: 'Roboto-Regular',
      fontSize: 22.sp
  );
  static TextStyle textButtonStyle=TextStyle(
      fontFamily: 'Roboto-Regular',
      fontSize: 13.sp,
    color: AppColors.greenGridientTowColor
  );

  static TextStyle smallHeading=TextStyle(
      fontFamily: 'Roboto-Black',
      fontSize: 13.sp,

  );

  static TextStyle smallTextStyle=TextStyle(
    fontFamily: 'Roboto-Regular',
    fontSize: 14.sp,


  );
}