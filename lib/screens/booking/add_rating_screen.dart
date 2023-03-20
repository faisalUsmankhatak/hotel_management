import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hotel_management/app_confiq/app_styles.dart';

import '../../app_confiq/app_colors.dart';
import '../../controller/bookings_controller.dart';
import '../../widget/form_text_field.dart';
import '../../widget/mybutton.dart';

class AddRatingScreen extends StatelessWidget {
  Map? hotel;

  AddRatingScreen({Key? key, required this.hotel}) : super(key: key);
  BookingController bookingController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            children: [
              SizedBox(
                height: 26.h,
              ),
              Row(
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
                    'Rate the Hotel',
                    style:AppStyles.appBarStyle,
                  )
                ],
              ),
              SizedBox(
                height: 22.h,
              ),
              Container(
                width: double.infinity,
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
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
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
                                  hotel!['location'],
                                  style: TextStyle(
                                      color:
                                          AppColors.blackColor.withOpacity(0.8),
                                      fontSize: 10.sp,
                                     fontFamily: 'Roboto-Regular'),
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
                                          color: AppColors.greenGridientTowColor,
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
              SizedBox(
                height: 22.h,
              ),
              Text('Please give your rating & review',style: AppStyles.smallTextStyle,),
              SizedBox(
                height: 22.h,
              ),
              RatingBar.builder(
                  initialRating: 0,
                  maxRating: 1,
                  unratedColor: Colors.grey,
                  itemCount: 5,
                  itemSize: 50,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.sp),
                  itemBuilder: (context, index) {
                    return Icon(
                      Icons.star,
                      color: AppColors.greenGridientTowColor,
                    );
                  },
                  onRatingUpdate: (ratingValue) {
                    bookingController.fullRating.value = ratingValue;
                  }),
              SizedBox(
                height: 22.h,
              ),
              Obx(() => Text('Rating ${bookingController.fullRating}',style: AppStyles.smallTextStyle,),),
              SizedBox(
                height: 22.h,
              ),
              FormTextField(
                label: 'Review',
                maxLines: 3,
              ),
              SizedBox(
                height: 22.h,
              ),
              MyButton(
                buttonText: 'Rate Now',
                height: 50.h,
              ),
              SizedBox(
                height: 22.h,
              ),
              MyButton(
                  buttonText: 'Later',
                  height: 50.h,
                  backgroundColor: AppColors.greenGridientTowColor.withOpacity(0.2),
                  buttonTextColor: AppColors.greenGridientTowColor),
            ],
          ),
        ),
      ),
    ));
  }
}
