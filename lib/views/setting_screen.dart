/*
          ---------------------------------------
          Project: Bat and Brain Game Mobile Application
          Date: April 4, 2024
          Author: Ameer from Pakistan
          ---------------------------------------
          Description: Quiz screen
        */
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
            Text(
              "Music",
              style: kSize14DarkW400Text.copyWith(
                color: MyColors.textColor,
                fontSize: 32.sp,
              ),
            ),
            20.sbh,
            Row(
              children: [
                // Obx(() => GestureDetector(
                //   onTap: controller.toggleMusic,
                //   child: Container(
                //     width: 60.w,
                //     height: 40.h,
                //     decoration: BoxDecoration(
                //       color: controller.isMusicOn.value ? Colors.green[700] : Colors.red[700],
                //       borderRadius: BorderRadius.circular(30),
                //       boxShadow: const [
                //         BoxShadow(
                //           color: Colors.black26,
                //           blurRadius: 4,
                //           offset: Offset(2, 2),
                //         ),
                //       ],
                //     ),
                //     child: Icon(
                //       controller.isMusicOn.value ? Icons.music_note : Icons.music_off,
                //       color: Colors.white,
                //     ),
                //   ),
                // )),
                10.sbw,
                Expanded(
                  child: _VolumeBar(
                    onVolumeChanged: controller.setMusicVolume,
                    volumeValue: controller.musicVolume,
                    onActivate: () {
                      if (!controller.isMusicOn.value) {
                        controller.toggleMusic();
                      }
                    },
                  ),
                ),

              ],
            ),
            130.sbh,
            Text(
              "SFX",
              style: kSize14DarkW400Text.copyWith(
                color: MyColors.textColor,
                fontSize: 32.sp,
              ),
            ),
            20.sbh,
            Row(
              children: [
                // Sound Toggle Button
                // Obx(() => GestureDetector(
                //   onTap: controller.toggleSound,
                //   child: Container(
                //     width: 60.w,
                //     height: 40.h,
                //     decoration: BoxDecoration(
                //       color: controller.isSoundOn.value ? Colors.green[700] : Colors.red[700],
                //       borderRadius: BorderRadius.circular(30),
                //       boxShadow: const [
                //         BoxShadow(
                //           color: Colors.black26,
                //           blurRadius: 4,
                //           offset: Offset(2, 2),
                //         ),
                //       ],
                //     ),
                //     child: Icon(
                //       controller.isSoundOn.value ? Icons.volume_up : Icons.volume_off,
                //       color: Colors.white,
                //     ),
                //   ),
                // )),
                10.sbw,
                Expanded(
                  child: _VolumeBar(
                    onVolumeChanged: controller.setSoundVolume,
                    volumeValue: controller.soundVolume,
                    onActivate: () {
                      if (!controller.isSoundOn.value) {
                        controller.toggleSound();
                      }
                    },
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _VolumeBar extends StatelessWidget {
  final Function(double) onVolumeChanged;
  final RxDouble volumeValue;
  final VoidCallback onActivate;

  const _VolumeBar({
    required this.onVolumeChanged,
    required this.volumeValue,
    required this.onActivate,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final barWidth = constraints.maxWidth;

        void _handleInteraction(Offset localPosition) {
          final dx = localPosition.dx.clamp(0, barWidth);
          final newVolume = dx / barWidth;
          onVolumeChanged(newVolume);
          onActivate(); // Auto-enable music/SFX
        }

        return GestureDetector(
          onHorizontalDragUpdate: (details) {
            _handleInteraction(details.localPosition);
          },
          onTapDown: (details) {
            _handleInteraction(details.localPosition);
          },
          child: Container(
            width: barWidth,
            height: 40.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            child: Obx(() => Stack(
              children: [
                FractionallySizedBox(
                  widthFactor: volumeValue.value,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green[700],
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ],
            )),
          ),
        );
      },
    );
  }
}
