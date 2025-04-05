 import 'package:bat_and_mind/utils/extensions/extentions.dart';
import 'package:bat_and_mind/utils/values/my_color.dart';
import 'package:bat_and_mind/views/events/game_events.dart';
import 'package:bat_and_mind/views/quiz/quiz_screen.dart';
import 'package:bat_and_mind/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../utils/values/style.dart';
import '../../widget/custom_app_bar.dart';
import '../players/players_screen.dart';

 class Menu extends StatelessWidget {
   const Menu({super.key});

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: MyColors.backGround,
       body: Column(
         mainAxisAlignment: MainAxisAlignment.start,
         children: [
           45.sbh,
           CustomAppBar(
             showBackButton: false,
           ),
           15.sbh,
           Container(
             height: 20.h,
             color: MyColors.textColor,
           ),
           50.sbh,
           Text(
                 "Bat & Brain",
                 textAlign: TextAlign.center,
                 style: kSize11DarkW500Text.copyWith(
                   color: MyColors.textColor,
                   fontSize: 80,
                   shadows: [
                     Shadow(
                       offset: Offset(8.w, 8.h),
                       blurRadius: 8.r,
                       color: const Color.fromRGBO(51, 57, 20, 1),
                     ),
                   ],
                 )
             ),
           100.sbh,
           CustomButton(
               text: "PLAYERS",
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
               onPressed: (){
                 Get.to(() => PlayersScreen());
               },
           ),
           26.sbh,
           CustomButton(
               text: "Events",
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
               onPressed: (){
                 Get.to(() => GameEvents());
               },
           ),
           26.sbh,
           CustomButton(
               text: "Quiz",
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
               onPressed: (){
                 Get.to(() => QuizScreen());
               },
           ),
         ],
       ),
     );
   }
 }
