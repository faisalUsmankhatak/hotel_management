import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hotel_management/app_confiq/app_styles.dart';

import '../../app_confiq/app_colors.dart';
import '../../controller/auth_controller.dart';
import '../../widget/mybutton.dart';
import 'create_new_password.dart';
class ForgotPassword extends StatelessWidget {
   ForgotPassword({Key? key}) : super(key: key);
  AuthController authController=Get.find();
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 26.h,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 25.w),
              child: InkWell(
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
            ),
            SizedBox(height: 24.h,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 25.w),
              child: Text('Forgot\nPassword',style: TextStyle(fontFamily:'Roboto-Black',fontSize: 38.sp,
                fontWeight: FontWeight.w700,),),
            ),
            SizedBox(height: 100.h,),
            Row(
              children: [
                Expanded(child: SizedBox()),
                Text('Code has been sent To '),
                Text('+9203****23',style: AppStyles.textButtonStyles,),
                Expanded(child: SizedBox()),

              ],
            ),
            SizedBox(height: 80.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 50.sp,
                    width: 50.sp,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.sp),
                        border: Border.all(color: AppColors.blackColor.withOpacity(0.3), width: 1)
                    ),
                    child: Center(
                      child: RawKeyboardListener(
                        focusNode: authController.firstValueFocusNodeListener,
                        onKey: (RawKeyEvent event) {
                          print(event.data.logicalKey.keyId);
                          if (event.runtimeType == RawKeyDownEvent && (event.logicalKey.keyId == 4294967304)) {
                            authController.firstValue.clear();
                            print('first remove');
                          }
                        },
                        child: TextFormField(
                          controller: authController.firstValue,
                          focusNode: authController.firstValueFocusNode,
                          enableInteractiveSelection: false,

                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            if (value.length == 1) {
                             authController. secondValueFocusNode.requestFocus();
                            }
                          },
                          style: TextStyle(color: Colors.black, fontSize: 17.sp),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            counterText: "",
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50.sp,
                    width: 50.sp,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.sp),
                        border: Border.all(color: AppColors.blackColor.withOpacity(0.3), width: 1)
                    ),
                    child: Center(
                      child: RawKeyboardListener(
                        focusNode: authController.secondValueFocusNodeListener,
                        onKey: (RawKeyEvent event) {
                          print(event.data.logicalKey.keyId);
                          if (event.runtimeType == RawKeyDownEvent &&
                              (event.logicalKey.keyId == 4294967304)) {
                            authController.secondValue.clear();
                            if (authController.secondValue.text.length == 0) {
                              authController.firstValueFocusNode.requestFocus();
                            }
                          }
                        },
                        child: TextFormField(
                          focusNode: authController.secondValueFocusNode,
                          controller: authController.secondValue,
                          enableInteractiveSelection: false,

                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            if (value.length == 1) {
                              authController.thirdValueFocusNode.requestFocus();
                            }
                          },
                          style: TextStyle(color: Colors.black, fontSize: 17.sp),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            counterText: "",
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50.sp,
                    width: 50.sp,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.sp),
                        border: Border.all(color: AppColors.blackColor.withOpacity(0.3), width: 1)
                    ),
                    child: Center(
                      child: RawKeyboardListener(
                        focusNode: authController.thirdValueFocusNodeListener,
                        onKey: (RawKeyEvent event) {
                          print(event.data.logicalKey.keyId);
                          if (event.runtimeType == RawKeyDownEvent &&
                              (event.logicalKey.keyId == 4294967304)) {
                            authController.thirdValue.clear();
                            if (authController.thirdValue.text.length == 0) {
                             authController. secondValueFocusNode.requestFocus();
                            }
                          }
                        },
                        child: TextFormField(
                          controller: authController.thirdValue,
                          focusNode: authController.thirdValueFocusNode,
                          enableInteractiveSelection: false,

                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            if (value.length == 1) {
                              authController.fourthValueFocusNode.requestFocus();
                            }
                          },
                          style:
                          TextStyle(color: Colors.black, fontSize: 17.sp),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            counterText: "",
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50.sp,
                    width: 50.sp,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.sp),
                        border: Border.all(color: AppColors.blackColor.withOpacity(0.3), width: 1)
                    ),
                    child: Center(
                      child: RawKeyboardListener(
                        focusNode: authController.fourthValueFocusNodeListener,
                        onKey: (RawKeyEvent event) {
                          print(event.data.logicalKey.keyId);
                          if (event.runtimeType == RawKeyDownEvent &&
                              (event.logicalKey.keyId == 4294967304)) {
                           authController. fourthValue.clear();
                            if (authController.fourthValue.text.length == 0) {
                              authController.thirdValueFocusNode.requestFocus();
                            }
                          }
                        },
                        child: TextFormField(
                          controller:authController. fourthValue,
                          focusNode: authController.fourthValueFocusNode,
                          enableInteractiveSelection: false,
                          
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          textAlign: TextAlign.center,
                          style:
                          TextStyle(color: Colors.black, fontSize: 17.sp),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            counterText: "",
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(height: 59.h,),
            Row(
              children: [
                Expanded(child: SizedBox()),
                Text('Do not received Code? '),
                Text('Resend',style: AppStyles.textButtonStyles,),
                Expanded(child: SizedBox()),
              ],
            ),
            SizedBox(height: 50.h,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 26.w),
              child: MyButton(buttonText: 'Verify',
                height: 40.h,
                onTap: (){
                Get.to(CreateNewPassword());
              },),
            )
          ],
        ),
      ),
    ));
  }

}
