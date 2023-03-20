import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hotel_management/app_confiq/app_styles.dart';

import '../../app_confiq/app_colors.dart';
import '../../controller/home_controller.dart';
import '../../widget/mybutton.dart';

class SaveBookingScreen extends StatelessWidget {
  SaveBookingScreen({Key? key}) : super(key: key);
  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 26.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // InkWell(
                //   onTap: () {
                //     Get.back();
                //   },
                //   child: Container(
                //     width: 24.w,
                //     height: 24.h,
                //     decoration: const BoxDecoration(
                //         image: DecorationImage(
                //             image: AssetImage('asset/icon/back.png'))),
                //   ),
                // ),
                // SizedBox(
                //   width: 20.h,
                // ),
                Text(
                  'My Bookmarks',
                  style:AppStyles.appBarStyle,
                )
              ],
            ),
          ),
          SizedBox(
            height: 22.h,
          ),
          Expanded(
            child: GridView.builder(
                itemCount: homeController.allHotel.length,
                padding: EdgeInsets.symmetric(horizontal: 21.w),
                clipBehavior: Clip.none,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15.sp,
                    childAspectRatio: 0.67,
                    mainAxisSpacing: 10.sp),
                itemBuilder: (context, index) {
                  return bookMarksListing(homeController.allHotel[index]);
                }),
          )
        ],
      ),
    ));
  }

  Widget bookMarksListing(Map map) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 120.h,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.sp),
            child: Image.asset(map['image'][0], fit: BoxFit.cover),
          ),
        ),
        SizedBox(
          height: 12.h,
        ),
        Text(
          map['hotel_name'],textAlign: TextAlign.center,
          style: AppStyles.smallHeading,
        ),
        SizedBox(
          height: 12.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            RatingBarIndicator(
              rating: 1,
              itemBuilder: (context, index) => Icon(
                Icons.star,
                color: Color(0xffFFB02E),
              ),
              itemCount: 1,
              itemSize: 15.0,
              direction: Axis.horizontal,
            ),
            SizedBox(
              width: 3.w,
            ),
            Text('4.4',
                style: TextStyle(
                    fontSize: 10.sp,
                    color: AppColors.greenGridientTowColor,
                    fontFamily: 'Roboto-Black')),
            SizedBox(
              width: 5.w,
            ),
            Text(
              map['location'],
              style: TextStyle(fontSize: 8.sp, overflow: TextOverflow.ellipsis,fontFamily: 'Roboto-Regular'),
            )
          ],
        ),
        SizedBox(
          height: 12.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  '9999',
                  style: TextStyle(
                      color: AppColors.greenGridientTowColor, fontSize: 12.sp),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.sp),
                  child: Text('PKR',
                      style: TextStyle(
                          fontSize: 8.sp,
                          color: AppColors.greenGridientTowColor)),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.sp),
                  child: Text(
                    '/per night',
                    style: TextStyle(fontSize: 8.sp),
                  ),
                ),
              ],
            ),

            InkWell(
                onTap: () {
                  bottomSheet(map);
                },
                child: Icon(
                  Icons.favorite,
                  color: AppColors.greenGridientTowColor,
                  size: 16.sp,
                )),
            // SizedBox(
            //   width: 5.w,
            // ),
          ],
        ),
      ],
    );
  }

  bottomSheet(Map map) {
    Get.bottomSheet(Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.sp), topRight: Radius.circular(15.sp)),
      ),
      child: Container(
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(15.sp),
                topLeft: Radius.circular(15.sp))),
        height: 290.h,
        child: Column(
          children: [
            SizedBox(
              height: 15.h,
            ),
            Container(
              width: 50.w,
              height: 3.sp,
              decoration:
                  BoxDecoration(color: AppColors.blackColor.withOpacity(0.5)),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Want to remove From Bookmarks?',
              style: AppStyles.appHeadingStyle,
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Container(
                height: 0.5.sp,
                decoration:
                    BoxDecoration(color: AppColors.blackColor.withOpacity(0.5)),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 25.w),
              child: Container(
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.sp),
                      child: Image.asset(map['image'][0], scale: 7.sp),
                    ),
                    SizedBox(
                      width: 10.sp,
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  padding: EdgeInsets.only(top: 3.h),
                                  width: 90.w,
                                  child: Text(
                                    map['hotel_name'],
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  )),
                              Row(
                                children: [
                                  Container(
                                    width: 60.w,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(top: 5.sp),
                                              child: Text('PKR',
                                                  style: TextStyle(
                                                      fontSize: 8.sp,
                                                      color: AppColors
                                                          .greenGridientTowColor)),
                                            ),
                                            Text(
                                              '9999',
                                              style: TextStyle(
                                                  color: AppColors
                                                      .greenGridientTowColor,
                                                  fontSize: 14.sp),
                                            )
                                          ],
                                        ),
                                        Text(
                                          '/per night',
                                          style: TextStyle(fontSize: 8.sp),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 7.h,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: 10.h,
                              ),
                              Container(
                                width: 80.w,
                                child: Text(
                                  map['location'],
                                  style: TextStyle(
                                      color:
                                          AppColors.blackColor.withOpacity(0.8),
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 7.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  RatingBarIndicator(
                                    rating: 1,
                                    itemBuilder: (context, index) => Icon(
                                      Icons.star,
                                      color: Color(0xffFFB02E),
                                    ),
                                    itemCount: 1,
                                    itemSize: 15.0,
                                    direction: Axis.horizontal,
                                  ),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Text('4.4',
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          color:
                                              AppColors.greenGridientTowColor,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              Icon(
                                Icons.favorite,
                                color: AppColors.greenGridientTowColor,
                                size: 15.sp,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: MyButton(
                      buttonText: "Cancel",
                      buttonTextColor: AppColors.greenGridientTowColor,
                      backgroundColor:
                          AppColors.greenGridientTowColor.withOpacity(0.3),
                      onTap: (){
                        Get.back();
                      },
                      width: 30),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: MyButton(
                      buttonText: "Remove",
                      backgroundColor: AppColors.greenGridientTowColor,
                      buttonTextColor: AppColors.whiteColor,
                      width: 30,
                      onTap: () {}),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
