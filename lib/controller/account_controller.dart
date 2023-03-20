import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
class AccountController extends GetxController{
  File? fileImage;
 late Uint8List froFileImageBytes;
  String base64string='';
  RxString imagePath=''.obs;
  RxBool isOnNotification=false.obs;
  RxBool isOnSound=false.obs;
  RxBool isVibrate=false.obs;
  RxBool isAppUpdates=false.obs;
  RxBool isNewServiceAvailable=false.obs;
  RxBool isNewTipsAvailable=false.obs;
}