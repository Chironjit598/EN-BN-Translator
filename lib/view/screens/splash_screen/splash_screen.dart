import 'package:bn_en_trans/core/app_routes.dart';
import 'package:bn_en_trans/utils/app_colors.dart';
import 'package:bn_en_trans/utils/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 03), ()=>Get.offAllNamed(AppRoute.bottomNav));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryClr,
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.r),
            child: Image.asset(AppImage.appLogo, height: 200.h, width: 200.w,)),
      ),

    );
  }
}
