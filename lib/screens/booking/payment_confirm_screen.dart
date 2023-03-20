import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hotel_management/app_confiq/app_styles.dart';
import 'package:intl/intl.dart';

import '../../app_confiq/app_colors.dart';
import '../../controller/bookings_controller.dart';
import '../../controller/home_controller.dart';
import '../../widget/mybutton.dart';
import '../../widget/successfull_dialog.dart';

class PaymentConfirmScreen extends StatelessWidget {
  Map? hotel;
  BookingController bookingController = Get.find();

  PaymentConfirmScreen({required this.hotel});

  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
          height: 70.h,
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
          child: MyButton(
            buttonText: 'Confirm Payment',
            onTap: () {
              SuccessfullyDialog(hotel);
              // dialogBox();
              // Get.to(PaymentScreen(hotel: widget.hotel,));
            },
          )),
      body: Column(
        children: [
          SizedBox(
            height: 26.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    width: 24.w,
                    height: 24.h,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('asset/icon/back.png'))),
                  ),
                ),
                SizedBox(
                  width: 20.h,
                ),
                Text(
                  'Payment',
                  style: AppStyles.appBarStyle,
                )
              ],
            ),
          ),
          SizedBox(
            height: 22.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.sp)),
              child: Container(
                width: double.infinity,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10.sp)),
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.sp),
                      child: Image.asset(hotel!['image'][0], scale: 7.sp),
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
                                    hotel!['hotel_name'],
                                    style: AppStyles.smallHeading,
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
                                  hotel!['location'],
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
          ),
          SizedBox(
            height: 22.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.sp)),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10.sp)),
                height: 130.h,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(('Check In'), style: AppStyles.smallTextStyle),
                        Text(
                            DateFormat(
                              'MMM d-yyyy',
                            ).format(bookingController.start),
                            style: AppStyles.smallTextStyle),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(('Check Out'), style: AppStyles.smallTextStyle),
                        Text(
                            DateFormat('MMM d-yyyy')
                                .format(bookingController.end),
                            style: AppStyles.smallTextStyle),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(('Adults'), style: AppStyles.smallTextStyle),
                        Text(bookingController.adults.value.toString()),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(('Children'), style: AppStyles.smallTextStyle),
                        Text(bookingController.totalChildren.value.length
                            .toString()),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 22.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.sp)),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10.sp)),
                height: 130.h,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            '${bookingController.myDateRange!.end.difference(bookingController.myDateRange!.start).inDays} night '),
                        Text(
                            (((int.parse(hotel!['room'][0]['rent'])) *
                                        (int.parse(hotel!['room'][0]
                                            ['booking_total_rooms']))) *
                                    bookingController.myDateRange!.end
                                        .difference(bookingController
                                            .myDateRange!.start)
                                        .inDays)
                                .toString(),
                            style: AppStyles.smallTextStyle)
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(('Taxes & Fees (10%)'),style: AppStyles.smallTextStyle),
                        Text('1000',style: AppStyles.smallTextStyle),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      height: 1.sp,
                      color: AppColors.blackColor.withOpacity(0.3),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(('Total'),style: AppStyles.smallTextStyle),
                        Text(((((int.parse(hotel!['room'][0]['rent'])) *
                                        (int.parse(hotel!['room'][0]
                                            ['booking_total_rooms']))) *
                                    bookingController.myDateRange!.end
                                        .difference(bookingController
                                            .myDateRange!.start)
                                        .inDays) +
                                1000)
                            .toString(),style: AppStyles.smallTextStyle)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
