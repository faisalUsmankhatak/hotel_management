

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:hotel_management/app_confiq/app_styles.dart';

import '../../app_confiq/app_colors.dart';
import '../../controller/filter_controller.dart';
import '../../controller/home_controller.dart';
import '../../controller/search_controller.dart';
import '../../widget/mybutton.dart';
import '../booking/cancel_booking_screen.dart';
import '../hotel_details/hotel_details_screen.dart';
class SearchHotelScreen extends StatelessWidget {
   SearchHotelScreen({Key? key}) : super(key: key);
  SearchController searchController=Get.put(SearchController());
   HomeController homeController=Get.put(HomeController());
   FilterController filterController=Get.put(FilterController());
   String? searchText;
   String? searchWord;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
    body: Obx(()=>
    searchController.searchText?.value==null?SizedBox():      Column(
        children: [
          SizedBox(
            height: 26.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // InkWell(
                //   onTap: () {
                //     Get.back();
                //   },
                //   child: Container(
                //     width: 24.w,
                //     height: 24.h,
                //     decoration: const BoxDecoration(
                //         image: DecorationImage(
                //             image: AssetImage('asset/icon/back.png'))),
                //   ),
                // ),
                // SizedBox(
                //   width: 20.h,
                // ),
                Text(
                  'Search',
                  style: AppStyles.appBarStyle,
                )
              ],
            ),
          ),
          SizedBox(
            height: 22.h,
          ),

          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 25.w),
            child: TextFormField(
              controller: searchController.searchController,
              onChanged: (value){
searchController.searchText?.value=value;
              },
              decoration: InputDecoration(
                  filled: true,
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: InkWell(
                      onTap: (){
                        bottomSheet();
                      },
                      child: Icon(Icons.filter_alt_outlined)),
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
            child:  searchController.isMenuButtonSelected.value!=5?
            Container(

              height: 30.h,
              child: ListView.separated(
                itemCount: searchController.searchMenuButtonLabel.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {

                  return InkWell(
                      onTap: (){
                        searchController.isMenuButtonSelected.value=index;
                      },
                      child: homePageMenuButton(searchController.searchMenuButtonLabel[index],searchController.isMenuButtonSelected.value,index));
               },  separatorBuilder: (context,index){
                return SizedBox(width: 10.w,);
              }, ),
            ):SizedBox(),

          ),
          SizedBox(height: 18.h,),
          Expanded(
            //height: 100.h,
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: homeController.allHotel.length,
                itemBuilder: (context,index){
                  searchText = searchController.searchController.text.toLowerCase();
         searchWord=         homeController.allHotel[index]['hotel_name'].toLowerCase();
                  print(searchText);
                  print(searchText);
    if(searchController.searchController.text.isEmpty){
                  return InkWell(
                      onTap: (){
                        Get.to(HotelDetailsScreen(hotel: homeController.allHotel[index]));
                      },
                      child: bookingListing(homeController.allHotel[index]));
                }else if(searchWord!.contains(searchText!)){
      return InkWell(
          onTap: (){
            Get.to(HotelDetailsScreen(hotel: homeController.allHotel[index]));
          },
          child: bookingListing(homeController.allHotel[index]));
    }else{return Container();}}, separatorBuilder: (BuildContext context, int index) {
                return     SizedBox(height: 12.h,);
              },
              )


          ),
        ],
      ),
    ),
    ));
  }
   Widget homePageMenuButton(String label,int index,int buttonIndexValue){
     return Chip(
         backgroundColor:buttonIndexValue==index?AppColors.greenGridientOneColor: Colors.transparent,
         shape: StadiumBorder(side: BorderSide(color: AppColors.greenGridientOneColor)
         ),
         padding: EdgeInsets.symmetric(horizontal: 10.w),
         label: Text(label,style: TextStyle(color:buttonIndexValue==index? AppColors.whiteColor:AppColors.greenGridientOneColor,fontSize: 15.sp,fontWeight: FontWeight.w700),));
   }

   Widget bookingListing(Map map){
     return    Card(
       child: Container(
         width: double.infinity,
   padding:  EdgeInsets.only(left: 20.w,right: 25.w,top: 12.h,bottom: 12.h),
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
                                       child: Text('PKR',style: TextStyle(fontSize: 8.sp,color: AppColors.greenGridientTowColor)),
                                     ),
                                     Text('9999',style: TextStyle(color: AppColors.greenGridientTowColor,fontSize: 14.sp),)
                                   ],
                                 ),
                                 Text('/per night',style: TextStyle(fontSize: 8.sp),)
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
                         child: Text(map['location'],style: TextStyle(color: AppColors.blackColor.withOpacity(0.8),fontSize: 10.sp,fontWeight: FontWeight.w400),),
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
                           Text('4.4',style: TextStyle(fontSize: 15.sp,color: AppColors.greenGridientTowColor,fontWeight: FontWeight.bold)),
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
   bottomSheet() {
     Get.bottomSheet(
         isScrollControlled: true,
         Card(
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
         height: 650.h,
         child: Column(crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             SizedBox(
               height: 20.h,
             ),
             Center(
               child: Container(
                 width: 50.w,
                 height: 3.sp,
                 decoration:
                 BoxDecoration(color: AppColors.blackColor.withOpacity(0.5)),
               ),
             ),
             SizedBox(
               height: 20.h,
             ),
             Center(child: Text('Filter Hotel',style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold),)),
             SizedBox(height: 20.h,),
             Padding(
               padding: EdgeInsets.only(left: 20.w, right: 20.w),
               child: Container(
                 height: 0.5.sp,
                 decoration:
                 BoxDecoration(color: AppColors.blackColor.withOpacity(0.5)),
               ),
             ),
             SizedBox(height: 20.h,),
             Padding(
               padding:  EdgeInsets.symmetric(horizontal: 20.w),
               child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children:  [
                   Text('Country',style: TextStyle(fontWeight: FontWeight.bold),),
                   InkWell(
                       onTap: (){

                       },
                       child: Text('Sell All',style: TextStyle(color: AppColors.greenGridientTowColor,fontWeight: FontWeight.bold),))
                 ],
               ),
             ),
             SizedBox(height: 20.h,),
             Obx(()=>
             filterController.countriesFilterIndex.value==5?SizedBox():         Container(
                 height: 40.h,
                 margin:   EdgeInsets.only(left: 20.w),

                 child: ListView.separated(
                   scrollDirection: Axis.horizontal,
                   shrinkWrap: true,
                     itemCount: filterController.countries.length,
                   itemBuilder: (context, index) {
                   return  InkWell(
                     onTap: (){
                       filterController.countriesFilterIndex.value=index;
                     },
                     child: Chip(

                      backgroundColor:filterController.countriesFilterIndex.value==index?AppColors.greenGridientTowColor:  Colors.transparent,
                         shape: StadiumBorder(side: BorderSide(color: AppColors.greenGridientOneColor)
                         ),
                         padding: EdgeInsets.symmetric(horizontal: 10.w),
                         label: Text(filterController.countries[index],style: TextStyle(color:filterController.countriesFilterIndex.value==index?AppColors.whiteColor:AppColors.greenGridientTowColor,fontSize: 15.sp,fontWeight: FontWeight.w700),)),
                   );
                 },separatorBuilder: (context,index){
return SizedBox(width: 5.w,);
                 },),
               ),
             ),
             SizedBox(height: 20.h,),
             Padding(
               padding:  EdgeInsets.symmetric(horizontal: 20.w),
               child: Row(mainAxisAlignment: MainAxisAlignment.start,
                 children:  [
                   Text('Sort Results',style: TextStyle(fontWeight: FontWeight.bold),),

                 ],
               ),
             ),
             SizedBox(height: 20.h,),
             Obx(()=>
             filterController.sortResultFilterIndex.value==5?SizedBox():         Container(
               height: 40.h,
               margin:   EdgeInsets.only(left: 20.w),

               child: ListView.separated(
                 scrollDirection: Axis.horizontal,
                 shrinkWrap: true,
                 itemCount: filterController.sortResult.length,
                 itemBuilder: (context, index) {
                   return  InkWell(
                     onTap: (){
                       filterController.sortResultFilterIndex.value=index;
                     },
                     child: Chip(

                         backgroundColor:filterController.sortResultFilterIndex.value==index?AppColors.greenGridientTowColor:  Colors.transparent,
                         shape: StadiumBorder(side: BorderSide(color: AppColors.greenGridientOneColor)
                         ),
                         padding: EdgeInsets.symmetric(horizontal: 10.w),
                         label: Text(filterController.sortResult[index],style: TextStyle(color:filterController.sortResultFilterIndex.value==index?AppColors.whiteColor:AppColors.greenGridientTowColor,fontSize: 15.sp,fontWeight: FontWeight.w700),)),
                   );
                 },separatorBuilder: (context,index){
                 return SizedBox(width: 5.w,);
               },),
             ),
             ),
             SizedBox(height: 20.h,),
             Padding(
               padding:  EdgeInsets.symmetric(horizontal: 20.w),
               child: Row(mainAxisAlignment: MainAxisAlignment.start,
                 children:  [
                   Text('Price Range Per Night',style: TextStyle(fontWeight: FontWeight.bold),),

                 ],
               ),
             ),
             SizedBox(height: 20.h,),
           Obx(()=>
           filterController.rangeValue.value.start==101?SizedBox():
           Padding(
             padding:  EdgeInsets.symmetric(horizontal: 5.w),
             child: RangeSlider(
                     max: 100,
                     min: 0,
                     divisions: 20,
                     labels: RangeLabels(

                       filterController.rangeValue.value.start.round().toString(),
                       filterController.rangeValue.value.end.round().toString(),
                     ),
                     values: filterController.rangeValue.value, onChanged: (value){
                   filterController.rangeValue.value=value;
                 }),
           ),
      ),
             SizedBox(height: 20.h,),
             Padding(
               padding:  EdgeInsets.symmetric(horizontal: 20.w),
               child: Row(mainAxisAlignment: MainAxisAlignment.start,
                 children:  [
                   Text('Star Rating',style: TextStyle(fontWeight: FontWeight.bold),),

                 ],
               ),
             ),
             SizedBox(height: 20.h,),
             Obx(()=>
             filterController.ratingIndex.value==8?SizedBox():         Container(
               height: 40.h,
               margin:   EdgeInsets.only(left: 15.w),

               child: ListView.separated(
                 scrollDirection: Axis.horizontal,
                 shrinkWrap: true,
                 itemCount: 5,
                 itemBuilder: (context, index) {
                   return  InkWell(
                     onTap: (){
                       filterController.ratingIndex.value=index;
                     },
                     child: Padding(
                       padding:  EdgeInsets.symmetric(horizontal: 5.w),
                       child: Chip(

                           backgroundColor:filterController.ratingIndex.value==index?AppColors.greenGridientTowColor:  Colors.transparent,
                           shape: StadiumBorder(side: BorderSide(color: AppColors.greenGridientOneColor)
                           ),
                           padding: EdgeInsets.symmetric(horizontal: 10.w),
                           label: Row(
                             children: [
                               Icon(Icons.star,size: 14.sp,color:filterController.ratingIndex.value==index?AppColors.whiteColor:  AppColors.greenGridientTowColor ),
                               SizedBox(width: 5.w,),
                               Text((5-index).toString(),style: TextStyle(color: filterController.ratingIndex.value==index?AppColors.whiteColor:  AppColors.greenGridientTowColor),)
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
             ),
             SizedBox(height: 20.h,),
             Padding(
               padding:  EdgeInsets.symmetric(horizontal: 20.w),
               child: Row(mainAxisAlignment: MainAxisAlignment.start,
                 children:  [
                   Text('Facilities',style: TextStyle(fontWeight: FontWeight.bold),),

                 ],
               ),
             ),
             SizedBox(height: 20.h,),
Obx(()=>Container(
  height: 30.h,

  margin: EdgeInsets.only(left: 20.w),
  child:   ListView(scrollDirection: Axis.horizontal,
    padding: EdgeInsets.zero,
      shrinkWrap: true,

      children: [

        InkWell(

            onTap: (){

              filterController.isWifi.value=!filterController.isWifi.value;

            },

            child: myCheckBox(label: 'Wifi',isCheck: filterController.isWifi.value,)),
        SizedBox(width: 20.w,),

        InkWell(

            onTap: (){

              filterController.isSwimmingPool.value=!filterController.isSwimmingPool.value;

            },

            child: myCheckBox(label: 'SwimmingPool',isCheck: filterController.isSwimmingPool.value,)),
SizedBox(width: 20.w,),
        InkWell(

            onTap: (){

              filterController.parking.value=!filterController.parking.value;

            },

            child: myCheckBox(label: 'Parking',isCheck: filterController.parking.value,))

      ],

    ),
),
),
             SizedBox(height: 20.h,),
             Padding(
               padding: EdgeInsets.only(left: 20.w, right: 20.w),
               child: Container(
                 height: 0.5.sp,
                 decoration:
                 BoxDecoration(color: AppColors.blackColor.withOpacity(0.5)),
               ),
             ),
             SizedBox(height: 20.h,),
             Padding(
               padding:  EdgeInsets.symmetric(horizontal: 20.w),
               child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   MyButton(buttonText: 'Reset',backgroundColor: AppColors.greenGridientTowColor.withOpacity(0.1),buttonTextColor: AppColors.greenGridientTowColor,width: 60.w,onTap: (){
                     Get.back();
                   }),
                   MyButton(buttonText: 'Apply Filter',width: 40.w),
                 ],
               ),
             )


           ],
         ),
       ),
     ));
   }
}
class myCheckBox extends StatelessWidget {
  bool isCheck;
  String label;
   myCheckBox({required this.isCheck,required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 20.w,
          height: 20.h,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.greenGridientTowColor,width: 2.sp),
            borderRadius: BorderRadius.circular(5.sp),
            color:isCheck?AppColors.greenGridientTowColor:Colors.transparent
          ),
          child: Center(child: Icon(Icons.done,color: AppColors.whiteColor,size: 13.sp),),
        ),
        SizedBox(width: 5.w,),
        Text(label)
      ],
    );
  }
}
