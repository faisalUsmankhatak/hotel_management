import 'package:flutter/material.dart';
import 'package:get/get.dart';
class IntroController extends GetxController{
  RxInt changeIntro=0.obs;
   List<Map> introScreenData=[
    {
      'image':'asset/images/intro1.png',
      'title':'Travel Safely Comfortably, & easily',
      'subtitle':'A hotel’s App is a key revenue channel for business. Without a strong online presence, '
    },
    {
      'image':'asset/images/intro2.png',
      'title':'Fine the best hotel for your vocations',
      'subtitle':'A hotel’s App is a key revenue channel for business. Without a strong online presence, '
    },
    {
      'image':'asset/images/intro3.png',
      'title':'Lets discover the world with us',
      'subtitle':'A hotel’s App is a key revenue channel for business. Without a strong online presence, '
    }
  ];
  void Function(int value){
  changeIntro.value=value;
  if(changeIntro.value<=3){

  }
}
}