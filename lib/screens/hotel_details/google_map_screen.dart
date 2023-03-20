import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../app_confiq/app_colors.dart';
class GoogleMapScreen extends StatefulWidget {
  Map<String,dynamic> mapLocation;
   GoogleMapScreen({required this.mapLocation});

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  late CameraPosition position;

  Completer<GoogleMapController> completer=Completer();

  List<Marker> _marker=[] ;

  List<Marker> _list=[] ;

  @override
  void initState() {
    // TODO: implement initState
    position=  CameraPosition(target:LatLng(widget.mapLocation!['lat'],widget.mapLocation!['lang']),
        zoom: 14
    );
    _list=[
      Marker(markerId: MarkerId('1'),
          position: LatLng(widget.mapLocation!['lat'],widget.mapLocation!['lang']),
          infoWindow: InfoWindow(
              title: widget.mapLocation!['hotel_name']
          )
      )
    ];
    _marker.addAll(_list);


  }

  @override
  Widget build(BuildContext context) {

    return  SafeArea(child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 26.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
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
                    'Google Map',
                    style: TextStyle(
                        color: AppColors.blackColor.withOpacity(0.8),
                        fontSize: 22.sp),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 22.h,
            ),
            Expanded(
              child: GoogleMap(
                initialCameraPosition: position,
                mapType: MapType.normal,

onMapCreated: (GoogleMapController controller){
  completer.complete(controller);

},
              //  onMapCreated:onCreated(),
                markers: _marker.toSet(),
              ),
            ),
          ],
        )
    )
    );
  }
}
