import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/home_controller.dart';

class HotelImageGellaryScreen extends StatelessWidget {
   HotelImageGellaryScreen({Key? key}) : super(key: key);
  HomeController homeController=Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body:  Padding(
        padding: EdgeInsets.all(10.sp),
        child: Container
          (
          height: 1500,
          decoration: BoxDecoration(
            color: Colors.yellow,
          ),
          child: StaggeredGridView.count(

            crossAxisCount: 3,
            mainAxisSpacing: 3.0,
            crossAxisSpacing: 3.0,
            staggeredTiles: [
                  StaggeredTile.count(1,2),
              StaggeredTile.count(3, 2),
              StaggeredTile.count(3, 2),
              StaggeredTile.count(3, 3),


            ],

            children: <Widget>[
              myPhotoList(
                  homeController.allHotel[0]['image']),
              myPhotoList(
                  homeController.allHotel[1]['image']  ),
              myPhotoList(
                  homeController.allHotel[2]['image']),
              myPhotoList(
                  homeController.allHotel[3]['image']),



            ],
          ),
        ),
      ),


      )
    );
  }
   Widget myPhotoList(String img) {
     return Container(
width: Get.width,

       decoration: BoxDecoration( color: Colors.red,
         image: DecorationImage(
fit: BoxFit.cover,
           image: AssetImage(img!,),
         ),
       ),
     );
   }
}
