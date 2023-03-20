import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hotel_management/screens/auth_screen/reset_password_or_email_screen.dart';

import '../../app_confiq/app_colors.dart';
import '../../app_confiq/app_styles.dart';
import '../../controller/auth_controller.dart';
import '../../widget/form_text_field.dart';
import '../../widget/mybutton.dart';
import 'forgot_password.dart';
class ResetPassword extends StatelessWidget {
   ResetPassword({Key? key}) : super(key: key);

  @override
  AuthController authController=Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body:
          Obx(()=>
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
                    Text('Forgot\nPassword',style: TextStyle(fontFamily: 'Roboto-Black',fontSize: 38.sp,
                      fontWeight: FontWeight.w700,),),
                    SizedBox(height: 40.h,),
                 Text('In Which Way you want to reset you\npassword',style: AppStyles.smallTextStyle),
                    SizedBox(height: 53..h,),
                    authController.isClickSMSButton.value?SizedBox():SizedBox(),
                    authController.isClickEmailButton.value?SizedBox():SizedBox(),
                    GestureDetector(
                        onTap: (){
                          authController.isClickEmailButton.value=false;
authController.isClickSMSButton.value=!authController.isClickSMSButton.value;
                        },
                        child: ContainerButton(authController.resetPasswordData[0],authController.isClickSMSButton.value),),
                    SizedBox(height: 29.h,),
                    GestureDetector(
                        onTap: (){
authController.isClickSMSButton.value=false;
authController.isClickEmailButton.value=!authController.isClickSMSButton.value;
                        },
                        child: ContainerButton(authController.resetPasswordData[1],authController.isClickEmailButton.value)),
SizedBox(height: 50.h,),
                    MyButton(buttonText: 'Continue',
                      height: 40.h,
                      onTap: (){
                      String status;
                      if(authController.isClickSMSButton.value==true){
                        status='Phone';
                        Get.to(ResetPasswordOrEmailScreen(status: status),transition: Transition.rightToLeft,duration: Duration(microseconds: 500),);

                      }else if(authController.isClickEmailButton.value==true){
                        status='Email';
                        Get.to(ResetPasswordOrEmailScreen(status: status),transition: Transition.rightToLeft,duration: Duration(microseconds: 500),);

                      }else{

                      }
                    },),
                    SizedBox(height: 19.h,),





                  ],
                ),
              ),
            ),
          ),

    ));
  }
  Widget ContainerButton(Map map,bool isClick){
    return Container(
      height: 120.h,
      decoration: BoxDecoration(
        color: Color(0xffF7F5FF),
        borderRadius: BorderRadius.circular(10.sp),
          border: Border.all(
              color:isClick?AppColors.greenGridientTowColor:const Color(0xffF7F5FF) ,
              width: 1.w
          )
      ),
      child: Padding(
        padding:  EdgeInsets.only(left: 19.w,top: 0.h),
        child: Row(
          children: [
            Container(
              width: 72.w,
              height: 72.h,
              decoration: BoxDecoration(
                color: AppColors.greenGridientTowColor,
                shape: BoxShape.circle,

              ),
              child: Center(child: Image.asset(map['image'],color: AppColors.whiteColor),),
            ),
            SizedBox(width: 20.w,),
         Column(crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Text(map['whichReset'],style: AppStyles.smallTextStyle),
             SizedBox(height: 6.h,),
             Text(map['data'],style: AppStyles.smallTextStyle,)
           ],
         )
          ],
        ),
      ),
    );
  }
}
