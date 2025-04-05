
 import 'package:bat_and_mind/views/quiz/result_screen.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/model/quiz_question_model.dart';

 class QuizController extends GetxController {
   final SharedPreferences sharedPreferences;
   QuizController({required this.sharedPreferences});

   RxInt currentQuestionIndex = 0.obs;
   RxInt score = 0.obs;
   RxList<bool> questionAnswered = <bool>[].obs;
   RxInt selectedAnswerIndex = (-1).obs;
   RxBool isAnswered = false.obs;

   // List of quiz questions
   final List<QuizQuestion> questions = [
     QuizQuestion(
       question: "Who is known as the `Master Blaster` in cricket?",
       options: ["Sachin Tendulkar", "Brian Lara", "Virat Kohli",],
       correctAnswerIndex: 0,
       imagePath: "assets/images/don.png",
     ),
     QuizQuestion(
       question: "In cricket, what is the term used for dismissing a batsman without them scoring any runs?",
       options: ["Golden duck", "Bronze duck", "Diamond duck",],
       correctAnswerIndex: 0,
       imagePath: "assets/images/quiz2.png",
     ),
     QuizQuestion(
       question: "Which country won the first Cricket World Cup held in 1975?",
       options: ["West Indies", "India", "England",],
       correctAnswerIndex: 0,
       imagePath: "assets/images/quiz3.png",
     ),
     QuizQuestion(
       question: "How many players are there in a cricket team on the field at one time?",
       options: ["11", "5", "9"],
       correctAnswerIndex: 0,
       imagePath: "assets/images/quiz4.png",
     ),
     QuizQuestion(
       question: "What is the highest individual score by a batsman in Test cricket?",
       options: ["400", "450", "350",],
       correctAnswerIndex: 0,
       imagePath: "assets/images/quiz5.png",
     ),
     QuizQuestion(
       question: "Which format of cricket involves games lasting only a few hours?",
       options: ["T20", "ODI", "First-class",],
       correctAnswerIndex: 0,
       imagePath: "assets/images/quiz6.png",
     ),QuizQuestion(
       question: "Who holds the record for the fastest century in One Day International (ODI) cricket?",
       options: ["AB de Villiers", "Virat Kohli", "Chris Gayle",],
       correctAnswerIndex: 0,
       imagePath: "assets/images/quiz6.png",
     ),
     QuizQuestion(
       question: "Which bowler has taken the most wickets in international cricket?",
       options: ["Muttiah Muralitharan", "Glenn McGrath", "Shane Warne", ],
       correctAnswerIndex: 0,
       imagePath: "assets/images/quiz7.png",
     ),
     QuizQuestion(
       question: "What is the term used for a batsman being dismissed by the bowler without scoring any runs in cricket?",
       options: ["Bowled", "Run out", "Stumped",],
       correctAnswerIndex: 0,
       imagePath: "assets/images/quiz8.png",
     ),
     QuizQuestion(
       question: "Which country is the current ICC Cricket World Cup champions as of 2021?",
       options: ["England", "Australia", "West Indies",],
       correctAnswerIndex: 0,
       imagePath: "assets/images/quiz8.png",
     ),
   ];

   @override
   void onInit() {
     super.onInit();
     questionAnswered.value = List.generate(questions.length, (index) => false);
   }

   void answerQuestion(int selectedIndex) {
     if (!questionAnswered[currentQuestionIndex.value]) {
       selectedAnswerIndex.value = selectedIndex;
       isAnswered.value = true; // Mark question as answered
       if (selectedIndex == questions[currentQuestionIndex.value].correctAnswerIndex) {
         score.value++;
       }
       questionAnswered[currentQuestionIndex.value] = true;
       Future.delayed(const Duration(milliseconds: 1000), () { // Wait for animation/feedback before moving to next question
         if (currentQuestionIndex.value < questions.length - 1) {
           currentQuestionIndex.value++;
           selectedAnswerIndex.value = -1;
           isAnswered.value = false;
         } else {
           Get.to(() => ResultScreen());
         }
       });
       update();
     }
   }

   void resetQuiz() {
     currentQuestionIndex.value = 0;
     score.value = 0;
     selectedAnswerIndex.value = -1;
     isAnswered.value = false;
     questionAnswered.value = List.generate(questions.length, (index) => false);
   }
 }