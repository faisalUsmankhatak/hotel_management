import 'package:flutter/material.dart';
import 'package:get/get.dart';
class AuthController extends GetxController{
  RxBool hasEmailFocus=false.obs;
  RxBool isRememberMe=false.obs;
  RxBool isClickSMSButton=false.obs;
  RxBool isClickEmailButton=false.obs;
  RxBool isVisibleSignUpPassword=false.obs;
  RxBool isVisibleSignUpConfirmPassword=false.obs;
  RxBool isVisibleSignInPassword=false.obs;
  List<Map> resetPasswordData=[
    {
      'whichReset':'via SMS',
      'data':'+9203****23',
      'image':'asset/icon/sms.png'
    },
    {
      'whichReset':'via Email',
      'data':'faisal***495@gmail.com',
      'image':'asset/icon/resetEmail.png'
    }
  ];
  TextEditingController firstValue=TextEditingController();
  TextEditingController secondValue=TextEditingController();
  TextEditingController thirdValue=TextEditingController();
  TextEditingController fourthValue=TextEditingController();

  FocusNode firstValueFocusNode=FocusNode();
  FocusNode secondValueFocusNode=FocusNode();
  FocusNode thirdValueFocusNode=FocusNode();
  FocusNode fourthValueFocusNode=FocusNode();

  FocusNode firstValueFocusNodeListener=FocusNode();
  FocusNode secondValueFocusNodeListener=FocusNode();
FocusNode thirdValueFocusNodeListener=FocusNode();
FocusNode fourthValueFocusNodeListener=FocusNode();

bool isActiveNewPassword=false;


}