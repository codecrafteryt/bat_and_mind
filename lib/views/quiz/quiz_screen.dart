/*
      ---------------------------------------
      Project: Crick trivia Game Mobile Application
      Date: April 2, 2024
      Author: Ameer from Pakistan
      ---------------------------------------
      Description: Quiz Screen UI
    */
import 'package:bat_and_mind/controller/quiz_controller.dart';
import 'package:bat_and_mind/utils/extensions/extentions.dart';
import 'package:bat_and_mind/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../utils/values/my_color.dart' show MyColors;
import '../../utils/values/style.dart';

class QuizScreen extends StatelessWidget {
  final QuizController quizController = Get.find();
  QuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backGround,
      body: SafeArea(
          child: Obx(() => Column(
            children: [
              CustomAppBar(
                title: "QUIZ",
              ),
              15.sbh,
              Container(
                height: 20.h,
                color: MyColors.textColor,
              ),
              20.sbh,
              Container(
                  width: 350.w,
                  height: 400.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32.r),
                    border: Border.all(
                      color: MyColors.textColor,
                      width: 13.w,
                    ),
                    image: DecorationImage(
                      image: AssetImage('assets/images/bat.png'),
                      fit: BoxFit.contain,
                      opacity: 0.3,
                    ),
                  ),
                  child: Column(
                    children: [
                      20.sbh,
                      Expanded(
                        child:  Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                          child: Text(
                              quizController.questions[quizController.currentQuestionIndex.value].question,
                              textAlign: TextAlign.center,
                              style: kSize14DarkW400Text.copyWith(
                                fontSize: 40.sp,
                                color: MyColors.textColor,
                                shadows: [
                                  Shadow(
                                    offset: Offset(2.w, 2.h),
                                    blurRadius: 2.r,
                                    color: const Color.fromRGBO(51, 57, 20, 1),
                                  ),
                                ],
                              ),
                            ),
                        ),
                      ),
                    ],
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: quizController.questions[quizController.currentQuestionIndex.value].options.length,
                  separatorBuilder: (context, index) => SizedBox(height: 16),
                  itemBuilder: (context, index) => _buildAnswerOption(index, quizController),
                ),
              ),
            ],
          )),
        ),
    );
  }

  Widget _buildAnswerOption(int index, QuizController controller) {
    return Obx(() {
      bool isSelected = controller.selectedAnswerIndex.value == index;
      bool isCorrect = controller.questions[controller.currentQuestionIndex.value].correctAnswerIndex == index;
      // Apply color logic to border
      Color borderColor = isSelected
          ? (isCorrect ? Colors.green : Color.fromRGBO(242, 126, 58, 1))
          : (controller.isAnswered.value && isCorrect ? Colors.green : MyColors.btnBorderColor);

      return GestureDetector(
        onTap: () {
          if (!controller.isAnswered.value) {
            controller.answerQuestion(index);
          }
        },
        child: Container(
          height: 83.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: MyColors.btnColor,
            borderRadius: BorderRadius.circular(30.r),
            border: Border.all(
              color: borderColor,
              width: 9.w,
            ),
          ),
          child: Center(
            child: Text(
              controller.questions[controller.currentQuestionIndex.value].options[index],
              textAlign: TextAlign.center,
              style: kSize14DarkW400Text.copyWith(
                fontSize: 32.sp,
                color: MyColors.textColor,
                shadows: [
                  Shadow(
                    offset: Offset(3.w, 3.h),
                    blurRadius: 3.r,
                    color: const Color.fromRGBO(51, 57, 20, 1),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}