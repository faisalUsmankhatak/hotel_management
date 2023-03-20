import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_management/screens/booking/booking_screen.dart';
import 'package:hotel_management/screens/save_booking/save_booking_screen.dart';
import 'package:hotel_management/screens/search/search_hotel_screen.dart';

import '../controller/botom_bar_controller.dart';
import '../widget/navigation_bar.dart';
import 'home_screen/home_screen.dart';
import 'home_screen/profile_screen.dart';
class BottomNavigationBarScreen extends StatelessWidget {
   BottomNavigationBarScreen({Key? key}) : super(key: key);
  int i=1;
  RxBool progressing = false.obs;
  BottomBarController bottomBarController=Get.put(BottomBarController());

  final List _tabs = [
    HomeScreen(),
    SearchHotelScreen(),
    SaveBookingScreen(),
    BookingScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Obx(
              () => progressing.value
              ? const Center(child: CircularProgressIndicator(),)
              : _tabs[bottomBarController.currentBNBIndex.value]
      ),
        bottomNavigationBar: BottomNavigateBar(),
    ));
  }
}
