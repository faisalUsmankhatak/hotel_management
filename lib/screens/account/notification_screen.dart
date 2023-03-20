import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../app_confiq/app_colors.dart';
import '../../app_confiq/app_styles.dart';
import '../../controller/account_controller.dart';
class NotificationScreen extends StatelessWidget {
   NotificationScreen({Key? key}) : super(key: key);
  AccountController accountController=Get.put(AccountController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
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
                    width: 24.w,
                    height: 24.h,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('asset/icon/back.png'))),
                  ),
                ),
                SizedBox(
                  width: 20.h,
                ),
                Text(
                  'Notification',
                  style:     AppStyles.appBarStyle,)
              ],
            ),
            SizedBox(
              height: 22.h,
            ),
            Obx(()=>
               NotificationTypes(label: 'General Notification', onChanged: (value ) {
                accountController.isOnNotification.value=value;
              }, isOn:  accountController.isOnNotification.value,
              ),
            ),

            SizedBox(
              height: 22.h,
            ),
            Obx(()=>
                NotificationTypes(label: 'Sound', onChanged: (value ) {
                  accountController.isOnSound.value=value;
                }, isOn:  accountController.isOnSound.value,
                ),
            ),

            SizedBox(
              height: 22.h,
            ),


            Obx(()=>
                NotificationTypes(label: 'Vibrate', onChanged: (value ) {
                  accountController.isVibrate.value=value;
                }, isOn:  accountController.isVibrate.value,
                ),
            ),

            SizedBox(
              height: 22.h,
            ),

            Obx(()=>
                NotificationTypes(label: 'App Updates', onChanged: (value ) {
                  accountController.isAppUpdates.value=value;
                }, isOn: accountController.isAppUpdates.value,
                ),
            ),

            SizedBox(
              height: 22.h,
            ),

            Obx(()=>
                NotificationTypes(label: 'New Service Available', onChanged: (value ) {
                  accountController.isNewServiceAvailable.value=value;
                }, isOn: accountController.isNewServiceAvailable.value,
                ),
            ),

            SizedBox(
              height: 22.h,
            ),

          ],
        ),
      ),
    ));
  }
}
class NotificationTypes extends StatelessWidget {
  String label;
    Function(bool)? onChanged;
    bool isOn;
   NotificationTypes({Key? key,required this.label,required this.onChanged,required this.isOn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Text(label,style: AppStyles.smallTextStyle),
        Switch(value: isOn, onChanged: onChanged)
      ],
    );
  }
}


