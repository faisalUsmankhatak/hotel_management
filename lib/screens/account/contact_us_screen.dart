import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../app_confiq/app_colors.dart';
import '../../app_confiq/app_styles.dart';
import '../../widget/form_text_field.dart';
import '../../widget/mybutton.dart';
class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(

      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 25.w),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
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
                      width: 22.w,
                      height: 22.h,

                      decoration: const BoxDecoration(
                          image: DecorationImage(fit: BoxFit.cover,
                              image: AssetImage('asset/icon/back.png',))),
                    ),
                  ),
                  SizedBox(
                    width: 20.h,
                  ),
                  Text(
                      'Contact Us',
                      style: AppStyles.appBarStyle
                  )
                ],
              ),
              SizedBox(
                height: 22.h,
              ),
              FormTextField(label: 'Name',),
              SizedBox(height: 18.h,),

              FormTextField(label: 'Email',),
              SizedBox(height: 18.h,),
              FormTextField(label: 'Phone',),
              SizedBox(height: 18.h,),
              FormTextField(label: 'Subject'),
              SizedBox(height: 18.h,),
              FormTextField(label: 'Enter Message',maxLines: 3),
            SizedBox(height: 18.h,),
              MyButton(buttonText: 'Sent Message',),
              SizedBox(height: 18.h,),
              Text('Get in Touch',style: AppStyles.smallHeading,),
              SizedBox(height: 5.h,),
              Container(
                height: 70.h,
                padding: EdgeInsets.all(10.sp),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.greenGridientTowColor,width: 1.sp)
                ),
                child: Text('Get in touch with our customer'
                    ' support team. you can leave a message here directly by filling and subiting this form. Thank you.',
                style: AppStyles.smallTextStyle)),

            ],
          ),
        ),
      ),
    ));
  }
}
