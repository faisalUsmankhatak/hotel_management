import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hotel_management/app_confiq/app_styles.dart';
import 'package:intl/intl.dart';

import '../../app_confiq/app_colors.dart';
import '../../controller/bookings_controller.dart';
import '../../widget/mybutton.dart';
import '../auth_screen/login_screen.dart';
import '../booking/payment.dart';
import '../home_screen/order_as_guest_screen.dart';

class CheckInCheckOutScreen extends StatefulWidget {
  Map? hotel;

  CheckInCheckOutScreen({required this.hotel});

  @override
  State<CheckInCheckOutScreen> createState() => _CheckInCheckOutScreenState();
}

class _CheckInCheckOutScreenState extends State<CheckInCheckOutScreen> {
  BookingController bookingController = Get.put(BookingController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bookingController.start = bookingController.myDateRange!.start;
    bookingController.end = bookingController.myDateRange!.end;
    print(
        'defrence ${bookingController.myDateRange!.end.difference(bookingController.myDateRange!.start).inDays}');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
          height: 70.h,
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
          child: MyButton(
            buttonText: 'Continue',
            onTap: () {
              // dialogBox();
              Get.to(PaymentScreen(
                hotel: widget.hotel,
              ));
            },
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                  'CheckIn CheckOut',
                  style: AppStyles.appBarStyle,
                )
              ],
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Container(
              height: 1.h,
              color: AppColors.blackColor.withOpacity(0.2),
            ),
          ),
          SizedBox(
            height: 14.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Text('Per Night ${widget.hotel!['room'][0]['rent']}',style: AppStyles.smallTextStyle, ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text((((int.parse(widget.hotel!['room'][0]['rent'])) *
                            (int.parse(widget.hotel!['room'][0]
                                ['booking_total_rooms']))))
                        .toString()
                        .split('.')[0],style: AppStyles.smallTextStyle,),
                    Text(
                        ' . ${widget.hotel!['room'][0]['booking_total_rooms']} rooms',style: AppStyles.smallTextStyle,)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                        'Price for ${bookingController.myDateRange!.end.difference(bookingController.myDateRange!.start).inDays} night =',style: AppStyles.smallTextStyle,),
                    Text((((int.parse(widget.hotel!['room'][0]['rent'])) *
                                (int.parse(widget.hotel!['room'][0]
                                    ['booking_total_rooms']))) *
                            bookingController.myDateRange!.end
                                .difference(
                                    bookingController.myDateRange!.start)
                                .inDays)
                        .toString(),style: AppStyles.smallTextStyle,)
                    //  Text('PKR '),Text((int.parse(myDateRange!.end.difference( myDateRange!.start).inDays.toString())*(int.parse(widget.hotel!['rent']))).toString())
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          horizantalDivider(),
          SizedBox(
            height: 18.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () async {
                    datePicker();
                  },
                  child: Column(
                    children: [
                      Text("Check-in",
                          style: AppStyles.appHeadingStyle),
                      SizedBox(
                        height: 12.h,
                      ),
                      Container(
                          width: 130.w,
                          padding: EdgeInsets.symmetric(
                              horizontal: 7.sp, vertical: 8.h),
                          decoration: BoxDecoration(
                              color: AppColors.blackColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10.sp)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(DateFormat('MMM d')
                                  .format(bookingController.start)),
                              Icon(Icons.calendar_month)
                            ],
                          ))
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    datePicker();
                  },
                  child: Column(
                    children: [
                      Text("Check-out",
                          style: AppStyles.appHeadingStyle),
                      SizedBox(
                        height: 12.h,
                      ),
                      Container(
                        width: 130.w,
                        padding: EdgeInsets.symmetric(
                            horizontal: 7.sp, vertical: 8.h),
                        decoration: BoxDecoration(
                            color: AppColors.blackColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10.sp)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(DateFormat('MMM d')
                                .format(bookingController.end)),
                            Icon(Icons.calendar_month)
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 18.h,
          ),
          horizantalDivider(),
          SizedBox(
            height: 18.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Text('Adults',
                style: AppStyles.appHeadingStyle),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            height: 70.h,
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.sp),
                border:
                    Border.all(color: AppColors.blackColor.withOpacity(0.4))),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      if (bookingController.adults.value >= 1) {
                        bookingController.adults.value--;
                        setState(() {});
                      }
                    },
                    child: Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          color:
                              AppColors.greenGridientTowColor.withOpacity(0.2)),
                      child: Center(
                        child: Icon(Icons.remove),
                      ),
                    ),
                  ),
                  Text(bookingController.adults.value.toString()),
                  InkWell(
                    onTap: () {
                      if (bookingController.adults.value <= 29) {
                        bookingController.adults.value++;
                        setState(() {});
                      }
                    },
                    child: Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          color:
                              AppColors.greenGridientTowColor.withOpacity(0.2)),
                      child: Center(
                        child: Icon(Icons.add),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 18.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Text('Children',
                style: AppStyles.appHeadingStyle),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            height: 70.h,
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.sp),
                border:
                    Border.all(color: AppColors.blackColor.withOpacity(0.4))),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      bookingController.totalChildren.removeLast();
                      setState(() {});
                    },
                    child: Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          color:
                              AppColors.greenGridientTowColor.withOpacity(0.2)),
                      child: Center(
                        child: Icon(Icons.remove),
                      ),
                    ),
                  ),
                  Text(bookingController.totalChildren.value.length.toString()),
                  InkWell(
                    onTap: () {
                      addChildren();
                    },
                    child: Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          color:
                              AppColors.greenGridientTowColor.withOpacity(0.2)),
                      child: Center(
                        child: Icon(Icons.add),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 18.h,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: bookingController.totalChildren.length,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Child ${index + 1}'),
                      InkWell(
                          onTap: () {},
                          child: InkWell(
                              onTap: () {
                                alertDailog(index);
                              },
                              child: Text(
                                '${bookingController.totalChildren[index]} years old',
                                style: TextStyle(
                                    color: AppColors.greenGridientTowColor),
                              )))
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 10.h,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    ));
  }

  addChildren() {
    Get.defaultDialog(
        title: "Age of child",
        titlePadding: EdgeInsets.symmetric(vertical: 10.h),
        content: Container(
          width: double.infinity,
          height: 120.h,
          child: Obx(
            () => Column(
              children: [
                SizedBox(
                  height: 17.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: InputDecorator(
                    decoration: InputDecoration(

                      contentPadding: EdgeInsets.symmetric(horizontal: 5.w),
                        border: OutlineInputBorder(
                      borderRadius:
                           BorderRadius.all(Radius.circular(10.sp)),

                    )),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        isExpanded: true,
                        value: bookingController.selectChildrenYears.value,
                        items: bookingController.totalYears
                            .map((e) => DropdownMenuItem(
                                  child: Text(e),
                                  value: e,
                                ))
                            .toList(),
                        onChanged: (value) {
                          bookingController.selectChildrenYears.value =
                              value.toString();
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        actions: [
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyButton(buttonText: 'Cancel',onTap: (){
                  Get.back();
                }),
                SizedBox(
                  width: 10.w,
                ),
                MyButton(buttonText: 'Ok',onTap:
                  bookingController.selectChildrenYears.value ==
                      'Select Child Year'
                      ? null
                      : () {
                    bookingController.totalChildren
                        .add(bookingController.selectChildrenYears.value);
                    setState(() {});
                    Get.back();

                },
                    backgroundColor: bookingController.selectChildrenYears.value ==
                                          'Select Child Year'
                                      ? Colors.grey
                                      : AppColors.greenGridientTowColor,
       buttonTextColor:bookingController.selectChildrenYears.value ==
                                    'Select Child Year'
                                ? AppColors.blackColor.withOpacity(0.3)
                                : AppColors.whiteColor,
                width: 30.w,
                ) ,






                // InkWell(
                //   onTap: bookingController.selectChildrenYears.value ==
                //           'Select Child Year'
                //       ? null
                //       : () {
                //           bookingController.totalChildren
                //               .add(bookingController.selectChildrenYears.value);
                //           setState(() {});
                //           Get.back();
                //         },
                //   child: Container(
                //     child: Text(
                //       'Ok',
                //       style: TextStyle(
                //           color: bookingController.selectChildrenYears.value ==
                //                   'Select Child Year'
                //               ? AppColors.blackColor.withOpacity(0.3)
                //               : AppColors.greenGridientTowColor),
                //     ),
                //   ),
                // ),
                SizedBox(
                  width: 10.w,
                )
              ],
            ),
          ),
          SizedBox(height: 20.h,)
        ]);
  }

  bottomSheet() {
    Get.bottomSheet(
        isScrollControlled: true,
        Card(
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.sp),
                  topLeft: Radius.circular(10.sp))),
          child: Container(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
            height: 500.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.sp),
                    topRight: Radius.circular(10.sp))),
            child: Obx(
              () => Column(
                children: [
                  Text('Select rooms and guests'),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Rooms'),
                      Container(
                        width: 130.w,
                        height: 50.h,
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.blackColor.withOpacity(0.5),
                                width: 1.sp)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                if (bookingController.rooms.value >= 1) {
                                  bookingController.rooms.value--;
                                }
                              },
                              child: Container(
                                width: 20.w,
                                height: 20.h,
                                child: Center(
                                  child: Icon(Icons.remove),
                                ),
                              ),
                            ),
                            Text(bookingController.rooms.value.toString()),
                            InkWell(
                              onTap: () {
                                if (bookingController.rooms.value <= 29) {
                                  bookingController.rooms.value++;
                                }
                              },
                              child: Container(
                                width: 20.w,
                                height: 20.h,
                                child: Center(
                                  child: Icon(Icons.add),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Adults'),
                      Container(
                        width: 130.w,
                        height: 50.h,
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.blackColor.withOpacity(0.5),
                                width: 1.sp)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                if (bookingController.adults.value >= 1) {
                                  bookingController.adults.value--;
                                  setState(() {});
                                }
                              },
                              child: Container(
                                width: 20.w,
                                height: 20.h,
                                child: Center(
                                  child: Icon(Icons.remove),
                                ),
                              ),
                            ),
                            Text(bookingController.adults.value.toString()),
                            InkWell(
                              onTap: () {
                                if (bookingController.adults.value <= 29) {
                                  bookingController.adults.value++;
                                  setState(() {});
                                }
                              },
                              child: Container(
                                width: 20.w,
                                height: 20.h,
                                child: Center(
                                  child: Icon(Icons.add),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Children'),
                      Container(
                        width: 130.w,
                        height: 50.h,
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.blackColor.withOpacity(0.5),
                                width: 1.sp)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                bookingController.totalChildren.removeLast();
                                setState(() {});
                              },
                              child: Container(
                                width: 20.w,
                                height: 20.h,
                                child: Center(
                                  child: Icon(Icons.remove),
                                ),
                              ),
                            ),
                            Text(bookingController.totalChildren.value.length
                                .toString()),
                            InkWell(
                              onTap: () {
                                addChildren();
                              },
                              child: Container(
                                width: 20.w,
                                height: 20.h,
                                child: Center(
                                  child: Icon(Icons.add),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  Container(
                    width: double.infinity,
                    height: 80.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Childrens age at check-out',
                          style: TextStyle(
                              color: AppColors.blackColor, fontSize: 18.sp),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                            'Childrens ages will be used to find you the best match in beds, room, size, and special prices.')
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemCount: bookingController.totalChildren.length,
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Child ${index + 1}'),
                            InkWell(
                                onTap: () {},
                                child: InkWell(
                                    onTap: () {
                                      alertDailog(index);
                                    },
                                    child: Text(
                                      '${bookingController.totalChildren[index]} years old',
                                      style: TextStyle(
                                          color:
                                              AppColors.greenGridientTowColor),
                                    )))
                          ],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 10.h,
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  MyButton(buttonText: 'Applay', onTap: () {}),
                ],
              ),
            ),
          ),
        ));
  }

  Widget horizantalDivider() {
    return Container(
      height: 1.sp,
      color: AppColors.blackColor.withOpacity(0.3),
    );
  }

  datePicker() async {
    DateTimeRange? dateTimeRange = await showDateRangePicker(
        context: context,
        firstDate: DateTime.now(),
        initialDateRange: DateTimeRange(
            start: bookingController.myDateRange!.start,
            end: bookingController.myDateRange!.end),
        lastDate: DateTime(2024));

    if (dateTimeRange == null)
      return;
    else {
      bookingController.myDateRange = dateTimeRange;
      bookingController.start = bookingController.myDateRange!.start;
      //  initialDateRange:DateTimeRange(start: myDateRange!.start, end: myDateRange!.end);
      bookingController.end = bookingController.myDateRange!.end;

//
      //  int.parse(()*int.parse(widget.hotel!['rent']);
      setState(() {});
    }
  }

  alertDailog(int index) {
    return Get.defaultDialog(
        content: Text(
            'Are you shure you want to Delete\n ${bookingController.totalChildren[index]} years old children'),
        contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    child: Text('Cancel'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    bookingController.totalChildren.removeAt(index);
                    setState(() {});
                    Get.back();
                  },
                  child: Container(
                    child: Text('Ok'),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          )
        ]);
  }

  void dialogBox() {
    Get.defaultDialog(
        content: Column(
      children: [
        InkWell(
            onTap: () {
              Get.to(OrderAsGuestScreen());
            },
            child: Text(
              'Order as Guest',
              style: TextStyle(color: AppColors.greenGridientTowColor),
            )),
        SizedBox(
          height: 20.h,
        ),
        InkWell(
            onTap: () {
              Get.to(LoginScreen());
            },
            child: Text('Sign In',
                style: TextStyle(color: AppColors.greenGridientTowColor)))
      ],
    ));
  }
}
