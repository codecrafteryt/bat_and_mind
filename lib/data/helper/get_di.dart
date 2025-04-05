/*
        ---------------------------------------
        Project: Bat and Brain Game Mobile Application
        Date: April 4, 2024
        Author: Ameer from Pakistan
        ---------------------------------------
        Description: Dependency Injection
      */
import 'package:bat_and_mind/controller/event_controller.dart';
import 'package:bat_and_mind/controller/players_controller.dart';
import 'package:bat_and_mind/controller/quiz_controller.dart';
import 'package:bat_and_mind/controller/setting_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DependencyInjection { // controllers DI
  static void init() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    Get.lazyPut(() => sharedPreferences, fenix: true);
    Get.put<SettingController>(SettingController(sharedPreferences: sharedPreferences),  permanent: true);
    Get.lazyPut(() => PlayerController(sharedPreferences: sharedPreferences), fenix: true);
    Get.lazyPut(() => EventController(sharedPreferences: sharedPreferences), fenix: true);
    Get.lazyPut(() => QuizController(sharedPreferences: sharedPreferences), fenix: true);
  }
}