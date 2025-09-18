import '../data/quiz_data.dart';
import '../models/question_model.dart';

class LocalQuizService {
  static Future<List<Question>> fetchQuestions(String topicName) async {
    // Simulate a small delay to mimic API behavior
    await Future.delayed(const Duration(milliseconds: 500));

    // Try to find a matching topic name
    final matchedTopicName =
        QuizData.findMatchingTopicName(topicName) ?? topicName;

    final questionsData = QuizData.getQuestionsForTopic(matchedTopicName);

    if (questionsData.isEmpty) {
      // If still no questions found, try with the original topic name
      final fallbackQuestions = QuizData.getQuestionsForTopic(topicName);
      if (fallbackQuestions.isEmpty) {
        throw Exception(
          "No questions found for topic: $topicName. Available topics: ${QuizData.getTopicNames().join(', ')}",
        );
      }
      return fallbackQuestions
          .map((questionData) => Question.fromJson(questionData))
          .toList();
    }

    return questionsData
        .map((questionData) => Question.fromJson(questionData))
        .toList();
  }

  static List<String> getAvailableTopics() {
    return QuizData.getTopicNames();
  }

  static bool isTopicAvailable(String topicName) {
    return QuizData.findMatchingTopicName(topicName) != null;
  }

  static String? getMatchedTopicName(String categoryName) {
    return QuizData.findMatchingTopicName(categoryName);
  }
}
