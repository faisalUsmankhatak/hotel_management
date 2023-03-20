import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../app_confiq/app_colors.dart';
class HotelGalleryScreen extends StatelessWidget {
  List<String> hotelImages;
   HotelGalleryScreen({required this.hotelImages});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 26.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
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
                  'Gallery',
                  style: TextStyle(
                      color: AppColors.blackColor.withOpacity(0.8),
                      fontSize: 22.sp),
                )
              ],
            ),
          ),
          SizedBox(height: 20.h,),
          Expanded(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.sp),
              child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                mainAxisSpacing: 8.sp,
                crossAxisSpacing: 8.sp

              ),
                itemCount: hotelImages.length,itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.sp),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(hotelImages[index])
                    )
                  ),
                );
              },),
            ),
          )
        ],
      ),
    ));
  }
}
