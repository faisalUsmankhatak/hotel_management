import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hotel_management/app_confiq/app_styles.dart';
import 'package:hotel_management/widget/mybutton.dart';

import '../app_confiq/app_colors.dart';
import '../screens/booking/add_rating_screen.dart';
import '../screens/bottom_navigation_bar_screen.dart';

SuccessfullyDialog(Map? hotel) {
  return Get.dialog(Scaffold(
    resizeToAvoidBottomInset: false,
    backgroundColor: Colors.transparent,
    body: Center(
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
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
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffFFFFFF)),
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 10.sp,
                          ),
                          Stack(
                            children: [
                              Container(
                                height: 125.sp,
                                width: 125.sp,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "asset/icon/congratulations.png"),
                                        fit: BoxFit.cover)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            'Payment Successfull!',
                            style: TextStyle(
                                color: AppColors.greenGridientTowColor,
                                fontSize: 16.sp,
                                fontFamily: 'Roboto-Regular'),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30.w),
                            child: Text('Successfully Made Payment and hotel booking',
                                style: AppStyles.smallTextStyle,textAlign: TextAlign.center),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30.w),
                            child: MyButton(
                              buttonText: 'Ok',
                              onTap: () {
                                Get.to(BottomNavigationBarScreen());
                              },
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30.w),
                            child: MyButton(
                              buttonText: 'Add Rateing',
                              onTap: () {
                                Get.back();
                                Get.to(AddRatingScreen(
                                  hotel: hotel,
                                ));
                              },
                            ),
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
