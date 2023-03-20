import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../app_confiq/app_colors.dart';
import '../../controller/home_controller.dart';
import '../hotel_details/checkin_checkout.dart';

class RoomDetailsScreen extends StatefulWidget {
  Map? hotel;

  RoomDetailsScreen({required this.hotel});

  @override
  State<RoomDetailsScreen> createState() => _RoomDetailsScreenState();
}

class _RoomDetailsScreenState extends State<RoomDetailsScreen> {
  HomeController homeController = Get.find();

  final PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Column(
              children: [
                Container(
                  height: 190.h,
                  width: Get.width,
                  child: Stack(
                    children: [
                      PageView.builder(
                        controller: controller,
                        itemCount: widget.hotel!['room'][0]['images'].length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            width: Get.width,
                            height: 190.h,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(widget.hotel!['room'][0]
                                        ['images'][index]))),
                          );
                        },
                        onPageChanged: (value) {
                          homeController.roomImageIndex.value = value;
                        },
                      ),
                      Positioned(
                          bottom: 10,
                          right: 10,
                          child: Container(
                            width: 35.w,
                            height: 30.h,
                            decoration:
                                BoxDecoration(color: AppColors.blackColor),
                            child: Center(
                              child: Text(
                                  '${homeController.roomImageIndex.value + 1}/${widget.hotel!['room'][0]['images'].length} ',
                                  style:
                                      TextStyle(color: AppColors.whiteColor)),
                            ),
                          )),
                      Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            homeController.roomImageIndex.value == 0
                                ? SizedBox()
                                : InkWell(
                                    onTap: () {
                                      controller.previousPage(
                                          duration: Duration(seconds: 1),
                                          curve: Curves.bounceInOut);
                                    },
                                    child: Container(
                                      width: 35.w,
                                      height: 35.h,
                                      decoration: BoxDecoration(
                                          color: AppColors.blackColor
                                              .withOpacity(0.5)),
                                      child: const Center(
                                          child: Icon(
                                        Icons.arrow_back_ios,
                                        color: AppColors.whiteColor,
                                      )),
                                    ),
                                  ),
                            widget.hotel!['room'][0]['images'].length ==
                                    homeController.roomImageIndex.value + 1
                                ? SizedBox()
                                : InkWell(
                                    onTap: () {
                                      controller.nextPage(
                                          duration: Duration(seconds: 1),
                                          curve: Curves.bounceInOut);
                                    },
                                    child: Container(
                                      width: 35.w,
                                      height: 35.h,
                                      decoration: BoxDecoration(
                                          color: AppColors.blackColor
                                              .withOpacity(0.5)),
                                      child: const Center(
                                          child: Icon(
                                        Icons.arrow_forward_ios,
                                        color: AppColors.whiteColor,
                                      )),
                                    ),
                                  )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(widget.hotel!['hotel_name'],
                    style: TextStyle(
                        // color: AppColors.blackColor.withOpacity(0.8),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700)),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Container(
                      width: 20.w,
                      height: 20.h,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'asset/icon/adults.png',
                              ))),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text('Price for 2 adults'),
                  ]),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Container(
                      width: 17.w,
                      height: 17.h,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'asset/icon/breakfast.png',
                              ))),
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Text('BreakFast include in the Price'),
                  ]),
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
                RichText(
                  text: TextSpan(
                    text: 'Price for 1 night\n\n',
                    style:
                        TextStyle(fontSize: 12.sp, color: AppColors.blackColor),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'PKR ${widget.hotel!['room'][0]['rent']}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.sp)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text('+PKR 5,008 taxes and chargs'),
                // Text('Price for 1 night\nPKR ${widget.hotel!['room'][0]['rent']}'),
                SizedBox(
                  height: 18.h,
                ),
                Container(
                  height: 1.sp,
                  color: AppColors.blackColor.withOpacity(0.2),
                ),
                SizedBox(
                  height: 18.h,
                ),
                widget.hotel!['room'][0]['isSelect'] == true
                    ? InkWell(
                        onTap: () {
                          setState(() {
                            widget.hotel!['room'][0]['isSelect'] = false;
                            widget.hotel!['room'][0]['booking_total_rooms'] =
                                '1';
                          });
                        },
                        child: Container(
                          height: 40.h,
                          margin: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Center(
                            child: Text('Select',
                                style: TextStyle(
                                    color: AppColors.greenGridientTowColor)),
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColors.greenGridientTowColor,
                                  width: 1.sp)),
                        ),
                      )
                    : SizedBox(
                        height: 40.h,
                        child: InputDecorator(
                          expands: false,
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 5.sp),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.greenGridientTowColor,
                                    width: 1.sp),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.greenGridientTowColor,
                                    width: 1.sp),
                              ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.greenGridientTowColor,
                                      width: 1.sp))),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                                isExpanded: true,
                                borderRadius: BorderRadius.circular(5.sp),
                                value: widget.hotel!['room'][0]['selectvalue'],
                                items: widget.hotel!['room'][0]['total_rooms']
                                    .map<DropdownMenuItem<String>>((e) =>
                                        DropdownMenuItem<String>(
                                          child: Text(e,
                                              style: TextStyle(
                                                  color: e == 'remove'
                                                      ? Colors.red
                                                      : AppColors.blackColor)),
                                          value: e,
                                        ))
                                    .toList(),
                                onChanged: (value) {
                                  if (value.toString() == 'remove') {
                                    widget.hotel!['room'][0]
                                        ['booking_total_rooms'] = '0';
                                    widget.hotel!['room'][0]['selectvalue'] =
                                        'Room 1';

                                    widget.hotel!['room'][0]['isSelect'] = true;
                                  } else {
                                    widget.hotel!['room'][0]['selectvalue'] =
                                        value.toString();
                                    print(widget.hotel!['room'][0]
                                        ['selectvalue']);
                                    // widget.hotel!['room'][0]['booking_total_rooms']=
                                    widget.hotel!['room'][0]
                                            ['booking_total_rooms'] =
                                        value.toString().split(' ')[1];
                                    // (int.parse(widget
                                    //     .hotel!['room'][0]['booking_total_rooms']
                                    //     .toString()) + int.parse(value.toString()
                                    //     .split(' ')[1])).toString();
                                  }
                                  setState(() {});
                                }),
                          ),
                        ),
                      ),

              ],
            )),
            Container(
              height: 60.h,
              // color: Colors.yellow,
              child: Card(
                margin: EdgeInsets.zero,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  height: 50.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          widget.hotel!['room'][0]['isSelect']
                              ? SizedBox()
                              : Row(children: [
                                  //Text(((int.parse(widget.hotel!['room'][0]['rent'])).toString())),
//Text(widget.hotel!['room'][0]['booking_total_rooms']),
                                  Text((((int.parse(widget.hotel!['room'][0]
                                              ['rent'])) *
                                          (int.parse(widget.hotel!['room'][0]
                                              ['booking_total_rooms']))))
                                      .toString()
                                      .split('.')[0]),
                                  Text(
                                      ' . ${widget.hotel!['room'][0]['booking_total_rooms']} rooms')
                                ])
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(CheckInCheckOutScreen(
                            hotel: widget.hotel,
                          ));
                          // dialogBox();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          height: 30.h,
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                          ),
                          child: Center(
                            child: Text('Reserve',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
