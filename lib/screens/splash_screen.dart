import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../app_confiq/app_colors.dart';
import '../intro_screen/intro_screen.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    navigat();
    return SafeArea(child: Scaffold(

      body: Stack(
clipBehavior: Clip.none,
        children: [
          Container(
             width: Get.width,
            // height: Get.height,

            decoration:  BoxDecoration(
boxShadow: [
  BoxShadow(
    spreadRadius: 10.sp
  )
],
                // image: DecorationImage(
                //     image: AssetImage('asset/images/splashImage.png'),
                //     fit: BoxFit.cover
                // )
            ),
            child: Image.asset('asset/images/splashImage.png',fit: BoxFit.cover,),
          ),
          Align(
            alignment: Alignment.topCenter,

            child: Padding(
              padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 400.h),
              child: Column(
                children: [
                  Text("Welcome To", style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 30.sp,
                     )),
                  Text('SBS Booking', style: TextStyle(
                      color: AppColors.greenGridientTowColor, fontSize: 50.sp,
                      fontWeight: FontWeight.bold
                  )),
                  SizedBox(height: 22.h,),
                  Text('From Local hotels to global brands, '
                      'discover millions of rooms all around the world',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.whiteColor, fontSize: 18.sp),)
                ],
              ),
            ),
          )

        ],
      ),
    ));
  }
}
void navigat(){
  Future.delayed(Duration(seconds: 5),() {
     Get.to(()=>IntroScreen(),transition: Transition.rightToLeft,duration: Duration(microseconds: 500));
  },);
}
