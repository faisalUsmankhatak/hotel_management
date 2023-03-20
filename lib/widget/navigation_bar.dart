import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';

import '../app_confiq/app_colors.dart';
import '../controller/botom_bar_controller.dart';
class BottomNavigateBar extends StatelessWidget {
  BottomBarController bottomController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetX<BottomBarController>(
        builder: (controller) {
          return  BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            currentIndex: controller.currentBNBIndex.value,
            onTap: controller.indexChanged,
            selectedItemColor: AppColors.greenGridientTowColor.withOpacity(1),
           // unselectedItemColor: AppColors.blackColor.withOpacity(1),
            selectedLabelStyle: const TextStyle(fontFamily: 'Roboto-Regular',),
            unselectedLabelStyle: const TextStyle(fontFamily: 'Roboto-Regular'),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon:
                // Icon(Icons.home),
                ImageIcon(

                 AssetImage("asset/icon/home.png"),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon:
                // Icon(Icons.home),
                ImageIcon(

                  AssetImage("asset/icon/search.png"),
                ),
                label: 'Search',

              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("asset/icon/save.png"),
                ),
                label: 'Save',
              ),

              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("asset/icon/booking.png"),
                ),
                label: 'Booking',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("asset/icon/profile.png"),
                ),
                label: 'Account',
              ),

              // BottomNavigationBarItem(
              //   icon: ImageIcon(
              //     AssetImage("assets/navigation_bar_icon/menu.png"),
              //   ),
              //   label: 'Menu',
              // ),
            ],
          );
        }
    );
  }
}