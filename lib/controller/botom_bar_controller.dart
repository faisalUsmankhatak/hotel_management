import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
class BottomBarController extends GetxController{
  ScrollController scrollController = ScrollController();
  RxInt currentBNBIndex = 0.obs;
  bool animateToTop = false;

  void indexChanged(int index) {
    currentBNBIndex.value = index;
    if(currentBNBIndex.value == 0) {
      if(animateToTop) {
        scrollController.animateTo(0, duration: const Duration(milliseconds: 500), curve:Curves.fastOutSlowIn);
      } else {
        animateToTop = true;
      }
    } else {
      animateToTop = false;
    }
  }
}