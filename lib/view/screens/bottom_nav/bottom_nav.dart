import 'package:bn_en_trans/main.dart';
import 'package:bn_en_trans/utils/app_colors.dart';
import 'package:bn_en_trans/view/screens/favourite_screen/favourite_screen.dart';
import 'package:bn_en_trans/view/screens/history_screen/history_screen.dart';
import 'package:bn_en_trans/view/screens/home_screen/home_screen.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex=0;
  final List pages=[
    HomeScreen(),
    HistoryScreen(),
    FavouriteScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryClr,
      body: pages[currentIndex],

      bottomNavigationBar: BottomNavyBar(
        iconSize: 25.sp,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        backgroundColor: AppColors.primaryClr,
        selectedIndex: currentIndex,
        containerHeight: 50.h,
        itemPadding: EdgeInsets.symmetric(horizontal: 5.h),
        onItemSelected: (index){
          setState(() {
            currentIndex=index;

          });

        },
        items: [
          BottomNavyBarItem(
           activeColor: Colors.white,
              icon: Icon(Icons.home, color: AppColors.whiteClr,), title: Text("Home", style: TextStyle(
            color: AppColors.whiteClr,
          ),)),
          BottomNavyBarItem(
              activeColor: Colors.white,
              icon: Icon(Icons.history, color: AppColors.whiteClr,), title: Text("History", style: TextStyle(
            color: AppColors.whiteClr,
          ),)),

          BottomNavyBarItem(
              activeColor: Colors.white,
              icon: Icon(Icons.heart_broken, color: AppColors.whiteClr,), title: Text("Favourite", style: TextStyle(
            color: AppColors.whiteClr,
          ),)),
        ],

      )
    );
  }
}
