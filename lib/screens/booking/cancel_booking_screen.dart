import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hotel_management/widget/mybutton.dart';

import '../../app_confiq/app_colors.dart';
import '../../controller/bookings_controller.dart';
import '../../widget/successfull_dialog.dart';
class CancelBookingScreen extends StatelessWidget {
   CancelBookingScreen({Key? key}) : super(key: key);
  BookingController bookingController=Get.find();
  @override
  Widget build(BuildContext context) {

    return SafeArea(child: Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
          height: 60.h,
          padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
          child:
          MyButton(buttonText: 'Confirm Cancellation',
            onTap: (){
           //   SuccessfullyDialog();
            },
           ),),
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
                  'Cancel Hotel Booking',
                  style: TextStyle(
                      color: AppColors.blackColor.withOpacity(0.8),
                      fontSize: 22.sp),
                )
              ],
            ),
          ),
          SizedBox(
            height: 22.h,
          ),
          Container(
            width: Get.width,
        padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Text('Please select a payment refund method (only 80% will berefunded'),
          ),
          SizedBox(height: 22.h,),
          containerList(0,'asset/images/paypal.png','PayPal'),
          SizedBox(height: 22.h,),
          containerList(1,'asset/images/google.png','Google Pay'),
          SizedBox(height: 22.h,),
          containerList(2,'asset/images/paypal.png','Apple Pay'),
          SizedBox(height: 22.h,),
          containerList(3,'asset/images/payment_card.png','.... .... .... .... 4365'),
          Expanded(child: SizedBox()),
          Text('Refund:\$345.4',style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 60.h,)
        ],
      ),
    ));
  }
  Widget containerList(int index,String iconUrl,String label){
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.w)
      ),
      child: Container(
        height: 60.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.w)
        ),
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(

              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 28.w,
                    height: 28.h,
                    decoration: BoxDecoration(
                     image: DecorationImage(
                       fit: BoxFit.cover,
                       image: AssetImage(iconUrl)
                     )
                    ),
                  ),
                  SizedBox(width: 10.w,),
                  Text(label)
                ],
              ),
            ),
            InkWell(
              onTap: (){
                bookingController.cancelPaymentButton.value=index;
              },
              child: Obx(()=>
                 Container(
                  width: 20.w,
                  height: 20.h,
                  decoration: BoxDecoration(
                    color:  bookingController.cancelPaymentButton.value==index?AppColors.greenGridientTowColor:AppColors.whiteColor ,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.greenGridientTowColor,width: 2.w)
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
