/*
        ---------------------------------------
        Project: Crick trivia Game Mobile Application
        Date: April 4, 2024
        Author: Ameer from Pakistan
        ---------------------------------------
        Description: splash screen
      */
import 'dart:async';
import 'package:bat_and_mind/utils/extensions/extentions.dart';
import 'package:bat_and_mind/utils/values/my_color.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import '../../utils/values/style.dart';
import 'menu.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double progress = 0.0;

  @override
  void initState() {
    super.initState();
    _startProgress();
  }

  void _startProgress() {
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (progress < 1.0) {
        setState(() {
          progress += 0.05;
        });
      } else {
        timer.cancel();
        Future.delayed(const Duration(milliseconds: 200), () {
          if (mounted) {
           Get.to(() => Menu());
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backGround,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 308.w,
              height: 329.h,
            ),
            12.sbh,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  "Bat & Brain",
                  textAlign: TextAlign.center,
                  style: kSize11DarkW500Text.copyWith(
                    color: MyColors.textColor,
                    fontSize: 64,
                    shadows: [
                      Shadow(
                        offset: Offset(8.w, 8.h),
                        blurRadius: 8.r,
                        color: const Color.fromRGBO(51, 57, 20, 1),
                      ),
                    ],
                  )
              ),
            ),
            91.sbh,
            Stack(
              alignment: Alignment.center,
              children: [
                const SpinKitCircle(
                  color: const Color.fromRGBO(7, 111, 93, 1),
                  size: 100.0,
                ),
              ],
            ),
          ],
        ),
    );
  }
}