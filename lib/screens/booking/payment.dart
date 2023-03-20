import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hotel_management/screens/booking/payment_confirm_screen.dart';

import '../../app_confiq/app_colors.dart';
import '../../app_confiq/app_styles.dart';
import '../../controller/bookings_controller.dart';
import '../../widget/mybutton.dart';
import '../../widget/successfull_dialog.dart';
import 'new_card.dart';
class PaymentScreen extends StatelessWidget {
  Map? hotel;
   PaymentScreen({required this.hotel});
  BookingController bookingController=Get.put(BookingController());
  @override
  Widget build(BuildContext context) {

    return SafeArea(child: Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 60.h,
        padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
        child:
        MyButton(buttonText: 'Continue',
          onTap: (){
           // SuccessfullyDialog();
            Get.to(PaymentConfirmScreen(hotel: hotel,));
          },
        ),),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,
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
           child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
                Text('Payment Methods',style: AppStyles.smallHeading,),
               InkWell(
                   onTap: (){
                     Get.to(NewCard(hotel: hotel,));
                   },
                   child: Text('Add New Card',style: AppStyles.textButtonStyle,))
             ],
           ),
         ),
          SizedBox(height: 22.h,),
          containerList(0,'asset/images/paypal.png','PayPal'),
          SizedBox(height: 22.h,),
          containerList(1,'asset/images/google.png','Google Pay'),
          SizedBox(height: 22.h,),
          containerList(2,'asset/images/paypal.png','Apple Pay'),
SizedBox(height: 22.h,),
           Obx(()=>  bookingController.cardImage==''?SizedBox(): Padding(
             padding: EdgeInsets.symmetric(horizontal: 20.w),
             child: Text('Pay with Debit/Credit Card',style: TextStyle(fontWeight: FontWeight.bold)),
           )),
          Obx(()=> bookingController.cardImage==''?SizedBox():containerList(3,'asset/images/payment_card.png','Apple Pay')),

        ],
      ),
    ));
  }
  Widget containerList(int index,String iconUrl,String label){
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.w),
      child: Card(
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
                    Text(label,style: AppStyles.smallTextStyle,)
                  ],
                ),
              ),
              InkWell(
                onTap: (){
                  bookingController.PaymentButton.value=index;
                },
                child: Obx(()=>
                    Container(
                      width: 20.w,
                      height: 20.h,
                      decoration: BoxDecoration(
                          color:  AppColors.whiteColor ,
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.greenGridientTowColor,width: 1.w),

                      ),
                      child: Center(child: Container(
                          width: 15.w,
                          height: 15.h,
                          decoration: BoxDecoration(
                            color:  bookingController.PaymentButton.value==index?AppColors.greenGridientTowColor:AppColors.whiteColor ,
                            shape: BoxShape.circle,


                          ),) ,),
                    ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
