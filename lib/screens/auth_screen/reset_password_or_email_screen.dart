import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hotel_management/widget/mybutton.dart';

import '../../app_confiq/app_styles.dart';
import '../../widget/form_text_field.dart';
import 'forgot_password.dart';
class ResetPasswordOrEmailScreen extends StatelessWidget {
  String? status;
   ResetPasswordOrEmailScreen({Key? key,this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 26.h,),
            InkWell(
              onTap: (){
                Get.back();
              },
              child: Container(
                width: 24.w,
                height: 24.h,

                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('asset/icon/back.png')
                    )
                ),
              ),
            ),
            SizedBox(height: 24.h,),
            Text('Reset $status',style: TextStyle(fontFamily:'Roboto-Black',fontSize: 38.sp,
              fontWeight: FontWeight.w700,),),
            SizedBox(height: 80.h,),
            FormTextField(
              label: status!,
            ),
            SizedBox(height: 40.h,),
            MyButton(buttonText: 'Reset',height: 40.h,onTap: (){
              Get.to(ForgotPassword());
            },)
          ],
        ),
      ),
    ));
  }
}
