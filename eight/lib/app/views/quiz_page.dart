import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../controllers/quiz_controller.dart';

class QuizPage extends StatelessWidget {
  final String name;
  QuizPage({super.key, required this.name});

  final controller = Get.put(QuizController());
  final Color primaryColor = const Color(0xFF4361EE); // Energetic blue
  final Color secondaryColor = const Color(0xFF3A0CA3); // Deep purple
  final Color accentColor = const Color(0xFF4CC9F0); // Bright teal
  final Color backgroundColor = const Color(0xFFF8F9FA); // Light background
  final Color successColor = const Color(0xFF38B000); // Vibrant green
  final Duration quizDuration = const Duration(minutes: 15);

  @override
  Widget build(BuildContext context) {
    controller.loadQuestions(name);
    controller.startTimer(quizDuration.inSeconds);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
        actions: [
          Obx(() => Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                controller.timeLeft.value,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )),
        ],
      ),
      body: Obx(() {
        if (controller.questions.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
                  strokeWidth: 2,
                ),
                const SizedBox(height: 16),
                Text(
                  "Loading Questions...",
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          );
        }

        final question = controller.questions[controller.currentIndex.value];
        final progressValue =
            (controller.currentIndex.value + 1) / controller.questions.length;

        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Time and progress indicator
              Stack(
                children: [
                  LinearProgressIndicator(
                    value: progressValue,
                    backgroundColor: Colors.grey[200],
                    valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
                    minHeight: 8,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  if (controller.timeLeft.value != '15:00')
                    LinearProgressIndicator(
                      value: 1 - (controller.secondsElapsed.value / quizDuration.inSeconds),
                      backgroundColor: Colors.transparent,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.red.withOpacity(0.3)),
                      minHeight: 8,
                      borderRadius: BorderRadius.circular(10),
                    ),
                ],
              ),
              const SizedBox(height: 20),

              // Question card
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white,
                      secondaryColor.withOpacity(0.03),
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Question ${controller.currentIndex.value + 1}",
                          style: TextStyle(
                            fontSize: 14,
                            color: secondaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: primaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            "${controller.questions.length - controller.currentIndex.value - 1} left",
                            style: TextStyle(
                              fontSize: 12,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      question.question,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[800],
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),

              // Options list
              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: question.options.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final option = question.options[index];
                    return Obx(() => GestureDetector(
                      onTap: () {
                        HapticFeedback.selectionClick();
                        controller.selectOption(option);
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        decoration: BoxDecoration(
                          color: controller.selectedOption.value == option
                              ? primaryColor.withOpacity(0.1)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: controller.selectedOption.value == option
                                ? primaryColor
                                : Colors.grey.withOpacity(0.2),
                            width: 1.5,
                          ),
                          boxShadow: [
                            if (controller.selectedOption.value == option)
                              BoxShadow(
                                color: primaryColor.withOpacity(0.1),
                                blurRadius: 10,
                                spreadRadius: 2,
                              )
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: controller.selectedOption.value ==
                                        option
                                        ? primaryColor
                                        : Colors.grey.withOpacity(0.4),
                                    width: 2,
                                  ),
                                ),
                                child: controller.selectedOption.value == option
                                    ? Center(
                                  child: Container(
                                    width: 12,
                                    height: 12,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: primaryColor,
                                    ),
                                  ),
                                )
                                    : null,
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Text(
                                  option,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[800],
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ));
                  },
                ),
              ),
              const SizedBox(height: 20),

              // Next/Submit button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: controller.selectedOption.value.isEmpty
                      ? null
                      : controller.currentIndex.value <
                      controller.questions.length - 1
                      ? () {
                    HapticFeedback.lightImpact();
                    controller.nextQuestion();
                  }
                      : () {
                    HapticFeedback.mediumImpact();
                    controller.submitQuiz();
                    showResultsDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                    disabledBackgroundColor: Colors.grey[300],
                    shadowColor: primaryColor.withOpacity(0.3),
                  ),
                  child: Text(
                    controller.currentIndex.value <
                        controller.questions.length - 1
                        ? "Continue"
                        : "Submit Quiz",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  void showResultsDialog(BuildContext context) {
    final scorePercentage =
        (controller.score.value / controller.questions.length) * 100;
    final isSuccess = scorePercentage >= 70;

    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                spreadRadius: 5,
              ),
            ],
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                backgroundColor,
              ],
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: (isSuccess ? successColor : primaryColor)
                      .withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isSuccess ? Icons.emoji_events : Icons.auto_awesome,
                  size: 50,
                  color: isSuccess ? successColor : primaryColor,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                isSuccess ? "Great Job!" : "Good Try!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Time Taken: ${controller.timeTaken}",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 20),
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: CircularProgressIndicator(
                      value: scorePercentage / 100,
                      strokeWidth: 10,
                      backgroundColor: Colors.grey[200],
                      valueColor: AlwaysStoppedAnimation<Color>(
                          isSuccess ? successColor : primaryColor),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "${scorePercentage.toStringAsFixed(0)}%",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: isSuccess ? successColor : primaryColor,
                        ),
                      ),
                      Text(
                        "${controller.score.value}/${controller.questions.length}",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 25),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    HapticFeedback.lightImpact();
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Done",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }
}