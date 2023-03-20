import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hotel_management/app_confiq/app_colors.dart';
import 'package:hotel_management/screens/auth_screen/reset_password.dart';
import 'package:hotel_management/widget/mybutton.dart';

import '../../app_confiq/app_styles.dart';
import '../../controller/auth_controller.dart';
import '../../widget/form_text_field.dart';
import 'sign_up_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Text('Log into\nYour Account',style: TextStyle(fontFamily:'Roboto-Black',fontSize: 38.sp,
                fontWeight: FontWeight.w700,),),
              SizedBox(height: 80.h,),


              FormTextField(
                label: 'Email',
              ),
              SizedBox(
                height: 18.h,
              ),
              Obx(()=>
                 FormTextField(
                  label: 'Password',
                  suffixIcon: authController.isVisibleSignInPassword.value
                      ? 'asset/icon/invisiblePassword.png'
                      : 'asset/icon/passwordVisible.png',
                  obscureText: authController.isVisibleSignInPassword.value,
                  onSuffixIconTap: (){
                    authController.isVisibleSignInPassword.value=!authController.isVisibleSignInPassword.value;
                  },
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Obx(
                () => Row(
                  children: [
                    Expanded(child: SizedBox()),
                    GestureDetector(
                      onTap: () {
                        authController.isRememberMe.value =
                            !authController.isRememberMe.value;
                      },
                      child: Container(
                        width: 19.w,
                        height: 19.h,
                        decoration: BoxDecoration(
                            color: authController.isRememberMe.value
                                ? AppColors.greenGridientTowColor
                                : AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(6.sp),
                            border: Border.all(
                                color: AppColors.greenGridientTowColor,
                                width: 1.sp)),
                        child: Center(
                          child: Icon(Icons.done,
                              color: AppColors.whiteColor, size: 14.sp),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    Text('Remember me', style: AppStyles.smallTextStyle),
                    Expanded(child: SizedBox()),
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              MyButton(
                buttonText: 'Sign in',
                height: 40.h,
                onTap: () {},
              ),
              SizedBox(
                height: 19.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Text('Forgot Your Password?'),
                    // SizedBox(width: 2.w,),

                    InkWell(
                        onTap: () {
                          Get.to(() => ResetPassword());
                        },
                        child: Text(
                          'Forgot Your Password?',
                          style: AppStyles.textButtonStyles,
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.w),
                child: Row(
                  children: [
                    Text('Dont have an account?',
                        style: AppStyles.smallTextStyle),
                    SizedBox(
                      width: 2.w,
                    ),
                    InkWell(
                        onTap: () {
                          Get.to(() => SignUpScreen());
                        },
                        child: Text(
                          'Sign Up',
                          style: AppStyles.textButtonStyles,
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

  Widget continueWith(String imageUrl) {
    return Container(
      width: 10.w,
      height: 40.h,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.blackColor.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(10.sp)),
      child: Center(child: Image.asset(imageUrl)),
    );
  }
}
