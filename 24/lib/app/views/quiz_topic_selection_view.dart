import 'package:get/get.dart';
import '../../utils/import_export.dart';
import '../data/quiz_data.dart';
import '../controllers/quiz_controller.dart';
import '../controllers/db_controller.dart';
import 'quiz_page.dart';

class QuizTopicSelectionView extends StatelessWidget {
  final ThemeController themeController = Get.find();
  late final QuizController quizController;
  late final DBController dbController;

  final RxList<String> selectedTopics = <String>[].obs;
  final RxBool isLoading = false.obs;

  QuizTopicSelectionView({super.key}) {
    // Initialize controllers with fallback
    try {
      quizController = Get.find<QuizController>();
    } catch (e) {
      quizController = Get.put(QuizController());
    }

    try {
      dbController = Get.find<DBController>();
    } catch (e) {
      dbController = Get.put(DBController());
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get topics from database categories
    final availableTopics =
        dbController.categories.map((category) => category.name).toList();

    return Obx(
      () => Scaffold(
        backgroundColor:
            themeController.isDarkMode.value
                ? const Color(0xFF111827)
                : Colors.white,
        appBar: CustomAppBar(title: 'Select Quiz Topics', showBackButton: true),
        body: Column(
          children: [
            // Header Section
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color:
                    themeController.isDarkMode.value
                        ? const Color(0xFF1F2937)
                        : Colors.grey[50],
                border: Border(
                  bottom: BorderSide(
                    color:
                        themeController.isDarkMode.value
                            ? Colors.grey[700]!
                            : Colors.grey[300]!,
                    width: 1,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.quiz,
                        color: const Color(0xFFEF476F),
                        size: 24,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Create Custom Quiz',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color:
                              themeController.isDarkMode.value
                                  ? Colors.white
                                  : const Color(0xFF1F2937),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Select topics to generate a personalized quiz with random questions',
                    style: TextStyle(
                      fontSize: 14,
                      color:
                          themeController.isDarkMode.value
                              ? Colors.grey[400]
                              : Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Obx(
                    () => Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEF476F).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: const Color(0xFFEF476F).withOpacity(0.3),
                            ),
                          ),
                          child: Text(
                            '${selectedTopics.length} topics selected',
                            style: const TextStyle(
                              color: Color(0xFFEF476F),
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        const Spacer(),
                        if (selectedTopics.isNotEmpty)
                          TextButton(
                            onPressed: () {
                              selectedTopics.clear();
                            },
                            child: Text(
                              'Clear All',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 12,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Topics List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: availableTopics.length,
                itemBuilder: (context, index) {
                  final topic = availableTopics[index];
                  final category = dbController.categories[index];
                  // Try to get questions count from quiz data, default to 5 if not found
                  final matchedTopic = QuizData.findMatchingTopicName(topic);
                  final questionsCount =
                      matchedTopic != null
                          ? QuizData.getQuestionsForTopic(matchedTopic).length
                          : 5;

                  return Obx(() {
                    final isSelected = selectedTopics.contains(topic);

                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () {
                            if (isSelected) {
                              selectedTopics.remove(topic);
                            } else {
                              selectedTopics.add(topic);
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color:
                                  themeController.isDarkMode.value
                                      ? const Color(0xFF1F2937)
                                      : Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color:
                                    isSelected
                                        ? const Color(0xFFEF476F)
                                        : (themeController.isDarkMode.value
                                            ? Colors.grey[700]!
                                            : Colors.grey[300]!),
                                width: isSelected ? 2 : 1,
                              ),
                              boxShadow:
                                  isSelected
                                      ? [
                                        BoxShadow(
                                          color: const Color(
                                            0xFFEF476F,
                                          ).withOpacity(0.2),
                                          blurRadius: 8,
                                          offset: const Offset(0, 2),
                                        ),
                                      ]
                                      : null,
                            ),
                            child: Row(
                              children: [
                                // Checkbox
                                Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    color:
                                        isSelected
                                            ? const Color(0xFFEF476F)
                                            : Colors.transparent,
                                    border: Border.all(
                                      color:
                                          isSelected
                                              ? const Color(0xFFEF476F)
                                              : Colors.grey[400]!,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child:
                                      isSelected
                                          ? const Icon(
                                            Icons.check,
                                            color: Colors.white,
                                            size: 16,
                                          )
                                          : null,
                                ),
                                const SizedBox(width: 16),

                                // Topic Info
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        topic,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color:
                                              themeController.isDarkMode.value
                                                  ? Colors.white
                                                  : const Color(0xFF1F2937),
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        category.description,
                                        style: TextStyle(
                                          fontSize: 11,
                                          color:
                                              themeController.isDarkMode.value
                                                  ? Colors.grey[500]
                                                  : Colors.grey[700],
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        '$questionsCount questions available',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color:
                                              themeController.isDarkMode.value
                                                  ? Colors.grey[400]
                                                  : Colors.grey[600],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // Arrow or Selected Icon
                                Icon(
                                  isSelected
                                      ? Icons.arrow_forward_ios
                                      : Icons.add_circle_outline,
                                  color:
                                      isSelected
                                          ? const Color(0xFFEF476F)
                                          : Colors.grey[400],
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  });
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: Obx(
          () =>
              selectedTopics.isNotEmpty
                  ? Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color:
                          themeController.isDarkMode.value
                              ? const Color(0xFF1F2937)
                              : Colors.white,
                      border: Border(
                        top: BorderSide(
                          color:
                              themeController.isDarkMode.value
                                  ? Colors.grey[700]!
                                  : Colors.grey[300]!,
                          width: 1,
                        ),
                      ),
                    ),
                    child: SafeArea(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Quiz Info
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: const Color(0xFFEF476F).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.info_outline,
                                  color: const Color(0xFFEF476F),
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    _getQuizInfo(),
                                    style: const TextStyle(
                                      color: Color(0xFFEF476F),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Start Quiz Button
                          SizedBox(
                            width: double.infinity,
                            height: 52,
                            child: ElevatedButton(
                              onPressed: isLoading.value ? null : _startQuiz,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFEF476F),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                elevation: 2,
                              ),
                              child:
                                  isLoading.value
                                      ? const SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                          strokeWidth: 2,
                                        ),
                                      )
                                      : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.play_arrow,
                                            size: 20,
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            'Start Quiz (${selectedTopics.length} topics)',
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  : const SizedBox.shrink(),
        ),
      ),
    );
  }

  String _getQuizInfo() {
    int totalQuestions = 0;
    for (String topic in selectedTopics) {
      // Try to find matching quiz topic
      final matchedTopic = QuizData.findMatchingTopicName(topic);
      if (matchedTopic != null) {
        totalQuestions += QuizData.getQuestionsForTopic(matchedTopic).length;
      } else {
        // Default to 5 questions if no match found
        totalQuestions += 5;
      }
    }

    int finalQuestionCount = totalQuestions > 30 ? 30 : totalQuestions;

    if (totalQuestions < 30) {
      return 'Quiz will have $finalQuestionCount questions (all available from selected topics)';
    } else {
      return 'Quiz will have $finalQuestionCount random questions from $totalQuestions available';
    }
  }

  void _startQuiz() async {
    if (selectedTopics.isEmpty) return;

    isLoading.value = true;

    try {
      // Map selected database topics to quiz topics
      List<String> quizTopics = [];
      for (String selectedTopic in selectedTopics) {
        final matchedTopic = QuizData.findMatchingTopicName(selectedTopic);
        if (matchedTopic != null) {
          quizTopics.add(matchedTopic);
        }
      }

      // If no topics matched, show error
      if (quizTopics.isEmpty) {
        Get.snackbar(
          'Error',
          'No quiz questions available for selected topics. Please contact support.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.orange,
          colorText: Colors.white,
          duration: const Duration(seconds: 3),
        );
        return;
      }

      // Load questions from matched quiz topics
      await quizController.loadQuestionsFromMultipleTopics(quizTopics);

      if (quizController.questions.isEmpty) {
        Get.snackbar(
          'Error',
          'No questions found for selected topics',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return;
      }

      // Navigate to quiz page
      Get.to(
        () => QuizPage(
          name: 'Custom Quiz (${selectedTopics.length} topics)',
          isMultiTopic: true,
        ),
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to start quiz: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
