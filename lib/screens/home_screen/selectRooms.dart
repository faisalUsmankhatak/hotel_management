import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:hotel_management/screens/home_screen/room_details.dart';

import '../../app_confiq/app_colors.dart';
import '../../app_confiq/app_styles.dart';
import '../auth_screen/login_screen.dart';
import '../hotel_details/checkin_checkout.dart';

class SelectRooms extends StatefulWidget {
  Map? hotel;

  SelectRooms({required this.hotel});

  @override
  State<SelectRooms> createState() => _SelectRoomsState();
}

class _SelectRoomsState extends State<SelectRooms> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap:(){
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
                    Column(
                      children: [
                        Text('Chose Rooms',
                            style: AppStyles.appBarStyle),

                      ],
                    ),
                    Container(
                      width: 22.w,
                      height: 22.h,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                        'asset/icon/black_like.png',
                      ))),
                    ),
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
              Center(
                child: Text(widget.hotel!['hotel_name'],
                    style: AppStyles.smallTextStyle),
              ),
              SizedBox(
                height: 14.h,
              ),
              Expanded(
                  child: ListView.separated(
                shrinkWrap: true,
                itemCount: widget.hotel!['room'].length,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        Get.to(RoomDetailsScreen(
                          hotel: widget.hotel,
                        ));
                      },
                      child: list_room(map: widget.hotel!['room'][index] ));
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 18.h,
                  );
                },
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
                                        ' . ${widget.hotel!['room'][0]['booking_total_rooms']} rooms',style: AppStyles.textButtonStyle,)
                                  ])
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            //  dialogBox();
                            Get.to(CheckInCheckOutScreen(
                              hotel: widget.hotel,
                            ));
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
      ),
    );
  }

  Widget list_room({required Map map}) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      //   height: 360.h,
      decoration: BoxDecoration(
        border: Border.all(
            color: AppColors.blackColor.withOpacity(0.3), width: 1.sp),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15.h,
          ),
           Text('Partialy Refundable',style: AppStyles.appLightStyle),
          SizedBox(
            height: 15.h,
          ),
           Text('Pay in advance',style: AppStyles.appLightStyle),
          SizedBox(
            height: 15.h,
          ),


        Wrap(
            children: [
         ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
           // scrollDirection: Axis.horizontal,
          itemCount: map['facilities'].length,
          itemBuilder: (context,index){
            return Facilities(label: map['facilities'][index]['label'], imagePath: map['facilities'][index]['image']);
          }, separatorBuilder: (context, index) {
return SizedBox(height: 10.w,);
    }),
        ] ),

SizedBox(height: 18.h,),

          Container(
            height: 1.h,
            color: AppColors.blackColor.withOpacity(0.3),
          ),
          SizedBox(
            height: 18.h,
          ),
          RichText(
            text: TextSpan(
              text: 'Price for 1 night\n\n',
              style: AppStyles.smallTextStyle,
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
           Text('+PKR 5,008 taxes and chargs',style: AppStyles.smallTextStyle),
          // Text('Price for 1 night\nPKR ${widget.hotel!['room'][0]['rent']}'),
          SizedBox(
            height: 18.h,
          ),

          widget.hotel!['room'][0]['isSelect'] == true
              ? InkWell(
                  onTap: () {
                    setState(() {
                      widget.hotel!['room'][0]['isSelect'] = false;
                      widget.hotel!['room'][0]['booking_total_rooms'] = '1';
                    });
                  },
                  child: Container(
                    height: 40.h,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColors.greenGridientTowColor,
                            width: 1.sp)),
                    child: const Center(
                      child: Text('Select',
                          style: TextStyle(
                              color: AppColors.greenGridientTowColor)),
                    ),
                  ),
                )
              : SizedBox(
                  height: 40.h,
                  child: InputDecorator(
                    expands: false,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 5.sp),
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
                              .map<DropdownMenuItem<String>>(
                                  (e) => DropdownMenuItem<String>(
                                        value: e,
                                        child: Text(e,
                                            style: TextStyle(
                                                color: e == 'remove'
                                                    ? Colors.red
                                                    : AppColors.blackColor
                                                        .withOpacity(0.7),fontFamily: 'Roboto-Regular',fontSize: 15.sp)),
                                      ))
                              .toList(),
                          onChanged: (value) {
                            if (value.toString() == 'remove') {
                              widget.hotel!['room'][0]['booking_total_rooms'] =
                                  '0';
                              widget.hotel!['room'][0]['selectvalue'] =
                                  'Room 1';

                              widget.hotel!['room'][0]['isSelect'] = true;
                            } else {
                              widget.hotel!['room'][0]['selectvalue'] =
                                  value.toString();
                              print(widget.hotel!['room'][0]['selectvalue']);
                              // widget.hotel!['room'][0]['booking_total_rooms']=
                              widget.hotel!['room'][0]['booking_total_rooms'] =
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
          SizedBox(
            height: 10.h,
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: const Text('See Room',style: TextStyle(color: AppColors.greenGridientTowColor,),)),
        SizedBox(height: 10.h,)
        ],
      ),
    );
    ;
  }

  void dialogBox() {
    Get.defaultDialog(
        content: Column(
      children: [
        InkWell(
            onTap: () {},
            child: Text(
              'OR Guest',
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
class Facilities extends StatelessWidget {
  String label;
  String imagePath;
  Facilities({Key? key,required this.label,required this.imagePath});

  @override
  Widget build(BuildContext context) {

    return   Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Container(
        width: 18.w,
        height: 18.h,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  imagePath,
                ))),
      ),
      SizedBox(
        width: 5.w,
      ),
      Text(label,style: AppStyles.smallTextStyle,),
    ]);
  }
}