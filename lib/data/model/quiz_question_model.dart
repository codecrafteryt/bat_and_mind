/*
        ---------------------------------------
        Project: Bat and Brain Game Mobile Application
        Date: April 4, 2024
        Author: Ameer from Pakistan
        ---------------------------------------
        Description: Model code
      */
  class QuizQuestion {
    final String question;
    final List<String> options;
    final int correctAnswerIndex;
    final String? imagePath;

    QuizQuestion({
      required this.question,
      required this.options,
      required this.correctAnswerIndex,
      this.imagePath,
    });
  }