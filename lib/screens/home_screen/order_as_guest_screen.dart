import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app_confiq/app_colors.dart';
import '../../widget/form_text_field.dart';
import '../../widget/mybutton.dart';
class OrderAsGuestScreen extends StatelessWidget {
  const OrderAsGuestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar:     AppBar(
        backgroundColor: AppColors.greenGridientTowColor,
        title:  Text('Order As Guest',style: TextStyle(color: AppColors.blackColor.withOpacity(0.8),fontSize: 22.sp,
          fontWeight: FontWeight.w700,),),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 25.w),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50.h,),
              FormTextField(label: 'Name',),
              SizedBox(height: 18.h,),

              FormTextField(label: 'Email',),
              SizedBox(height: 18.h,),
              FormTextField(label: 'Phone',),
              SizedBox(height: 18.h,),
              FormTextField(label: 'Subject',),
              SizedBox(height: 18.h,),
              FormTextField(label: 'Enter Message',maxLines: 3),
              SizedBox(height: 18.h,),
              MyButton(buttonText: 'Submit',),
              SizedBox(height: 18.h,),


            ],
          ),
        ),
      ),
    ));
  }
}
