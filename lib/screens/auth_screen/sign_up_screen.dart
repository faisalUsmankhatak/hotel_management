import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hotel_management/app_confiq/app_styles.dart';
import 'package:hotel_management/widget/mybutton.dart';

import '../../app_confiq/app_colors.dart';
import '../../controller/auth_controller.dart';
import '../../widget/form_text_field.dart';
import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
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
                  Text("Create YourAccount",style: TextStyle(fontFamily:'Roboto-Black',fontSize: 38.sp,
                    fontWeight: FontWeight.w700,),),


                  SizedBox(
                    height: 26.h,
                  ),
                  // Row(
                  //   children: [
                  //     InkWell(
                  //       onTap: () {
                  //         Get.back();
                  //       },
                  //       child: Container(
                  //         width: 24.w,
                  //         height: 24.h,
                  //         decoration: const BoxDecoration(
                  //             image: DecorationImage(
                  //                 image: AssetImage('asset/icon/back.png'))),
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       width: 10.w,
                  //     ),
                  //     Text(
                  //       'Create YourAccount',
                  //       style: AppStyles.appBarStyle,
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 24.h,
                  // ),
                  // SizedBox(
                  //   height: 30.h,
                  // ),
                  FormTextField(label: 'Name'),
                  SizedBox(
                    height: 18.h,
                  ),
                  FormTextField(
                    label: 'Email',
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  FormTextField(
                    label: 'Phone',
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  FormTextField(
                    label: 'City',
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  Obx(
                        () =>
                        FormTextField(
                            label: 'Password',
                            obscureText: authController.isVisibleSignUpPassword
                                .value!,
                            suffixIcon: authController.isVisibleSignUpPassword
                                .value
                                ? 'asset/icon/invisiblePassword.png'
                                : 'asset/icon/passwordVisible.png',
                            onSuffixIconTap: () {
                              authController.isVisibleSignUpPassword.value =
                              !authController.isVisibleSignUpPassword.value;
                            }),
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  Obx(()=>
                     FormTextField(label: 'Confirm Password',
                        obscureText:authController.isVisibleSignUpConfirmPassword
                            .value ,
                        suffixIcon: authController.isVisibleSignUpConfirmPassword
                            .value ? 'asset/icon/invisiblePassword.png'
                            : 'asset/icon/passwordVisible.png',
                     onSuffixIconTap: (){
                       authController.isVisibleSignUpConfirmPassword.value =
                       !authController.isVisibleSignUpConfirmPassword.value;
                     }),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Obx(
                        () =>
                        Row(
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
                            Text('Remember me',
                                style: TextStyle(
                                    color: AppColors.blackColor.withOpacity(
                                        0.8))),
                            Expanded(child: SizedBox()),
                          ],
                        ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  MyButton(
                    buttonText: 'Sign Up',
                    height: 40.h,
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.w),
                    child: Row(
                      children: [
                        Text('Already have an account?',
                            style: AppStyles.smallTextStyle),
                        SizedBox(
                          width: 2.w,
                        ),
                        InkWell(
                            onTap: () {
                              Get.to(() => LoginScreen());
                            },
                            child: Text(
                              'Sign in',
                              style: AppStyles.textButtonStyles,
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
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
