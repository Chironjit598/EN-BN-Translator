
import 'package:bn_en_trans/utils/app_colors.dart';
import 'package:bn_en_trans/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customButton({title, ontap}){
  return InkWell(
    onTap: ontap,
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 60.w
      ),
      width: double.maxFinite,
      height: 45.h,
      decoration: BoxDecoration(
        borderRadius:BorderRadius.circular(20.r),
        color: AppColors.primaryClr,
      ),
      child: Center(child: CustomText(
          text: title,
          fontSize: 16.sp,
        fontWeight: FontWeight.w600,

      )),
    ),
  );
}