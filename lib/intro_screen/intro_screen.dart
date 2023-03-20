import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hotel_management/app_confiq/app_styles.dart';

import '../app_confiq/app_colors.dart';
import '../controller/intro_controller.dart';
import '../screens/auth_screen/login_screen.dart';
import '../screens/auth_screen/login_with_different_button.dart';
import '../screens/bottom_navigation_bar_screen.dart';
import '../screens/home_screen/home_screen.dart';
import '../widget/mybutton.dart';
class IntroScreen extends StatefulWidget {
   IntroScreen({Key? key}) : super(key: key);


  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  IntroController introController=Get.put(IntroController());

   int _currentPage = 0;

  // late Timer timer;
   PageController pageController = PageController(
     initialPage: 0,
   );
  void initState() {
    super.initState();
    // timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
    //   if (_currentPage < 2) {
    //     _currentPage++;
    //   } else {
    //   Get.offAll(()=>BottomNavigationBarScreen());
    //   }
    //
    //   pageController.animateToPage(
    //     _currentPage,
    //     duration: Duration(milliseconds: 350),
    //     curve: Curves.easeIn,
    //   );
    // });
  }
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
   // timer.cancel();
    introController.onDelete();
  }


   @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(

              child: PageView(

                controller: pageController,
                children: [
                  buildIntro(introController.introScreenData[0],0),
                  buildIntro(introController.introScreenData[1],1),
                  buildIntro(introController.introScreenData[2],2),
                ],
              ),
            ),
            // Padding(
            //   padding:  EdgeInsets.symmetric(horizontal: 25.w),
            //   child: MyButton(buttonText: 'Next',onTap: (){
            //     // Get.to(LoginScreen());
            //   },backgroundColor: AppColors.greenGridientTowColor),
            // ),
            // SizedBox(height: 23.h,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 25.w),
              child: MyButton(buttonText: 'Skip',
                  height: 40.h,
                  onTap: (){
                Get.to(()=> BottomNavigationBarScreen());
              },backgroundColor: AppColors.greenGridientTowColor.withOpacity(0.3)),
            ),
