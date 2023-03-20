import 'package:flutter/material.dart';
import 'package:get/get.dart';
class FilterController extends GetxController{
  List<String> countries=['India','England','Pakistan','Dubai','France'];
  List<String> sortResult=['Highest Popularity','Highest Price','Lowest Price'];
  Rx<RangeValues> rangeValue= RangeValues(0, 100).obs;
  RxInt countriesFilterIndex=0.obs;
  RxInt sortResultFilterIndex=0.obs;
  RxInt ratingIndex=0.obs;
  RxBool isWifi=false.obs;
  RxBool isSwimmingPool=false.obs;
  RxBool parking=false.obs;
}