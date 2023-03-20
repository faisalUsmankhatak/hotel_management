import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hotel_management/widget/mybutton.dart';

import '../app_confiq/app_colors.dart';
import '../screens/bottom_navigation_bar_screen.dart';
import '../screens/home_screen/home_screen.dart';




@override
GetMyDialoge() {
  return Get.dialog(Scaffold(
    resizeToAvoidBottomInset: false,
    backgroundColor: Colors.transparent,
    body: Center(
      child: Stack(
        children: [
          GestureDetector(
            onTap:() {
              Get.back();
            },
            child: Container(

              color: Colors.transparent,
              width: Get.width,
              height: Get.height,

            ),
          ),
          Center(
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.w),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 42.w),
                    height: 373.h,
                    width: double.infinity,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color(0xffFFFFFF)),
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 10.sp,),
                          Stack(
                            children: [
                              Container(
                                height: 125.sp,
                                width: 125.sp,
                                decoration: const  BoxDecoration(

                                    image: DecorationImage(
                                        image: AssetImage("asset/icon/congratulations.png"),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),

                            ],
                          ),
                          SizedBox(height: 40.h,),
                          Text('Congratulations!',style: TextStyle(color: AppColors.greenGridientTowColor,fontSize: 16.sp), ),
                          SizedBox(height: 10.h,),
                          Text('Your Password is Successfully changed',style: TextStyle(color: Color(0xff2B3D5F),fontSize: 10.sp)),
                          SizedBox(height: 25.h,),
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 30.w),
                            child: MyButton(buttonText: 'Go To HomePage',onTap: (){
                              Get.to(BottomNavigationBarScreen());
                            },),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  ));
}

