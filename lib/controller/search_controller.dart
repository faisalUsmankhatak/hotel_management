import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SearchController extends GetxController{
  RxInt isMenuButtonSelected=0.obs;
  List<String> searchMenuButtonLabel=['All Hotel','Recommended','Popular','Trending'];
  List<String> filterList=[];
  TextEditingController searchController=TextEditingController();
  RxString? searchText=''.obs;

}