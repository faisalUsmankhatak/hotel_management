import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hotel_management/app_confiq/app_styles.dart';

import '../../app_confiq/app_colors.dart';
import '../../controller/auth_controller.dart';
import '../../widget/alert_dialog.dart';
import '../../widget/form_text_field.dart';
import '../../widget/mybutton.dart';
class CreateNewPassword extends StatelessWidget {
   CreateNewPassword({Key? key}) : super(key: key);

  @override
  AuthController authController=Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body:
          SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 25.w),
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
                  Text('Create a new \nPassword',style: TextStyle(fontFamily: 'Roboto-Black',fontSize: 38.sp,
                    fontWeight: FontWeight.w700,),),
                  SizedBox(height: 30.h,),
                  Focus(
                      onFocusChange: (value){
                        authController.isActiveNewPassword=value;
                      },
                      child: FormTextField(label: 'Enter New Password')),
                  SizedBox(height: 32.h,),
                  FormTextField(label: 'Confirm Password',),

                  SizedBox(height: 30.h,),
                  Obx(()=>
                      Row(
                        children: [
                          Expanded(child: SizedBox()),
                          GestureDetector(
                            onTap: (){
                              authController.isRememberMe.value=!authController.isRememberMe.value;
                            },
                            child: Container(
                              width: 19.w,
                              height: 19.h,
                              decoration: BoxDecoration(
                                  color:  authController.isRememberMe.value?AppColors.greenGridientTowColor:AppColors.whiteColor,
                                  borderRadius: BorderRadius.circular(6.sp),
                                  border: Border.all(color: AppColors.greenGridientTowColor,width: 1.sp)
                              ),
                              child: Center(child: Icon(Icons.done,color: AppColors.whiteColor,size: 14.sp),),
                            ),
                          ),
                          SizedBox(width: 6.w,),
                          Text('Remember me',style: AppStyles.smallTextStyle),
                          Expanded(child: SizedBox()),
                        ],
                      ),
                  ),
                  SizedBox(height: 30.h,),
                  MyButton(buttonText: 'Confirm',
                    height: 40.h,
                    onTap: (){
               GetMyDialoge();
                  },),
                  SizedBox(height: 19.h,),

                ],
              ),
            ),
          ),

    ));
  }
}
