import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hotel_management/app_confiq/app_styles.dart';
import 'package:hotel_management/widget/mybutton.dart';

import '../../app_confiq/app_colors.dart';
import '../../controller/bookings_controller.dart';
import '../../controller/home_controller.dart';
import 'cancel_booking_screen.dart';

class BookingScreen extends StatelessWidget {
  BookingScreen({Key? key}) : super(key: key);
  BookingController bookingController = Get.put(BookingController());
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Obx(
        () => Column(
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
                    'Booking',
                    style: AppStyles.appBarStyle,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 21.h,
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 45.w, right: 70.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            bookingController.bookingButton.value = 0;
                          },
                          child: Text('Active',
                              style: AppStyles.smallHeading)),
                      InkWell(
                          onTap: () {
                            bookingController.bookingButton.value = 1;
                          },
                          child: Text('Past',
                              style: AppStyles.smallHeading)),
                      InkWell(
                          onTap: () {
                            bookingController.bookingButton.value = 2;
                          },
                          child: Text('Cancle',
                              style: AppStyles.smallHeading))
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.sp,
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 1.sp,
                      color: AppColors.blackColor.withOpacity(0.4),
                    ),
                    Positioned(
                      bottom: 1.sp,
                      child: Padding(
                        padding: EdgeInsets.only(left: 27.w),
                        child: Container(
                          width: 80.w,
                          height: 2.sp,
                          color: bookingController.bookingButton.value == 0
                              ? AppColors.greenGridientTowColor
                              : Colors.transparent,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 1.sp,
                      left: 125.sp,
                      child: Container(
                        width: 80.w,
                        height: 2.sp,
                        color: bookingController.bookingButton.value == 1
                            ? AppColors.greenGridientTowColor
                            : Colors.transparent,
                      ),
                    ),
                    Positioned(
                      bottom: 1.sp,
                      left: 210.sp,
                      child: Padding(
                        padding: EdgeInsets.only(left: 22.w),
                        child: Container(
                          width: 80.w,
                          height: 2.sp,
                          color: bookingController.bookingButton.value == 2
                              ? AppColors.greenGridientTowColor
                              : Colors.transparent,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 34.h,
            ),
            Expanded(
                child: ListView.separated(
              itemCount: homeController.allHotel.length,
              itemBuilder: (context, index) {
                return bookingListing(homeController.allHotel[index]);
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 5.h,
                );
              },
            ))
          ],
        ),
      ),
    ));
  }

  Widget bookingListing(Map map) {
    return Card(
      child: Container(
        padding:
            EdgeInsets.only(left: 20.w, right: 25.w, top: 10.h, bottom: 10.h),
        width: double.infinity,
        child: Column(
          children: [
            Row(
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
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(top: 5.sp),
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
                                  color: AppColors.blackColor.withOpacity(0.8),
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 7.h,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 3.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                            color: bookingController.bookingButton.value == 2
                                ? Colors.red.withOpacity(0.3)
                                : AppColors.greenGridientTowColor
                                    .withOpacity(0.3)),
                        child: Text(
                            bookingController.bookingButton.value == 0
                                ? 'Paid'
                                : bookingController.bookingButton.value == 1
                                    ? 'Completed'
                                    : 'Canceled & Refunded',
                            style: TextStyle(
                              fontFamily: 'Roboto-Regular',
                                fontSize: 10.sp,
                                color: AppColors.greenGridientTowColor)),
                      )

                      // Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Row(
                      //       children: [
                      //         RatingBarIndicator(
                      //           rating: 1,
                      //           itemBuilder: (context, index) => Icon(
                      //             Icons.star,
                      //             color: Color(0xffFFB02E),
                      //           ),
                      //           itemCount: 1,
                      //           itemSize: 15.0,
                      //           direction: Axis.horizontal,
                      //         ),
                      //         SizedBox(width: 3.w,),
                      //         Text('4.4',style: TextStyle(fontSize: 15.sp,color: AppColors.greenGridientTowColor,fontWeight: FontWeight.bold)),
                      //       ],
                      //     ),
                      //
                      //     Icon(Icons.favorite,color: AppColors.greenGridientTowColor,size: 15.sp,)
                      //
                      //
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 18.h,
            ),
            Container(
              height: 1.sp,
              color: AppColors.blackColor.withOpacity(0.3),
            ),
            SizedBox(
              height: 18.h,
            ),
            bookingController.bookingButton.value == 0
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyButton(
                        buttonText: 'Cancel Booking',
                        backgroundColor: AppColors.whiteColor,
                        borderColor: AppColors.greenGridientTowColor,
                        buttonTextColor: AppColors.greenGridientTowColor,
                        onTap: (){
                          bottomSheet();
                        },
                      ),
                      MyButton(
                        buttonText: 'View Ticket',
                      )
                    ],
                  )
                : bookingController.bookingButton.value == 1
                    ? Container(
                        height: 30.h,
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                            color: AppColors.greenGridientTowColor
                                .withOpacity(0.3)),
                        child: Row(
                          children: [
                            Container(
                              width: 20.w,
                              height: 20.h,
                              decoration: BoxDecoration(
                                  color: AppColors.greenGridientTowColor,
                                  borderRadius: BorderRadius.circular(10.sp)),
                              child: Center(
                                child: Icon(Icons.done,
                                    color: AppColors.whiteColor, size: 12.sp),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              'Yeay, you have completed',
                              style: TextStyle(
                                  color: AppColors.greenGridientTowColor),
                            )
                          ],
                        ),
                      )
                    : Container(
                        height: 30.h,
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                            color: Colors.red.withOpacity(0.2)),
                        child: Row(
                          children: [
                            Container(
                              width: 20.w,
                              height: 20.h,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10.sp)),
                              child: Center(
                                child: Icon(Icons.done,
                                    color: AppColors.whiteColor, size: 12.sp),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              'You canceled this hotel booking',
                              style: TextStyle(color: Colors.red),
                            )
                          ],
                        ),
                      ),
          ],
        ),
      ),
    );
  }

  bottomSheet() {
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
              height: 20.h,
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
            Text('Cancel Booking',style: TextStyle(color: Colors.red,fontSize: 18.sp,fontWeight: FontWeight.bold),),
          SizedBox(height: 20.h,),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Container(
                height: 0.5.sp,
                decoration:
                BoxDecoration(color: AppColors.blackColor.withOpacity(0.5)),
              ),
            ),
            SizedBox(height: 20.h,),
            Container(
              width: Get.width,

              margin: EdgeInsets.symmetric(horizontal: 35.w),
            child: Text('Are you sure you want to cancel your hotel booking?',style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center),
            ),
            SizedBox(height: 20.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text('Only 80% of the money you can refund from your payment according of our policy',textAlign: TextAlign.center),
            ),
            SizedBox(height: 20.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(width: 10.w,),
                Expanded(
                  child: MyButton(
                      buttonText: "Cancel",

                      buttonTextColor: AppColors.greenGridientTowColor,
                      backgroundColor:
                      AppColors.greenGridientTowColor.withOpacity(0.1),
                      onTap: (){
                        Get.back();
                      },
                      ),
                ),
                SizedBox(width: 5.w,),
                Expanded(
                  child: MyButton(
                      buttonText: "Yes,Continue",
                      backgroundColor: AppColors.greenGridientTowColor,
                      buttonTextColor: AppColors.whiteColor,

                      onTap: () {
                        Get.to(CancelBookingScreen());
                      }),
                ),
                SizedBox(width: 10.w,),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
