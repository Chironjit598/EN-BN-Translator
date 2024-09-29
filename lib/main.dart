import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'core/app_routes.dart';

void main() {
  runApp(const Translator());
}

class Translator extends StatelessWidget {
  const Translator({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_ , child){
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          getPages: AppRoute.routes,
          initialRoute: AppRoute.splashScreen,
        );
      },
    );

  }
}
