import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hotel_management/screens/auth_screen/sign_up_screen.dart';

import '../../app_confiq/app_styles.dart';
import '../../widget/mybutton.dart';
class LoginWithDifferentButton extends StatelessWidget {
  const LoginWithDifferentButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(left: 78.w,right: 78.w,top: 100.h),
            child: Text('Lets you in',style: TextStyle(fontSize: 40.sp,color: Color(0xff000000),fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 100.h,),
          horizontalDivider(),
          SizedBox(height: 20.h,),

          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: (){
                  Get.back();
                },
                child: Container(
                  width: 24.w,
                  height: 24.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('asset/images/facebook.png')
                    )
                  ),
                ),
              ),
              SizedBox(width: 16.w,),
              Text('Continue with Facebook',style: TextStyle(color: Color(0xff000000),fontSize: 16.sp,),)
            ],
          ),
          SizedBox(height: 20.h,),
          horizontalDivider(),
          SizedBox(height: 20.h,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal:77.w ),
            child: Row(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 16.w,
                  height: 16.h,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('asset/icon/gmail.png')
                      )
                  ),
                ),
                SizedBox(width: 16.w,),
                Text('Continue with Google',style: TextStyle(color: Color(0xff000000),fontSize: 16.sp,),)
              ],
            ),
          ),
          SizedBox(height: 20.h,),
          horizontalDivider(),
          SizedBox(height: 20.h,),
          Row(mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 75.w,),
              Container(
                width: 16.w,
                height: 16.h,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('asset/images/apple.png')
                    )
                ),
              ),
              SizedBox(width: 16.w,),
              Text('Continue with Apple',style: TextStyle(color: Color(0xff000000),fontSize: 16.sp,),)
            ],
          ),
          SizedBox(height: 20.h,),
          horizontalDivider(),
          SizedBox(height: 53.h,),
          Text("or"),
          SizedBox(height: 52.h,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 25.w),
            child: MyButton(buttonText: 'Sign IN',onTap: (){},),
          ),
          SizedBox(height: 15.h,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 70.w),
            child: Row(
              children: [
                Text('Dont have an account?'),

                InkWell(
                    onTap: (){
                      Get.to(()=> SignUpScreen());
                    },
                    child:  Text('Sign Up',style: AppStyles.textButtonStyles,))
              ],
            ),
          )
        ],
      ),
    ));
  }
  Widget horizontalDivider(){
    return Container(
      height: 0.5.h,
      color: Color(0xff000000).withOpacity(0.3),
    );
  }
}
