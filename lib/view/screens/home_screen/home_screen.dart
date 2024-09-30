import 'package:bn_en_trans/main.dart';
import 'package:bn_en_trans/utils/app_colors.dart';
import 'package:bn_en_trans/view/screens/home_screen/controller/home_controller.dart';
import 'package:bn_en_trans/view/widget/custom_button.dart';
import 'package:bn_en_trans/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../widget/custom_text_feild.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //============================Appbar Start Code=======================//
      appBar: AppBar(
        backgroundColor: AppColors.primaryClr,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => CustomText(
                  text: homeController.leftLanguage.value,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                )),
            SizedBox(
              width: 10.w,
            ),
            IconButton(
                onPressed: () {
                  homeController.swapLanguages();
                },
                icon: Icon(
                  Icons.swap_horiz_outlined,
                  color: AppColors.whiteClr,
                  size: 25.sp,
                )),
            SizedBox(
              width: 10.w,
            ),
            Obx(() => CustomText(
                  text: homeController.rightLanguage.value,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                )),
          ],
        ),
      ),

      //===========================Appbar Code End============================//
      body: Column(
        children: [
          customTextFeild(
              hintText: "Type Here...",
              maxLine: 8,
              onChanged: (val) {
                print("print home screen");
                homeController.inputText.value = val;
              }),
          customButton(
              title: "Translate",
              ontap: () {
                homeController.translate();
              }),
          SizedBox(
            height: 10.h,
          ),
           Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            height: 290.h,
            width: double.maxFinite,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(width: 2.w, color: AppColors.primaryClr)),
            child: Obx(
              () => Center(
                child: CustomText(
                  text: homeController.translatedText.value,
                  color: AppColors.blackClr,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
