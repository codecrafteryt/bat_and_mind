import 'package:bat_and_mind/controller/setting_controller.dart';
import 'package:bat_and_mind/utils/extensions/extentions.dart';
import 'package:bat_and_mind/utils/values/my_color.dart';
import 'package:bat_and_mind/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../utils/values/style.dart' show kSize14DarkW400Text;

class SettingsScreen extends StatelessWidget {
  final SettingController controller = Get.find();
  SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backGround,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomAppBar(
              title: "Setting",
              settingButton: false,
            ),
            27.sbh,
            Text(
              "Bat & Brain",
              textAlign: TextAlign.center,
              style: kSize14DarkW400Text.copyWith(
                fontSize: 90.sp,
                color: MyColors.primary,
                shadows: [
                  Shadow(
                    offset: Offset(2.w, 2.h),
                    blurRadius: 2.r,
                    color: const Color.fromRGBO(169, 93, 25, 1),
                  ),
                ],
              ),
            ),
            Text("Music",
            style: kSize14DarkW400Text.copyWith(
              color: MyColors.textColor,
              fontSize: 32.sp,
            ),
            ),
            20.sbh,
            GestureDetector(
              onTap: (){
                controller.toggleMusic();
              },
              child: Container(
                width: 400.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    FractionallySizedBox(
                      widthFactor: 0.7, // ~60% filled
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.green[700],
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            130.sbh,
            Text("SFX",
              style: kSize14DarkW400Text.copyWith(
                color: MyColors.textColor,
                fontSize: 32.sp,
              ),
            ),
            20.sbh,
            GestureDetector(
              onTap: (){
                controller.toggleSound();
              },
              child: Container(
                width: 400.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    FractionallySizedBox(
                      widthFactor: 0.4, // ~60% filled
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.green[700],
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }

  // Function to build container toggle row
  Widget _buildContainerToggleRow(String label, bool value, Function() onChanged, Color activeColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: kSize14DarkW400Text.copyWith(
            fontSize: 40.sp,
            fontStyle: FontStyle.italic,
            color: const Color.fromRGBO(243, 213, 138, 1),
            shadows: [
              Shadow(
                offset: Offset(2.w, 2.h),
                blurRadius: 2.r,
                color: const Color.fromRGBO(169, 93, 25, 1),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: onChanged,
          child: Container(
            width: 60.w,
            height: 30.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              color: value ? activeColor : Colors.grey.shade300,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 2.r,
                  offset: Offset(0, 2.h),
                ),
              ],
            ),
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  left: value ? 30.w : 0,
                  child: Container(
                    width: 30.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 2.r,
                          offset: Offset(0, 1.h),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}