  /*
    ---------------------------------------
    Project: Bat and Brain Game Mobile Application
    Date: April 4, 2024
    Author: Ameer from Pakistan
    ---------------------------------------
    Description: result screen
  */
  import 'package:bat_and_mind/controller/quiz_controller.dart';
  import 'package:bat_and_mind/utils/extensions/extentions.dart';
  import 'package:bat_and_mind/utils/values/my_color.dart';
  import 'package:bat_and_mind/utils/values/style.dart';
  import 'package:bat_and_mind/views/menu/menu.dart';
  import 'package:bat_and_mind/widget/custom_app_bar.dart';
  import 'package:flutter/material.dart';
  import 'package:flutter_screenutil/flutter_screenutil.dart';
  import 'package:get/get.dart';
  import '../../widget/custom_button.dart';

  class ResultScreen extends StatelessWidget {
    final QuizController controller = Get.find();

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: MyColors.backGround,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomAppBar(title: "QUIZ"),
                  15.sbh,
                  Container(
                    height: 20.h,
                    color: MyColors.textColor,
                  ),
                  20.sbh,
                  Text(
                    "QUIZ COMPLETE",
                    style: kSize14DarkW400Text.copyWith(
                      color: MyColors.textColor,
                      fontSize: 40.sp,
                      shadows: [
                        Shadow(
                          offset: Offset(2.w, 2.h),
                          blurRadius: 2.r,
                          color: const Color.fromRGBO(51, 57, 20, 1),
                        ),
                      ],
                    ),
                  ),
                  20.sbh,
                  Text(
                    textAlign: TextAlign.center,
                    "SCORE:\n${controller.score.value}/${controller.questions.length}",
                    style: kSize14DarkW400Text.copyWith(
                      color: MyColors.textColor,
                      fontSize: 60.sp,
                      shadows: [
                        Shadow(
                          offset: Offset(2.w, 2.h),
                          blurRadius: 2.r,
                          color: const Color.fromRGBO(51, 57, 20, 1),
                        ),
                      ],
                    ),
                  ),
                  50.sbh,
                  CustomButton(
                    text: "MENU",
                    textStyle: kSize14DarkW400Text.copyWith(
                      fontSize: 32.sp,
                      color: MyColors.textColor,
                      shadows: [
                        Shadow(
                          offset: Offset(2.w, 2.h),
                          blurRadius: 2.r,
                          color: const Color.fromRGBO(51, 57, 20, 1),
                        ),
                      ],
                    ),
                    onPressed: () {
                      Get.offAll(() => Menu());
                    },
                  ),
                  26.sbh,
                  CustomButton(
                    text: "RETRY",
                    textStyle: kSize14DarkW400Text.copyWith(
                      fontSize: 32.sp,
                      color: MyColors.textColor,
                      shadows: [
                        Shadow(
                          offset: Offset(2.w, 2.h),
                          blurRadius: 2.r,
                          color: const Color.fromRGBO(51, 57, 20, 1),
                        ),
                      ],
                    ),
                    onPressed: () {
                      controller.resetQuiz();
                      Get.offAll(() => Menu());
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
