import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../app_confiq/app_colors.dart';
import '../../controller/bookings_controller.dart';
import '../../controller/home_controller.dart';
class SeeAllRatingScreen extends StatelessWidget {
   SeeAllRatingScreen({Key? key}) : super(key: key);
  BookingController bookingController=Get.find();
   HomeController homeController=Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body:
      Obx(()=>
         Column(
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
                  'Rate the Hotel',
                  style: TextStyle(
                      color: AppColors.blackColor.withOpacity(0.8),
                      fontSize: 22.sp),
                )
              ],
            ),
            SizedBox(
              height: 22.h,
            ),
            bookingController.ratingFilter.value==8?SizedBox():         Container(
              height: 40.h,
              margin:   EdgeInsets.only(left: 15.w),

              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return  InkWell(
                    onTap: (){

                        bookingController.ratingFilter.value=index;

                        // bookingController.ratingFilter.value=(6-index);

                    },
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 5.w),
                      child: Chip(

                        backgroundColor:bookingController.ratingFilter.value==index  ?AppColors.greenGridientTowColor:  Colors.transparent,
                        shape: StadiumBorder(side: BorderSide(color: AppColors.greenGridientOneColor)
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        label: Row(
                          children: [
                            Icon(Icons.star,size: 14.sp,color:bookingController.ratingFilter.value==index ?AppColors.whiteColor:  AppColors.greenGridientTowColor ),
                            SizedBox(width: 5.w,),
                            Text(index==0?'All':(6-index).toString(),style: TextStyle(color: bookingController.ratingFilter.value==index ?AppColors.whiteColor:  AppColors.greenGridientTowColor),)
                            // Text(filterController.countries[index],style: TextStyle(color:filterController.countriesFilterIndex.value==index?AppColors.whiteColor:AppColors.greenGridientTowColor,fontSize: 15.sp,fontWeight: FontWeight.w700),),

                          ],
                        ),
                      ),
                    ),
                  );
                },separatorBuilder: (context,index){
                return SizedBox(width: 5.w,);
              },),
            ),
            SizedBox(
              height: 22.h,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                Text("Review",style: TextStyle(
                  color: AppColors.blackColor.withOpacity(0.8),
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                ),),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RatingBarIndicator(
                      rating: 1,
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Color(0xffFFB02E),
                      ),
                      itemCount: 1,
                      itemSize: 15.0,
                      direction: Axis.horizontal,
                    ),
                    Text('4.4',style: TextStyle(fontSize: 15.sp,color: AppColors.greenGridientTowColor,fontWeight: FontWeight.bold)),
                    Text('(4,56 reviews)',style: TextStyle(fontSize: 15.sp,color: AppColors.blackColor.withOpacity(0.2),fontWeight: FontWeight.bold)),

                  ],
                ),

              ],),
            ),
            SizedBox(height: 22.h,),
            Expanded(
              child: ListView.separated(

                itemCount: 4,
                shrinkWrap: true,
                itemBuilder: (context,index){
                  if( bookingController.ratingFilter.value==0){
                    return review(index);
                  }
                else if(homeController.review[index]['rating'].contains((6-bookingController.ratingFilter.value).toString())){
                  return review(index);
                  }else{
                  return Container();
                  }
                }, separatorBuilder: (context,index){
                return SizedBox(height: 7.h,);
              }, ),
            ),
            SizedBox(height: 20.h,)
          ],


    ),
      )
    )
    );
  }
  Widget review(int index){
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 10.w),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.sp)
        ),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.sp)
            ),
            height: 120.h,
            child:Column(
              children: [
                ListTile(leading: CircleAvatar(
                  radius: 20.sp,
                  backgroundImage:AssetImage(homeController.review[index]['image']) ,
                ),
                  title: Text(homeController.review[index]['name']!,),
                  subtitle: Text(homeController.review[index]['date']!),
                  trailing: Container(
                    width: 55.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                        color: AppColors.greenGridientTowColor,
                        borderRadius: BorderRadius.circular(20.sp)
                    ),
                    child: Center(child:  Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RatingBarIndicator(
                          rating: 1,
                          itemBuilder: (context, index) => Icon(
                            Icons.star,
                            color: AppColors.whiteColor,
                          ),
                          itemCount: 1,
                          itemSize: 15.0,
                          direction: Axis.horizontal,
                        ),
                        SizedBox(width: 3.w,),
                        Text(homeController.review[index]['rating'],style: TextStyle(fontSize: 15.sp,color: AppColors.whiteColor,fontWeight: FontWeight.bold)),
                      ],
                    ),),
                  ),

                ),
                SizedBox(height: 5.h,),
                Container(
                    width: Get.width*0.9,
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Text(homeController.review[index]['comment'],maxLines: 2,overflow: TextOverflow.ellipsis,)),

              ],
            )
        ),
      ),
    );
  }
}
