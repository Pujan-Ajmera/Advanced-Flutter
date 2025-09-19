import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StatisticsController extends GetxController {
  static const String TOTAL_QUIZ_KEY = 'total_quiz_taken';
  static const String TOTAL_SCORE_KEY = 'total_score';
  static const String QUIZ_HISTORY_KEY = 'quiz_history';

  var totalQuizTaken = 0.obs;
  var totalScore = 0.obs;
  var averageMarks = 0.0.obs;
  var quizHistory = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadStatistics();
  }

  Future<void> _loadStatistics() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      totalQuizTaken.value = prefs.getInt(TOTAL_QUIZ_KEY) ?? 0;
      totalScore.value = prefs.getInt(TOTAL_SCORE_KEY) ?? 0;

      // Load quiz history
      List<String>? historyStrings = prefs.getStringList(QUIZ_HISTORY_KEY);
      if (historyStrings != null) {
        quizHistory.value =
            historyStrings.map((historyString) {
              List<String> parts = historyString.split('|');
              return {
                'date': parts[0],
                'topics': parts[1],
                'score': int.parse(parts[2]),
                'total': int.parse(parts[3]),
                'percentage': double.parse(parts[4]),
                'timeTaken': parts.length > 5 ? parts[5] : '00:00',
              };
            }).toList();
      }

      _calculateAverageMarks();
    } catch (e) {
      print('Error loading statistics: $e');
    }
  }

  void _calculateAverageMarks() {
    if (quizHistory.isNotEmpty) {
      double total = 0;
      for (var quiz in quizHistory) {
        total += quiz['percentage'];
      }
      averageMarks.value = total / quizHistory.length;
    } else {
      averageMarks.value = 0.0;
    }
  }

  Future<void> addQuizResult({
    required List<String> topics,
    required int score,
    required int totalQuestions,
    required String timeTaken,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      // Update totals
      totalQuizTaken.value++;
      totalScore.value += score;

      // Calculate percentage
      double percentage = (score / totalQuestions) * 100;

      // Add to history
      Map<String, dynamic> quizResult = {
        'date': DateTime.now().toIso8601String(),
        'topics': topics.join(', '),
        'score': score,
        'total': totalQuestions,
        'percentage': percentage,
        'timeTaken': timeTaken,
      };

      quizHistory.insert(0, quizResult); // Add to beginning of list

      // Keep only last 50 quiz results to prevent storage bloat
      if (quizHistory.length > 50) {
        quizHistory.removeRange(50, quizHistory.length);
      }

      // Save to SharedPreferences
      await prefs.setInt(TOTAL_QUIZ_KEY, totalQuizTaken.value);
      await prefs.setInt(TOTAL_SCORE_KEY, totalScore.value);

      List<String> historyStrings =
          quizHistory.map((quiz) {
            return '${quiz['date']}|${quiz['topics']}|${quiz['score']}|${quiz['total']}|${quiz['percentage']}|${quiz['timeTaken']}';
          }).toList();

      await prefs.setStringList(QUIZ_HISTORY_KEY, historyStrings);

      _calculateAverageMarks();

      print('Quiz statistics saved successfully');
    } catch (e) {
      print('Error saving quiz statistics: $e');
    }
  }

  Future<void> clearAllStatistics() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove(TOTAL_QUIZ_KEY);
      await prefs.remove(TOTAL_SCORE_KEY);
      await prefs.remove(QUIZ_HISTORY_KEY);

      totalQuizTaken.value = 0;
      totalScore.value = 0;
      averageMarks.value = 0.0;
      quizHistory.clear();

      Get.snackbar(
        'Statistics Cleared',
        'All quiz statistics have been reset',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      print('Error clearing statistics: $e');
    }
  }

  List<Map<String, dynamic>> getRecentQuizzes({int limit = 10}) {
    return quizHistory.take(limit).toList();
  }

  Map<String, dynamic> getBestPerformance() {
    if (quizHistory.isEmpty) {
      return {'percentage': 0.0, 'topics': 'No quizzes taken yet'};
    }

    return quizHistory.reduce((current, next) {
      return current['percentage'] > next['percentage'] ? current : next;
    });
  }

  Map<String, dynamic> getWorstPerformance() {
    if (quizHistory.isEmpty) {
      return {'percentage': 0.0, 'topics': 'No quizzes taken yet'};
    }

    return quizHistory.reduce((current, next) {
      return current['percentage'] < next['percentage'] ? current : next;
    });
  }

  String getFormattedDate(String isoDate) {
    try {
      DateTime date = DateTime.parse(isoDate);
      return '${date.day}/${date.month}/${date.year}';
    } catch (e) {
      return 'Unknown date';
    }
  }

  String getFormattedTime(String isoDate) {
    try {
      DateTime date = DateTime.parse(isoDate);
      return '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
    } catch (e) {
      return 'Unknown time';
    }
  }
}
