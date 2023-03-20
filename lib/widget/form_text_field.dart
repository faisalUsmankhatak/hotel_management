import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_confiq/app_colors.dart';
class FormTextField extends StatelessWidget {
  String label;
  String? suffixIcon;
  int? maxLines;
  double? radius;
  bool? obscureText;
  Function()? onSuffixIconTap;
  TextEditingController? controller;
//Widget? suffixIcon;
  ValueChanged<String>? onChanged;
   FormTextField({required this.label,this.maxLines,this.radius,this.onChanged,this.controller,this.suffixIcon,this.onSuffixIconTap,this.obscureText}) ;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
controller: controller,
      onChanged: onChanged,
      maxLines:maxLines??1 ,
      style: TextStyle(
        fontSize: 12.sp,
        color: AppColors.blackColor
      ),
obscureText: obscureText??false,
      decoration: InputDecoration(

        fillColor: Color(0xffF7F5FF),
        filled: true,

        suffixIcon:suffixIcon==null?SizedBox(width: 1.w,):

                    InkWell(
                      onTap: onSuffixIconTap,
                      child: Container(
width: 2.w,
                        height: 2.h,

                        decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(suffixIcon!)
                        )
                        ),

                          ),
                    ),



        // suffixIcon: suffixIcon,,
        // suffixIcon: suffixIcon,
        label: Text(label,),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius??10.sp),
          borderSide: BorderSide(color:AppColors.blackColor.withOpacity(0.3) )

        ),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius??10.sp),
            borderSide: BorderSide(color:AppColors.blackColor.withOpacity(0.3) )

        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius??10.sp),
            borderSide: BorderSide(color:AppColors.greenGridientTowColor )

        ),
        
      ),
    );
  }
}
