import '../../utils/import_export.dart';
import 'package:get/get.dart';
class QuizPage extends StatelessWidget {
  final String name;
  QuizPage({super.key, required this.name});
  final controller = Get.put(QuizController());
  final Color primaryColor = const Color(0xFF7C3AED);
  final Color secondaryColor = const Color(0xFF1F2937);
  final Color accentColor = const Color(0xFF10B981);
  final Color backgroundColor = const Color(0xFF111827);
  final Color cardColor = const Color(0xFF1F2937);
  final Color textColor = const Color(0xFFF9FAFB);
  final Duration quizDuration = const Duration(minutes: 15);
  @override
  Widget build(BuildContext context) {
    controller.loadQuestions(name).then((value) =>
        controller.startTimer(quizDuration.inSeconds),);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Obx(() {
          if (controller.questions.isEmpty) {
            return _buildLoadingState();
          }
          if (controller.timeLeft.value == '00:00') {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              controller.submitQuiz();
              _showResults();
            });
          }
          return Column(
            children: [
              _buildHeader(context),
              _buildBreadcrumb(),
              Expanded(child: _buildQuizContent()),
              _buildBottomAction(),
            ],
          );
        }),
      ),
    );
  }
  Widget _buildLoadingState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 60,
            height: 60,
            child: CircularProgressIndicator(
              strokeWidth: 4,
              valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
              backgroundColor: cardColor,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            "Preparing Quiz",
            style: TextStyle(
              color: textColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Please wait...",
            style: TextStyle(
              color: textColor.withOpacity(0.6),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardColor,
        border: Border(
          bottom: BorderSide(
            color: primaryColor.withOpacity(0.2),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.close, color: textColor),
            style: IconButton.styleFrom(
              backgroundColor: backgroundColor,
              padding: const EdgeInsets.all(8),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              name,
              style: TextStyle(
                color: textColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Obx(() =>
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  controller.timeLeft.value,
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )),
        ],
      ),
    );
  }
  Widget _buildBreadcrumb() {
    return Obx(() {
      final currentIndex = controller.currentIndex.value + 1;
      final totalQuestions = controller.questions.length;

      return Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Text(
              "Question",
              style: TextStyle(
                color: textColor.withOpacity(0.7),
                fontSize: 14,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              "$currentIndex",
              style: TextStyle(
                color: primaryColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              " of $totalQuestions",
              style: TextStyle(
                color: textColor.withOpacity(0.7),
                fontSize: 14,
              ),
            ),
            const Spacer(),
            SizedBox(
              width: 120,
              height: 4,
              child: LinearProgressIndicator(
                value: currentIndex / totalQuestions,
                backgroundColor: cardColor,
                valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ],
        ),
      );
    });
  }
  Widget _buildQuizContent() {
    return Obx(() {
      final question = controller.questions[controller.currentIndex.value];

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(bottom: 24),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: primaryColor.withOpacity(0.1),
                  width: 1,
                ),
              ),
              child: Text(
                question.question,
                style: TextStyle(
                  color: textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                ),
              ),
            ),
            // Options
            Text(
              "Choose your answer:",
              style: TextStyle(
                color: textColor.withOpacity(0.8),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16),

            Expanded(
              child: ListView.builder(
                itemCount: question.options.length,
                itemBuilder: (context, index) {
                  final option = question.options[index];

                  return Obx(() =>
                      Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: InkWell(
                          onTap: () {
                            HapticFeedback.selectionClick();
                            controller.selectOption(option);
                          },
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: controller.selectedOption.value == option
                                  ? primaryColor.withOpacity(0.15)
                                  : backgroundColor,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: controller.selectedOption.value == option
                                    ? primaryColor
                                    : textColor.withOpacity(0.2),
                                width: controller.selectedOption.value == option
                                    ? 2
                                    : 1,
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: controller.selectedOption.value ==
                                        option
                                        ? primaryColor
                                        : Colors.transparent,
                                    border: Border.all(
                                      color: controller.selectedOption.value ==
                                          option
                                          ? primaryColor
                                          : textColor.withOpacity(0.4),
                                      width: 2,
                                    ),
                                  ),
                                  child: controller.selectedOption.value ==
                                      option
                                      ? const Icon(
                                    Icons.check,
                                    size: 16,
                                    color: Colors.white,
                                  )
                                      : null,
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Text(
                                    option,
                                    style: TextStyle(
                                      color: controller.selectedOption.value ==
                                          option
                                          ? primaryColor
                                          : textColor,
                                      fontSize: 16,
                                      fontWeight: controller.selectedOption
                                          .value == option
                                          ? FontWeight.w600
                                          : FontWeight.normal,
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
          ],
        ),
      );
    });
  }

  Widget _buildBottomAction() {
    return Obx(() =>
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: cardColor,
            border: Border(
              top: BorderSide(
                color: primaryColor.withOpacity(0.2),
                width: 1,
              ),
            ),
          ),
          child: Row(
            children: [
              // Skip button (optional)
              if (controller.currentIndex.value <
                  controller.questions.length - 1)
                TextButton(
                  onPressed: controller.selectedOption.value.isNotEmpty
                      ? null
                      : () {
                    controller.selectOption(""); // Clear selection
                    controller.nextQuestion();
                  },
                  child: Text(
                    "Skip",
                    style: TextStyle(
                      color: textColor.withOpacity(0.6),
                      fontSize: 16,
                    ),
                  ),
                ),

              const Spacer(),

              // Next/Submit button
              ElevatedButton(
                onPressed: controller.selectedOption.value.isEmpty ? null : () {
                  if (controller.currentIndex.value <
                      controller.questions.length - 1) {
                    HapticFeedback.lightImpact();
                    controller.nextQuestion();
                  } else {
                    HapticFeedback.mediumImpact();
                    controller.submitQuiz();
                    // _showResults();
                    Get.to(() => PaginatedResultsScreen(
                      resultsData: controller.wrongAnswerList,
                      // homeView: HomeView(), // Pass an instance of your home screen
                    ));
                    // Get.to(PaginatedResultsScreen(resultsData: controller.wrongAnswerList,homeView: HomeView(),));
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  disabledBackgroundColor: textColor.withOpacity(0.2),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 32, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  controller.currentIndex.value <
                      controller.questions.length - 1
                      ? "Next"
                      : "Finish",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  void _showResults() {
    final scorePercentage = (controller.score.value /
        controller.questions.length) * 100;
    final isPassed = scorePercentage >= 70;
    print(controller.wrongAnswerList);
    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: primaryColor.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isPassed ? Icons.check_circle : Icons.info,
                size: 64,
                color: isPassed ? accentColor : primaryColor,
              ),
              const SizedBox(height: 16),
              Text(
                isPassed ? "Well Done!" : "Quiz Complete",
                style: TextStyle(
                  color: textColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Time: ${controller.timeTaken}",
                style: TextStyle(
                  color: textColor.withOpacity(0.7),
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${controller.score.value}",
                    style: TextStyle(
                      color: isPassed ? accentColor : primaryColor,
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    " / ${controller.questions.length}",
                    style: TextStyle(
                      color: textColor.withOpacity(0.6),
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                "${scorePercentage.toInt()}% Correct",
                style: TextStyle(
                  color: textColor.withOpacity(0.8),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    HapticFeedback.lightImpact();
                    Get.off(HomeView());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "Finish",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
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
