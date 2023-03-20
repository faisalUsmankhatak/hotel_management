import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hotel_management/screens/home_screen/see_all_rating_screen.dart';
import '../../app_confiq/app_colors.dart';
import '../../app_confiq/app_styles.dart';
import '../../controller/botom_bar_controller.dart';
import '../../controller/home_controller.dart';
import '../hotel_details/hotel_details_screen.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);
  HomeController homeController=Get.put(HomeController());
   BottomBarController bottomBarController=Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h,),
            // Padding(
            //     padding: EdgeInsets.symmetric(horizontal: 10.w),
            //     child: horizantalDivider()),
        SizedBox(height: 14.h,),

        Container(


          child:Row(
            children: [
              SizedBox(width: 25.w,),
              Container(
                width: 27.w,
                height: 27.h,
                decoration: BoxDecoration(
                  color: AppColors.greenGridientTowColor,
                  borderRadius: BorderRadius.circular(5.sp),
                ),
                child: Center(
                  child: Text('SBS',style: TextStyle(color: AppColors.whiteColor,fontSize: 10.sp,fontWeight: FontWeight.bold),),
                ),
              ),
              SizedBox(width: 8.sp,),
                Text('SBS Bookings',style: TextStyle(fontFamily:'Roboto-Regular',fontSize: 24.sp)),
           Expanded(child: SizedBox()),
              Container(
                width: 22.w,
                height: 22.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('asset/icon/notification.png')
                  )
                ),
              ),
              SizedBox(width: 13.w,),
              Container(
                width: 16.w,
                height: 18.h,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('asset/icon/black_like.png')
                    )
                ),
              ),
              SizedBox(width: 25.w,)
            ],
          ),
        ),
            SizedBox(height: 14.h,),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: horizantalDivider()),
            SizedBox(height: 18.h,),
            Padding(
                padding: EdgeInsets.only(left: 25.w),
                child: Text('Hello,Faisal',style: TextStyle(fontSize: 32.sp,color: AppColors.blackColor,fontWeight: FontWeight.bold),)),
        SizedBox(height: 23.h,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 25.w),
              child: TextFormField(
                onTap: (){
                bottomBarController.currentBNBIndex.value=1;
              },
                decoration: InputDecoration(
                  filled: true,
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.filter_alt_outlined),
                fillColor: AppColors.greenGridientTowColor.withOpacity(0.1),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.sp),
                    borderSide: BorderSide(color: AppColors.blackColor.withOpacity(0.2),width: 1.sp)
                ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.sp),
                        borderSide: BorderSide(color: AppColors.blackColor.withOpacity(0.2),width: 1.sp)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.sp,),
                      borderSide: BorderSide(color: AppColors.blackColor.withOpacity(0.2),width: 1.sp)
                    )
                ),
              ),
            ),
            SizedBox(height: 18.h,),
            Padding(
              padding:  EdgeInsets.only(left: 25.w),
              child: Obx(()=> homeController.isMenuButtonSelected.value!=5?
                 Container(

                  height: 30.h,
                  child: ListView.separated(
                    itemCount: homeController.homeMenuButtonLabel.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                    return InkWell(
                        onTap: (){
                         homeController.isMenuButtonSelected.value=index;
                        },
                        child: homePageMenuButton(homeController.homeMenuButtonLabel[index],homeController.isMenuButtonSelected.value,index));
                  },  separatorBuilder: (context,index){
                    return SizedBox(width: 10.w,);
    }, ),
                ):SizedBox(),
              ),
            ),
            SizedBox(height: 32.h,),
            Padding(
              padding:  EdgeInsets.only(left: 25.w),
              child: Container(
                height: 200.h,
                child: ListView.builder(
                    shrinkWrap: true,

                    itemCount: homeController.allHotel.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                  return InkWell(
                      onTap: (){
                        Get.to(HotelDetailsScreen(hotel: homeController.allHotel[index]));
                      },
                      child: allHotlHorizantalScrolling(homeController.allHotel[index]));
                })),
            ),
            SizedBox(height: 25.h,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 25.w),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 0.w),
                    child: Text('Bookings',style: AppStyles.smallHeading),
                  ),
                  InkWell(
                      onTap: (){

                      },
                      child:  Text('See All',style: AppStyles.textButtonStyle,))
                ],
              ),
            ),
            SizedBox(height: 15.h,),
         ListView.separated(
           shrinkWrap: true,

physics: const NeverScrollableScrollPhysics(),
           itemCount: homeController.allHotel.length,
           itemBuilder: (context,index){
           return bookingListing(homeController.allHotel[index]);
         }, separatorBuilder: (BuildContext context, int index) {
          return     SizedBox(height: 12.h,);
         },
         ),
        ]),
      )
    ));
  }
  Widget bookingListing(Map map){
    return    Padding(
      padding:  EdgeInsets.only(left: 20.w,right: 25.w),
      child: Container(
        width: double.infinity,

        child: Row(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(borderRadius: BorderRadius.circular(10.sp),
              child: Image.asset(map['image'][0],scale: 7.sp),
            ),

             SizedBox(width: 10.sp,),

            Flexible(

              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          padding: EdgeInsets.only(top: 3.h),
                          width: 90.w,

                          child: Text(map['hotel_name'],style: AppStyles.smallHeading,maxLines: 2,overflow: TextOverflow.ellipsis,)),

                      Row(
                        children: [
                          Container(
                            width: 60.w,

                            child: Column(crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding:  EdgeInsets.only(top: 5.sp),
                                      child: Text('PKR',style: TextStyle(fontSize: 8.sp,color: AppColors.greenGridientTowColor,fontFamily: 'Roboto-Regular')),
                                    ),
                                    Text('9999',style: AppStyles.textButtonStyle,)
                                  ],
                                ),
                                Text('/per night',style: TextStyle(fontSize: 8.sp,fontFamily: 'Roboto-Regular'),)
                              ],
                            ),
                          ),
                        ],
                      ),



                    ],
                  ),
                  SizedBox(height: 7.h,),
                  Row(
                    children: [
                      SizedBox(height: 10.h,),
                      Container(
                        width: 80.w,
                        child: Text(map['location'],style: TextStyle(color: AppColors.blackColor.withOpacity(0.8),fontSize: 10.sp,fontFamily: 'Roboto-Regular'),),
                      )
                    ],
                  ),
                  SizedBox(height: 7.h,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          RatingBarIndicator(
                            rating: 1,
                            itemBuilder: (context, index) => Icon(
                              Icons.star,
                              color: Color(0xffFFB02E),
                            ),
                            itemCount: 1,
                            itemSize: 15.0,
                            direction: Axis.horizontal,
                          ),
                          SizedBox(width: 3.w,),
                          Text('4.4',style: AppStyles.textButtonStyle),
                        ],
                      ),

                      Icon(Icons.favorite,color: AppColors.greenGridientTowColor,size: 15.sp,)


                    ],
                  ),

                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
  Widget horizantalDivider(){
    return Container(
      height: 1.h,
      color: AppColors.blackColor.withOpacity(0.2),
    );
  }
  Widget homePageMenuButton(String label,int index,int buttonIndexValue){
    return Chip(
      backgroundColor:buttonIndexValue==index?AppColors.greenGridientOneColor: Colors.transparent,
      shape: StadiumBorder(side: BorderSide(color: AppColors.greenGridientOneColor)
      ),
       // padding: EdgeInsets.symmetric(horizontal: 10.w),
        label: Text(label,style: TextStyle(color:buttonIndexValue==index? AppColors.whiteColor:AppColors.greenGridientOneColor,fontSize: 15.sp,fontFamily: 'Roboto-Regular'),));
  }
  Widget allHotlHorizantalScrolling(Map data){
    return Container(
      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(20.sp)
      ),
      margin: EdgeInsets.only(right: 15.w),
      width: 198.w,
      height: 200.h,
child: Stack(
  children: [
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.sp),
        image:DecorationImage(
          image: AssetImage(data['image'][0],),
          fit: BoxFit.cover
        )
      ),
    ),
    Positioned(
      top: 22.h,
      right: 24.w,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
        decoration:  BoxDecoration(

          borderRadius: BorderRadius.circular(20.sp),
         gradient: const LinearGradient(
           begin: Alignment.topLeft,
           end: Alignment.bottomRight,
             colors: [
               AppColors.greenGridientOneColor,
             AppColors.greenGridientTowColor,
             ]
         )
        ),
        child: Center(
          child: Row(mainAxisAlignment: MainAxisAlignment.center,
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
               Text('4.4',style: TextStyle(fontSize: 12.sp,color: AppColors.whiteColor,fontWeight: FontWeight.bold)),

            ],
          ),
        ),
      ),
    ),
    Positioned(
        top: 97.h,
        left: 10.w,
        child: Container(
width: 190.w,
          height: 90.h,
          decoration:  BoxDecoration(
            boxShadow: [

              BoxShadow(
                color: AppColors.blackColor.withOpacity(0.2),
                blurRadius: 10.sp,
                spreadRadius: 40.sp,
                offset: Offset(8, -50),

              )
            ]
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          Text(data['hotel_name'],style: TextStyle(color: AppColors.whiteColor,fontSize: 20.sp,fontWeight: FontWeight.bold),),
SizedBox(height: 8.h,),
Text(data['location'],style: TextStyle(color: AppColors.whiteColor,fontSize: 14.sp,fontWeight: FontWeight.w400),),
    SizedBox(height: 8.h,),
Row(
  children: [
    Text('PKR',style: TextStyle(color: AppColors.whiteColor,fontWeight: FontWeight.w700,fontSize: 18.sp),),
    Text(data['rent'],style: TextStyle(color: AppColors.whiteColor,fontWeight: FontWeight.w700,fontSize: 18.sp),),
    Text('/per night',style: TextStyle(color: AppColors.whiteColor.withOpacity(0.8),fontSize: 8.sp),),
Expanded(child: SizedBox()),
 Container(
   width: 18.w,
   height: 16.h,
   decoration: BoxDecoration(
     image: DecorationImage(
       image: AssetImage('asset/icon/white_like.png')
     )
   ),
 ),
    SizedBox(width: 15.w,)
  ],
)
      ],
    ),
        ))
  ],
),
    );
  }
}