SizedBox(height: 70.h,),
          ],
        ),
      ),
    );
  }

   Widget buildIntro(Map map,int index){
    //navigate();
     return Stack(
// clipBehavior: Clip.none,
       children: [
         Column(
           children: [
             Container(
               width: Get.width,
               height: Get.height*0.55,
               decoration: BoxDecoration(
                   image: DecorationImage(
                       image: AssetImage(map['image']),
                       fit: BoxFit.cover
                   )
               ),
             ),
             SizedBox(height: 10.h,),
             Container(
               padding: EdgeInsets.symmetric(horizontal: 20.w),
                 child: Text(map['title'],style: AppStyles.appHeadingStyle,textAlign: TextAlign.center)),
             SizedBox(height: 10.h,),
     Padding(
                   padding: EdgeInsets.symmetric(horizontal: 56.w),
                   child: Text(map['subtitle'],textAlign: TextAlign.center),
                 ),
                 SizedBox(height: 30.h,),
             Padding(
               padding:  EdgeInsets.symmetric(horizontal:160.w),
               child: Row(
                 children: [
                   AnimatedContainer(duration: Duration(seconds: 5),
                     width:index==0?12.w: 9.w,
                     height: 4.h,
                     decoration: BoxDecoration(
                         color:index==0? AppColors.greenGridientTowColor:Color(0xffE5E5E5),
                         borderRadius: BorderRadius.circular(50.sp)
                     ),
                   ),
                   SizedBox(width: 3.w,),
                   AnimatedContainer(duration: Duration(seconds: 5),
                     width:index==1?12.w: 9.w,
                     height: 4.h,
                     decoration: BoxDecoration(
                         color:index==1? AppColors.greenGridientTowColor:Color(0xffE5E5E5),
                         borderRadius: BorderRadius.circular(50.sp)
                     ),
                   ),
                   SizedBox(width: 3.w,),
                   AnimatedContainer(duration: Duration(seconds: 5),
                     width:index==2?12.w: 9.w,
                     height: 4.h,
                     decoration: BoxDecoration(
                         color:index==2? AppColors.greenGridientTowColor:Color(0xffE5E5E5),
                         borderRadius: BorderRadius.circular(50.sp)
                     ),
                   ),
                 ],
               ),
             ),
             SizedBox(height: 10.h,),



           ],
         ),

//          Align(
//            alignment: Alignment.bottomCenter,
//            child: Container(
//              width: Get.width,
//              height: Get.height*0.4,
//
//              decoration: BoxDecoration(
//                color: AppColors.whiteColor
//              ),
//              child: Column(
//                children: [
//                  SizedBox(height: 25.h,),
//                  Padding(
//                    padding: EdgeInsets.symmetric(horizontal: 56.w),
//                    child: Text(map['subtitle'],textAlign: TextAlign.center),
//                  ),
//                  SizedBox(height: 30.h,),
//                  Padding(
//                    padding:  EdgeInsets.symmetric(horizontal:160.w),
//                    child: Row(
//                      children: [
//                        AnimatedContainer(duration: Duration(seconds: 5),
//                        width:index==0?12.w: 9.w,
//                          height: 4.h,
//                          decoration: BoxDecoration(
//                            color:index==0? AppColors.greenGridientTowColor:Color(0xffE5E5E5),
//                            borderRadius: BorderRadius.circular(50.sp)
//                          ),
//                        ),
//                        SizedBox(width: 3.w,),
//                        AnimatedContainer(duration: Duration(seconds: 5),
//                          width:index==1?12.w: 9.w,
//                          height: 4.h,
//                          decoration: BoxDecoration(
//                              color:index==1? AppColors.greenGridientTowColor:Color(0xffE5E5E5),
//                              borderRadius: BorderRadius.circular(50.sp)
//                          ),
//                        ),
//                        SizedBox(width: 3.w,),
//                        AnimatedContainer(duration: Duration(seconds: 5),
//                          width:index==2?12.w: 9.w,
//                          height: 4.h,
//                          decoration: BoxDecoration(
//                              color:index==2? AppColors.greenGridientTowColor:Color(0xffE5E5E5),
//                              borderRadius: BorderRadius.circular(50.sp)
//                          ),
//                        ),
//                      ],
//                    ),
//                  ),
//                  SizedBox(height: 23.h,),
//
//                  Padding(
//                    padding:  EdgeInsets.symmetric(horizontal: 25.w),
//                    child: MyButton(buttonText: 'Next',onTap: (){
//                      // Get.to(LoginScreen());
//                    },backgroundColor: AppColors.greenGridientTowColor),
//                  ),
//                  SizedBox(height: 23.h,),
//                  Padding(
//                    padding:  EdgeInsets.symmetric(horizontal: 25.w),
//                    child: MyButton(buttonText: 'Skip',onTap: (){
//                      Get.to(()=> BottomNavigationBarScreen());
//                    },backgroundColor: AppColors.greenGridientTowColor.withOpacity(0.3)),
//                  ),
//                ],
//              ),
//            ),
//          ),
//          Align(
//            alignment: Alignment.topCenter,
//
//            child: Container(
//              width: Get.width,
// height: 385.h,
//              padding: EdgeInsets.only(left: 24.w,right:24.w,top: 300.h ),
// decoration: BoxDecoration(
//   boxShadow: [
//     BoxShadow(
//       color: Color(0xff000000).withOpacity(0.3),
//       spreadRadius: 10.sp
//     )
//   ]
// ),
//              child: Text(map['title'],style: TextStyle(color: AppColors.whiteColor,fontSize: 30.sp),textAlign: TextAlign.center),
//            ),
//          )
       ],
     );
   }

   // void navigate(){
   //   Future.delayed(const Duration(seconds: 5),() {
   //     if(introController.changeIntro.value<3){
   //       introController.changeIntro.value++;
   //     }else{
   //       Get.to(()=>const LoginWithDifferentButton());
   //     }
   //   },);
   // }
}

