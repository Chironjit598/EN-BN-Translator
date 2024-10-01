import 'package:bn_en_trans/main.dart';
import 'package:bn_en_trans/utils/app_colors.dart';
import 'package:bn_en_trans/view/screens/home_screen/controller/home_controller.dart';
import 'package:bn_en_trans/view/widget/circle_button.dart';
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
        leading: Icon(
          Icons.menu,
          color: AppColors.whiteClr,
        ),
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

      body: SingleChildScrollView(
        child: Column(
          children: [
            //=========================user input TextField section==========================//
            Stack(
              children: [
                customTextFeild(
                    controller: homeController.userInputcontroller,
                    hintText: "Type Here...",
                    maxLine: 8,
                    onChanged: (val) {
                      print("print home screen");
                      homeController.inputText.value = val;
                    }),
                Positioned(
                    right: 20.w,
                    bottom: 20.h,
                    child: Row(
                      children: [
                        Obx(() {
                          return Visibility(
                            visible: homeController.inputText.value.isNotEmpty,
                            child: CircleButton(
                                icon: Icons.clear,
                                ontap: () {
                                  homeController.clearText();
                                }),
                          );
                        }),
                        Obx(() => IconButton(
                          icon: Icon(homeController.isListening.value ? Icons.mic : Icons.mic_none),
                          onPressed: homeController.isListening.value
                              ? homeController.stopListening
                              : () {

                            homeController.startListening(homeController.fromLanguage.value);
                          },
                        )),

                      ],
                    ))
              ],
            ),
            //==============================Translated Button==========================//

            customButton(
                title: "Translate",
                ontap: () {
                  homeController.translate();
                }),

            //===============================Translated Output Container=================//

            SizedBox(
              height: 10.h,
            ),
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  height: 290.h,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      border:
                          Border.all(width: 2.w, color: AppColors.primaryClr)),
                  child: Obx(
                    () => Center(
                      child: CustomText(
                        text: homeController.translatedText.value,
                        color: AppColors.blackClr,
                      ),
                    ),
                  ),
                ),
                Positioned(
                    bottom: 10.h,
                    right: 30.w,
                    child: Row(
                      children: [
                        //==========================Text to speak section===================//
                        Obx(
                          () => CircleButton(
                              ontap: () {
                                homeController.textToSpeach();
                              },
                              icon: homeController.isSpeaking.value
                                  ? Icons.volume_off
                                  : Icons.volume_up_outlined),
                        ),
                        CircleButton(icon: Icons.heart_broken),
                        CircleButton(
                            ontap: () {
                              homeController.shareTranslatedText();
                            },
                            icon: Icons.share),
                        //==========================Copy Clipboard section===================//
                        CircleButton(
                            ontap: () {
                              homeController.copyToClipboard();
                            },
                            icon: Icons.copy_all_outlined),
                      ],
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
