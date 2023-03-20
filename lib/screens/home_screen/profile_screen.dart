import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_cropper/image_cropper.dart';
import '../../app_confiq/app_colors.dart';
import '../../app_confiq/app_styles.dart';
import '../../controller/account_controller.dart';
import '../../widget/mybutton.dart';
import '../account/contact_us_screen.dart';
import '../account/edit_profile_screen.dart';
import '../account/notification_screen.dart';
import '../auth_screen/login_screen.dart';
import '../auth_screen/sign_up_screen.dart';

import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  AccountController accountController = Get.put(AccountController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 26.h,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // InkWell(
                  //   onTap: () {
                  //     Get.back();
                  //   },
                  //   child: Container(
                  //     width: 22.w,
                  //     height: 22.h,
                  //
                  //     decoration: const BoxDecoration(
                  //         image: DecorationImage(fit: BoxFit.cover,
                  //             image: AssetImage('asset/icon/back.png',))),
                  //   ),
                  // ),
                  // SizedBox(
                  //   width: 20.h,
                  // ),
                  Text(
                    'Account',
                    style: AppStyles.appBarStyle
                  )
                ],
              ),
              SizedBox(
                height: 22.h,
              ),
              Obx(
                () => Container(
                  width: 90.w,
                  height: 90.h,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.yellow, width: 1)),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      CircleAvatar(
                        radius: 50.sp,
                        foregroundImage: accountController.imagePath.value == ''
                            ? AssetImage('asset/images/human1.png')
                            : Image.file(accountController.fileImage!).image,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 5.sp,
                        child: InkWell(
                          onTap: () {
                            pickImageImageGellaryOrCemra();
                          },
                          child: Container(
                            width: 20.w,
                            height: 20.h,
                            decoration: BoxDecoration(
                                color: AppColors.greenGridientTowColor,
                                borderRadius: BorderRadius.circular(5.sp)),
                            child: Icon(Icons.edit,
                                color: AppColors.whiteColor, size: 14.sp),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              const Text(
                'Faisal Usman',style: TextStyle(fontFamily: 'Roboto-Regular')
              ),
              SizedBox(
                height: 5.h,
              ),
              const Text(
                'faisalusmankktk495@gmail.com',style: TextStyle(fontFamily: 'Roboto-Regular'),
              ),
              SizedBox(
                height: 20.h,
              ),
              horizantalDivider(),
              SizedBox(
                height: 20.h,
              ),

              InkWell(
                onTap: () {
                  Get.to( EditProfileScreen());
                },
                child: Row(
                  children: [
                    Container(
                      width: 22.w,
                      height: 22.h,
                      child: const Icon(Icons.person),
                    ),
                    //Icon(Icons.perm_phone_msg,color: AppColors.blackColor.withOpacity(0.7),) ,
                    SizedBox(
                      width: 3.w,
                    ),
                    Text('Edit Profile',
                        style: AppStyles.appLightStyle),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              InkWell(
                onTap: () {
                  Get.to(const ContactUsScreen());
                },
                child: Row(
                  children: [
                    Container(
                      width: 22.w,
                      height: 22.h,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage('asset/icon/notification.png'))),
                    ),
                    //Icon(Icons.perm_phone_msg,color: AppColors.blackColor.withOpacity(0.7),) ,
                    SizedBox(
                      width: 3.w,
                    ),
                    InkWell(
                        onTap: () {
                          Get.to(NotificationScreen());
                        },
                        child: Text('Notification',
                            style: AppStyles.appLightStyle)),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              InkWell(
                onTap: () {
                  Get.to(ContactUsScreen());
                },
                child: Row(
                  children: [
                    Container(
                      width: 22.w,
                      height: 22.h,
                      child: const Icon(Icons.payments),
                    ),
                    //Icon(Icons.perm_phone_msg,color: AppColors.blackColor.withOpacity(0.7),) ,
                    SizedBox(
                      width: 3.w,
                    ),
                    Text('Payment',
                        style:AppStyles.appLightStyle),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              InkWell(
                onTap: () {
                  Get.to(const ContactUsScreen());
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.call,
                      color: AppColors.blackColor.withOpacity(0.7),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Text('Contact Us',
                        style: AppStyles.appLightStyle),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  Icon(
                    Icons.not_listed_location,
                    color: AppColors.blackColor.withOpacity(0.7),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Text('FAQs',
                      style: AppStyles.appLightStyle),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  Icon(
                    Icons.content_copy,
                    color: AppColors.blackColor.withOpacity(0.7),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Text('Privacy Policy',
                      style: AppStyles.appLightStyle),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  Icon(
                    Icons.content_copy,
                    color: AppColors.blackColor.withOpacity(0.7),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Text('Terms & Conditions',
                      style: AppStyles.appLightStyle),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  Icon(
                    Icons.logout,
                    color: AppColors.blackColor.withOpacity(0.7),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  InkWell(
                      onTap: () {
                        bottomSheet();
                      },
                      child: Text('Logout',
                          style:AppStyles.appLightStyle)),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              MyButton(
                  buttonText: 'Create Account',
                  height: 40.h,
                  onTap: () {
                    Get.to(SignUpScreen());
                  }),
              SizedBox(
                height: 18.h,
              ),
              MyButton(
                  buttonText: 'Sign In',
                  height: 40.h,
                  onTap: () {
                    Get.to(LoginScreen());
                  }),
            ],
          ),
        ),
      ),
    ));
  }

  Widget horizantalDivider() {
    return Container(
      height: 1.5,
      color: AppColors.blackColor.withOpacity(0.2),
    );
  }

  pickImage(ImageSource source) async {
    ImagePicker picker = ImagePicker();
    // Pick an image
    try {
      XFile? image = await picker.pickImage(source: source);
      if (image != null) {
        accountController.fileImage = File(image!.path);
        accountController.fileImage =
            await _corpImage(imageFile: accountController.fileImage);
        accountController.froFileImageBytes =
            await accountController.fileImage!.readAsBytes();
        accountController.base64string =
            base64.encode(accountController.froFileImageBytes);
        accountController.imagePath.value = image.path;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<File?> _corpImage({required File? imageFile}) async {
    CroppedFile? croppedFile =
        await ImageCropper().cropImage(sourcePath: imageFile!.path!);
    if (croppedFile == null) {
      return null;
    } else {
      return File(croppedFile.path);
    }
  }

  bottomSheet() {
    Get.bottomSheet(Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.sp), topRight: Radius.circular(15.sp)),
      ),
      child: Container(
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(15.sp),
                topLeft: Radius.circular(15.sp))),
        height: 290.h,
        child: Column(
          children: [
            SizedBox(
              height: 15.h,
            ),
            Container(
              width: 50.w,
              height: 3.sp,
              decoration:
                  BoxDecoration(color: AppColors.blackColor.withOpacity(0.5)),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Logout',
              style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.red,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Container(
                height: 0.5.sp,
                decoration:
                    BoxDecoration(color: AppColors.blackColor.withOpacity(0.5)),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Are you sure you want to delete',
              style: AppStyles.appHeadingStyle,
            ),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: MyButton(
                  buttonText: "Remove",
                  backgroundColor: AppColors.greenGridientTowColor,
                  buttonTextColor: AppColors.whiteColor,
                  width: 30,
                  onTap: () {}),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: MyButton(
                  buttonText: "Cancel",
                  buttonTextColor: AppColors.greenGridientTowColor,
                  backgroundColor:
                      AppColors.greenGridientTowColor.withOpacity(0.3),
                  onTap: () {
                    Get.back();
                  },
                  width: 30),
            ),
          ],
        ),
      ),
    ));
  }

  pickImageImageGellaryOrCemra() {
    Get.bottomSheet(Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.sp), topRight: Radius.circular(15.sp)),
      ),
      child: Container(
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(15.sp),
                topLeft: Radius.circular(15.sp))),
        height: 190.h,
        child: Column(
          children: [
            SizedBox(
              height: 15.h,
            ),
            Container(
              width: 50.w,
              height: 3.sp,
              decoration:
                  BoxDecoration(color: AppColors.blackColor.withOpacity(0.9)),
            ),
            SizedBox(
              height: 12.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Container(
                height: 0.5.sp,
                decoration:
                    BoxDecoration(color: AppColors.blackColor.withOpacity(0.5)),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: MyButton(
                  buttonText: "Browse Gallery",
                  backgroundColor: AppColors.greenGridientTowColor,
                  buttonTextColor: AppColors.whiteColor,
                  width: 40,
                  onTap: () {
                    pickImage(ImageSource.gallery);
                    Get.back();
                  }),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: MyButton(
                  buttonText: "Use a Cemara",
                  buttonTextColor: AppColors.greenGridientTowColor,
                  backgroundColor:
                      AppColors.greenGridientTowColor.withOpacity(0.3),
                  onTap: () {
                    pickImage(ImageSource.camera);
                    Get.back();
                  },
                  width: 40),
            ),
          ],
        ),
      ),
    ));
  }
}
