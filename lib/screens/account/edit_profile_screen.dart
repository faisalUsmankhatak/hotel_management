import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hotel_management/widget/mybutton.dart';
import 'package:country_list_pick/country_list_pick.dart';
import '../../app_confiq/app_colors.dart';
import '../../widget/form_text_field.dart';
class EditProfileScreen extends StatelessWidget {
   EditProfileScreen({Key? key}) : super(key: key);
TextEditingController phoneController=TextEditingController(text: '+92');
  @override
  Widget build(BuildContext context) {

    return SafeArea(child: Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 26.h,
            ),
            Row(
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
                  'Edit Profile',
                  style: TextStyle(
                      color: AppColors.blackColor.withOpacity(0.8),
                      fontSize: 22.sp),
                )
              ],
            ),
            SizedBox(
              height: 22.h,
            ),

            SizedBox(height: 30.h,),
            FormTextField(label: 'Name',),
            SizedBox(height: 18.h,),

            FormTextField(label: 'Email',),
            SizedBox(height: 18.h,),

            TextFormField(
              keyboardType: TextInputType.phone,
              // controller: controller,
              // onChanged: onChanged,
              // maxLines:maxLines??1 ,

              style: TextStyle(
                  fontSize: 12.sp,
                  color: AppColors.blackColor
              ),

              decoration: InputDecoration(

                fillColor: Color(0xffF7F5FF),
                filled: true,

                prefixIcon:
                Container(
                  margin: EdgeInsets.only(left: 2.w,right: 3),
                  padding: EdgeInsets.only(top: 5,right: 5,bottom: 5,left: 5),
                  width: 66.w,
                  height: 30.h,

                  child: Row(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 30.w,
                        height: 30.h,

                        decoration: BoxDecoration(
                          color: Colors.yellow,

                        ),
                        child: Image.asset('asset/images/pakistan.png'!,fit: BoxFit.cover),
                      ),SizedBox(width: 1.w,),
                      Text('+92')

                    ],
                  ),
                ),
                // suffixIcon: suffixIcon,,
                // suffixIcon: suffixIcon,

                label: Text('Phone',),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                    borderSide: BorderSide(color:AppColors.blackColor.withOpacity(0.3) )

                ),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                    borderSide: BorderSide(color:AppColors.blackColor.withOpacity(0.3) )

                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                    borderSide: BorderSide(color:AppColors.greenGridientTowColor )

                ),

              ),
            ),

          // FormTextField(label: 'Phone',preFixIcon: 'asset/images/pakistan.png',onChanged: (value){
          //   print(value);
          // }),
          // Row(
          //   children: [
          //     Flexible(
          //
          //       child: FormTextField(
          //         controller: phoneController.value,
          //         label: '',preFixIcon:    SizedBox(
          //
          //       child: CountryListPick(
          //
          //
          //         // if you need custome picker use this
          //         // pickerBuilder: (context, CountryCode countryCode){
          //         //   return Row(
          //         //     children: [
          //         //       Image.asset(
          //         //         countryCode.flagUri,
          //         //         package: 'country_list_pick',
          //         //       ),
          //         //       Text(countryCode.code),
          //         //       Text(countryCode.dialCode),
          //         //     ],
          //         //   );
          //         // },
          //
          //         // To disable option set to false
          //           theme: CountryTheme(
          //             isShowFlag: true,
          //             isShowTitle: false,
          //             isShowCode: false,
          //             isDownIcon: true,
          //             showEnglishName: false,
          //           ),
          //           // Set default value
          //           initialSelection: '+92',
          //           // or
          //           // initialSelection: 'US'
          //           onChanged: (value) {
          //             phoneController.value.text=value!.code.toString();
          //             print(value!.name.toString());
          //             print(value!.code.toString());
          //             print(value!.dialCode);
          //             print(value!.flagUri);
          //           },
          //           // Whether to allow the widget to set a custom UI overlay
          //           useUiOverlay: true,
          //           // Whether the country list should be wrapped in a SafeArea
          //           useSafeArea: false
          //       ),
          //     ),),)
          //
          //  //   Flexible(child: FormTextField(label: 'Phone',),)
          //   ],
          // ),
            SizedBox(height: 18.h,),

            FormTextField(label: 'City',),
            SizedBox(height: 30.h,),
            MyButton(buttonText: 'Update',height: 40.h,)
          ],
        ),
      ),
    ));
  }
}
