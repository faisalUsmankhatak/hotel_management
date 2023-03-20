import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hotel_management/screens/booking/payment.dart';

import '../../app_confiq/app_colors.dart';
import '../../controller/bookings_controller.dart';
import '../../widget/form_text_field.dart';
import '../../widget/mybutton.dart';
class NewCard extends StatelessWidget {
   NewCard({this.hotel}) ;
   Map? hotel;
   BookingController bookingController=Get.put(BookingController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 60.h,
        padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
        child:
        MyButton(buttonText: 'Add New Card',
          onTap: (){
            // SuccessfullyDialog();
            bookingController.PaymentButton.value=3;
            Get.to( PaymentScreen(hotel: hotel,));
          },
        ),),
      body:SingleChildScrollView(
        child: Column(
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
                    'New Card',
                    style: TextStyle(
                        color: AppColors.blackColor.withOpacity(0.8),
                        fontSize: 22.sp),
                  ),

                ],
              ),
            ),
            SizedBox(height: 20.h,),
               Obx(()=>
               bookingController.cardImage.value==''?Container(height: 150.h,child: Center(child: Text('Scan Card'),),):
               Container(
                height: 190.h,
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              width:  Get.width,
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(20.sp),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(bookingController.cardImage.value)
                  )
                ),
              ),
            ),
            SizedBox(height: 80.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: FormTextField(label: 'Name',),
            ),
            SizedBox(height: 20.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: FormTextField(label: 'Card Number',onChanged: (value){
                bookingController.cardScan.value=value;
                if(bookingController.cardScan.value=='123456789'){
                  bookingController.cardImage.value='asset/images/card1.png';
                }else if(bookingController.cardScan.value=='987654321'){
                  bookingController.cardImage.value='asset/images/card2.png';
                }else {
                  bookingController. cardImage.value='';
                }
              }),
            ),
            SizedBox(height: 20.h,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: FormTextField(label: 'Expiry',),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: FormTextField(label: 'Card Number',),
                  ),
                ),
              ],
            )
          ],
        ),
      ) ,
    ));
  }
}
