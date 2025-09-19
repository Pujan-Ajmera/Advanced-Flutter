import '../data/quiz_data.dart';
import '../models/question_model.dart';
import 'dart:math';

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

  /// Fetch questions from multiple topics with optional question limit
  static Future<List<Question>> fetchQuestionsFromMultipleTopics(
    List<String> topicNames, {
    int maxQuestions = 30,
    bool shuffleQuestions = true,
  }) async {
    // Simulate a small delay to mimic API behavior
    await Future.delayed(const Duration(milliseconds: 800));

    List<Question> allQuestions = [];

    for (String topicName in topicNames) {
      try {
        final topicQuestions = await fetchQuestions(topicName);
        allQuestions.addAll(topicQuestions);
      } catch (e) {
        print('Warning: Could not load questions for topic "$topicName": $e');
        // Continue with other topics instead of failing completely
      }
    }

    if (allQuestions.isEmpty) {
      throw Exception(
        'No questions found for any of the selected topics: ${topicNames.join(", ")}',
      );
    }

    // Shuffle questions if requested
    if (shuffleQuestions) {
      allQuestions.shuffle(Random());
    }

    // Limit the number of questions
    if (allQuestions.length > maxQuestions) {
      allQuestions = allQuestions.take(maxQuestions).toList();
    }

    return allQuestions;
  }

  /// Get total available questions count for multiple topics
  static int getTotalQuestionsCount(List<String> topicNames) {
    int totalCount = 0;
    for (String topicName in topicNames) {
      final matchedTopicName =
          QuizData.findMatchingTopicName(topicName) ?? topicName;
      final questionsData = QuizData.getQuestionsForTopic(matchedTopicName);
      totalCount += questionsData.length;
    }
    return totalCount;
  }

  /// Validate if all provided topics have questions available
  static Map<String, bool> validateTopics(List<String> topicNames) {
    Map<String, bool> validation = {};
    for (String topicName in topicNames) {
      validation[topicName] = isTopicAvailable(topicName);
    }
    return validation;
  }
}
