  /*
          ---------------------------------------
          Project: Bat and Brain Game Mobile Application
          Date: April 4, 2024
          Author: Ameer from Pakistan
          ---------------------------------------
          Description: player screen UI
        */
  import 'package:bat_and_mind/controller/players_controller.dart';
  import 'package:bat_and_mind/utils/extensions/extentions.dart';
  import 'package:flutter/material.dart';
  import 'package:get/get.dart';
  import '../../utils/values/my_color.dart';
  import '../../utils/values/style.dart';
  import 'package:flutter_screenutil/flutter_screenutil.dart';
  import '../../widget/custom_app_bar.dart';

  class PlayersScreen extends StatelessWidget {
    final PlayerController controller = Get.find();
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: MyColors.backGround,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              45.sbh,
              CustomAppBar(
                title: "Players",
              ),
              10.sbh,
              Container(
                height: 20.h,
                color: MyColors.textColor,
              ),
              15.sbh,
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: Stack(
                  children: [
                    // Main PageView
                    PageView.builder(
                      controller: controller.pageController,
                      onPageChanged: (index) {
                        controller.currentPage.value = index;
                      },
                      itemCount: controller.matches.length,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final match = controller.matches[index];
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                match["title"]!,
                                textAlign: TextAlign.center,
                                style: kSize14DarkW400Text.copyWith(
                                  fontSize: 32.sp,
                                  color: MyColors.textColor,
                                ),
                              ),
                              10.sbh,
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10.r),
                                child: Image.asset(
                                  match["image"]!,
                                  height: 108.h,
                                  width: 208.w,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              30.sbh,
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Text(
                                    match["story"]!,
                                    textAlign: TextAlign.center,
                                    style: kSize14DarkW400Text.copyWith(
                                      fontSize: 32.sp,
                                      color: MyColors.textColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),

                    // Navigation Arrows
                    Positioned(
                      left: 0,
                      top: 0,
                      bottom: 450,
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            if (controller.currentPage.value > 0) {
                              controller.pageController.previousPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.all(8.r),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: Icon(
                              Icons.keyboard_double_arrow_left_rounded,
                              color: Color(0xFFEBB95A),
                              size: 40.sp,
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Right arrow
                    Positioned(
                      right: 0,
                      top: 0,
                      bottom: 450,
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            if (controller.currentPage.value < controller.matches.length - 1) {
                              controller.pageController.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.all(8.r),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: Transform.rotate(
                              angle: 3.14159, // 180 degrees in radians
                              child: Icon(
                                Icons.keyboard_double_arrow_left_rounded,
                                color: Color(0xFFEBB95A),  // Golden color like in the image
                                size: 40.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      );
    }
  }