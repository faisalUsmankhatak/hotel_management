import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hotel_management/app_confiq/app_styles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../app_confiq/app_colors.dart';
import '../../controller/bookings_controller.dart';
import '../../controller/home_controller.dart';
import '../../widget/mybutton.dart';
import '../home_screen/see_all_rating_screen.dart';
import '../home_screen/selectRooms.dart';
import 'google_map_screen.dart';
import 'hotel_gallery.dart';

class HotelDetailsScreen extends StatefulWidget {
  Map? hotel;

  HotelDetailsScreen({Key? key, required this.hotel}) : super(key: key);

  @override
  State<HotelDetailsScreen> createState() => _HotelDetailsScreenState();
}

class _HotelDetailsScreenState extends State<HotelDetailsScreen> {
  BookingController bookingController = Get.put(BookingController());
  HomeController homeController=Get.find();
  late CameraPosition position;
  Completer<GoogleMapController> _completer=Completer();
 List<Marker> _marker=[] ;
  List<Marker> _list=[] ;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    position=  CameraPosition(target:LatLng(widget.hotel!['lat'],widget.hotel!['lang']),
      zoom: 14
    );
    _list=[
    Marker(markerId: MarkerId('123'),
        position: LatLng(widget.hotel!['lat'],widget.hotel!['lang']),
      infoWindow: InfoWindow(
        title: widget.hotel!['hotel_name']
      )
    )
    ];
_marker.addAll(_list);
    bookingController.start = bookingController.myDateRange!.start;
    bookingController.end = bookingController.myDateRange!.end;
    print('defrence ${bookingController.myDateRange!.end.difference(bookingController.myDateRange!.start).inDays}');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          floatingActionButtonLocation:FloatingActionButtonLocation.centerDocked ,
          floatingActionButton: Card(
            margin: EdgeInsets.zero,
elevation: 10.sp,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.sp),

            ),
            child: Container(

              height: 70.h,
decoration: BoxDecoration(

   borderRadius: BorderRadius.circular(10.sp)
),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RichText(text: TextSpan(
                    text: widget.hotel!['rent'],
                    style: TextStyle(
                      color: AppColors.greenGridientTowColor,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w700,
                    ),
                    children: [
                      TextSpan(text:'/night', style: TextStyle(color: AppColors.blackColor.withOpacity(0.7), fontSize: 10.sp))
                    ]
                  ),

                  ),
                  MyButton( buttonText: 'Select Rooms',
width: 50,
                      height: 45,
                      onTap: (){
                    Get.to(SelectRooms(hotel: widget.hotel,));
                  }),
                ],
              ),
            ),
          ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(
            //   height: 10.h,
            // ),

            Obx(()=>Container(
                width: Get.width,
               // height: 100.h,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CarouselSlider.builder(

                      itemCount: widget.hotel!['image'].length,
                      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
                          Container(
                            width: Get.width,
                       //    height: 250.h,
                           decoration: BoxDecoration(
                             color: Colors.yellow,
                             image: DecorationImage(
                               fit: BoxFit.cover,
                               image: AssetImage(widget.hotel!['image'][itemIndex],)
                             )
                           ),
                          ),
                      options: CarouselOptions(
                      autoPlay: true,
                      initialPage: 0,
                        height: 200.h,
onPageChanged: (index,reson){
homeController.currentHotelImage.value=index;
},
                          enlargeCenterPage: true,
                        viewportFraction: 100

                    ),
                    ),
                 Padding(
                   padding:  EdgeInsets.all(8.sp),
                   child: AnimatedSmoothIndicator(
effect:  const SlideEffect(
    // spacing:  8.0,
    // radius:  4.0,
    dotWidth:  10.0,
    dotHeight:  10.0,
    paintStyle:  PaintingStyle.stroke,
    strokeWidth:  1.5,
    dotColor:  AppColors.greenGridientTowColor,
    activeDotColor:  AppColors.greenGridientTowColor
),
                       activeIndex: homeController.currentHotelImage.value, count: widget.hotel!['image'].length),
                 )
                  ],
                ),
              ),
            ),

            SizedBox(
              height: 18.h,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15.w),
              child: Text(
                widget.hotel!['hotel_name']!,
                style: AppStyles.appHeadingStyle
              ),
            ),
            SizedBox(height: 18.h,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15.w),
              child: horizantalDivider(),
            ),
            SizedBox(height: 18.h,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                'Gallery Photos',
                  style: AppStyles.appHeadingStyle
                ),
                InkWell(
                    onTap: (){
                    Get.to(HotelGalleryScreen(hotelImages: widget.hotel!['image'],));
                    },
                    child: Text('See All',style: TextStyle(color: AppColors.greenGridientTowColor),))
              ],
            ),
          ),
          SizedBox(height: 10.h,),
          Container(
            height: 80.h,
            padding:  EdgeInsets.symmetric(horizontal: 15.w),
            child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
              return Container(
                width: 120.w,
                height: 50.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.sp),
                  child: Image.asset(widget.hotel!['image'][index],fit: BoxFit.cover),
                ),
              );
            }, separatorBuilder: (context,index){
              return SizedBox(width: 7.w,);
            }, itemCount:widget.hotel!['image'].length),
          ),
          SizedBox(height: 18.h,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 15.w),
            child: Text("Details",style: AppStyles.appHeadingStyle,),
          ),
          SizedBox(height: 10.h,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text('Hotels',style: AppStyles.smallTextStyle,)
                  ],
                ),
                Column(
                  children: [
                    Text('4 Bedrooms',style: AppStyles.smallTextStyle)
                  ],
                ),
                Column(
                  children: [
                    Text('2 Bathrooms',style: AppStyles.smallTextStyle)
                  ],
                ),
                Column(
                  children: [
                    Text('400 sqft',style: AppStyles.smallTextStyle)
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 18.h,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15.w),
              child: Text("Description",style: AppStyles.appHeadingStyle,),
            ),
          SizedBox(height: 10.h,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 15.w),
            child: Container(
              width: Get.width,
              child: Text(
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  'Situated in Islamabad, 10 km from Shah Faisal Mosque, Hotel Margala '
                  'features accommodation with a fitness '
                  'centre, free private parking, a garden and a terrace. Excellent service great hospitality',
                  style: AppStyles.smallTextStyle),
            ),
          ),
          SizedBox(height: 18.h,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15.w),
              child: Text("Facilites",style: AppStyles.appHeadingStyle,),
            ),
          SizedBox(height: 10.h,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 15.w),
            child: Wrap(
              spacing: 20.sp,
             runSpacing: 20.sp,
              children: [
                Facilities(icon:Icons.pool ,label:'Swimming Poot' ,),
                Facilities(icon:Icons.wifi ,label:'Wifi' ,),
                Facilities(icon:Icons.restaurant_menu ,label:'Restaurant' ,),
                Facilities(icon:Icons.local_parking ,label:'Parking' ,),
                Facilities(icon:Icons.meeting_room ,label:'Meeting Room' ,),
                Facilities(icon:Icons.elevator ,label:'Elevator' ,),
                Facilities(icon:Icons.fitness_center ,label:'Fitness Center' ,),
                Facilities(icon:Icons.hourglass_full ,label:'24-hours open' ,),

              ],
            ),
          ),
          SizedBox(height: 55.h,),
            Stack(
              children: [
                SizedBox(
                    height: 140.h,
                    child: GoogleMap(initialCameraPosition: position,
                     // myLocationEnabled: true,
mapToolbarEnabled: false,
                    buildingsEnabled: false,
                    //compassEnabled: false,
                   // myLocationEnabled: true,
                   // indoorViewEnabled: true,
                    liteModeEnabled: true,
                    markers:_marker.toSet(),
                      onMapCreated:(GoogleMapController controller){
_completer.complete(controller);

                      },
                    ),

                ),
                Positioned(
                    bottom: 0,
                    right: 5.sp,
                    child: InkWell(
                      onTap: (){
                        Map<String,dynamic> map={"lat":widget.hotel!['lat'],"lang":widget.hotel!['lang'],"hotel_name":widget.hotel!['hotel_name']};
                       Get.to(GoogleMapScreen(mapLocation:map ,)) ;
                      },
                      child: const Card(

                          child: Text('Show Full Map',style: TextStyle(color: AppColors.blackColor),)),
                    ))
              ],
            ),
            SizedBox(height: 18.h,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                children: [
                  Text("Review",style:  AppStyles.appHeadingStyle,),
                  SizedBox(width: 10.w,),
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
                  Expanded(child: SizedBox()),
                  InkWell(
                      onTap: (){
                        Get.to(SeeAllRatingScreen());
                      },
                      child: Text('See All',style: AppStyles.textButtonStyle)),

                ],
              ),
            ),
          SizedBox(height: 18.h,),

          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
              itemCount: 4,
              shrinkWrap: true,
              itemBuilder: (context,index){
                return Review(map: homeController.review[index]);

              }, separatorBuilder: (context,index){
                return SizedBox(height: 7.h,);
          }, ),





          SizedBox(height: 100.h,),

          ],
        ),
      ),
    ));
  }

  Widget horizantalDivider() {
    return Container(
      height: 1.sp,
      color: AppColors.blackColor.withOpacity(0.3),
    );
  }


}
class Review extends StatelessWidget {
  Map map;
   Review({Key? key,required this.map}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
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
                  backgroundImage:AssetImage(map['image']) ,
                ),
                  title: Text(map['name']!,),
                  subtitle: Text(map['date']!),
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
                        Text('4.4',style: TextStyle(fontSize: 15.sp,color: AppColors.whiteColor,fontWeight: FontWeight.bold)),
                      ],
                    ),),
                  ),

                ),
                SizedBox(height: 5.h,),
                Container(
                    width: Get.width*0.9,
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Text(map['comment'],maxLines: 2,overflow: TextOverflow.ellipsis,)),

              ],
            )
        ),
      ),
    );
  }
}

class Facilities extends StatelessWidget {
String label;
IconData? icon;
   Facilities({Key? key,required this.label,required this.icon});

  @override
  Widget build(BuildContext context) {

    return  Column(
      children: [
        Container(
          width: 30.w,
          height: 30.h,
          child: Icon(icon,color: AppColors.greenGridientTowColor),
        ),
        SizedBox(height: 5.h,),
        Text(label,style: TextStyle(fontSize: 10.sp,fontFamily: 'Roboto-Regular'),)
      ],
    );
  }
}
