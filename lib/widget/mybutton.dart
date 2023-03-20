import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../app_confiq/app_colors.dart';
class MyButton extends StatelessWidget {
  String buttonText;
  Color? backgroundColor;
  Color? buttonTextColor;
  double? radius;
  double? height;
  Color? borderColor;
  double? width;
  GestureTapCallback? onTap;
   MyButton({required this.buttonText,this.onTap,this.backgroundColor,this.buttonTextColor,this.radius,this.height,this.width,this.borderColor}) ;

  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
        onTap: onTap,
        child: Container(
        //  margin: EdgeInsets.symmetric(vertical: 2.h),
padding: EdgeInsets.symmetric(horizontal: width??15.w,),
          // width: Get.width*,
            height:height?? 35.h,
          decoration: BoxDecoration(
            border: Border.all(color: borderColor??AppColors.whiteColor,width: 1.sp),
            gradient: backgroundColor!=null?null:const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff00EFB6),
                Color(0xff00BD90)
              ]
            ),
            color: backgroundColor,
            borderRadius: BorderRadius.circular(radius??20.sp)
          ),
          child: Center(
            child: Text(buttonText,style: TextStyle(color: buttonTextColor??AppColors.whiteColor,fontSize: 16.sp,fontFamily: 'Roboto-Regular',)),
          ),
        ),
      );

  }
}
