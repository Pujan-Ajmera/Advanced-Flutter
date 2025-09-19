import 'package:get/get.dart';
import '../../utils/import_export.dart';
import 'statistics_controller.dart';

class QuizController extends GetxController {
  var questions = <Question>[].obs;
  var currentIndex = 0.obs;
  var selectedOption = ''.obs;
  var score = 0.obs;
  RxInt secondsElapsed = 0.obs;
  RxString timeLeft = '1:00'.obs;
  Timer? _timer;
  int totalSeconds = 1 * 60;
  List<Map<String, String>> wrongAnswerList = [];

  // Store quiz topics for statistics
  var currentQuizTopics = <String>[].obs;

  // Store user answers for navigation
  var userAnswers = <String>[].obs;
  void startTimer(int durationInSeconds) {
    totalSeconds = durationInSeconds;
    secondsElapsed.value = 0;
    _updateTimeLeft();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      secondsElapsed.value++;
      _updateTimeLeft();
      if (timeLeft.value == '00:00' || secondsElapsed.value >= totalSeconds) {
        timer.cancel();
        autoSubmitQuiz(); // Auto submit when time ends
      }
    });
  }

  void _updateTimeLeft() {
    final remainingSeconds = totalSeconds - secondsElapsed.value;
    final minutes = (remainingSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (remainingSeconds % 60).toString().padLeft(2, '0');
    timeLeft.value = '$minutes:$seconds';
  }

  String get timeTaken {
    final minutes = (secondsElapsed.value ~/ 60).toString().padLeft(2, '0');
    final seconds = (secondsElapsed.value % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  Future<void> loadQuestions(String topicName) async {
    try {
      questions.value = await LocalQuizService.fetchQuestions(topicName);
      currentIndex.value = 0;
      selectedOption.value = '';
      score.value = 0;
      wrongAnswerList.clear();
      currentQuizTopics.value = [topicName];

      // Initialize user answers array
      userAnswers.value = List.filled(questions.length, '');
    } catch (e) {
      print('Error loading questions: $e');
      Get.snackbar(
        'Error',
        'Failed to load quiz questions for $topicName',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> loadQuestionsFromMultipleTopics(
    List<String> topicNames, {
    int maxQuestions = 30,
  }) async {
    try {
      List<Question> allQuestions = [];

      for (String topicName in topicNames) {
        List<Question> topicQuestions = await LocalQuizService.fetchQuestions(
          topicName,
        );
        allQuestions.addAll(topicQuestions);
      }

      // Shuffle and limit questions
      allQuestions.shuffle();
      if (allQuestions.length > maxQuestions) {
        allQuestions = allQuestions.take(maxQuestions).toList();
      }

      questions.value = allQuestions;
      currentIndex.value = 0;
      selectedOption.value = '';
      score.value = 0;
      wrongAnswerList.clear();
      currentQuizTopics.value = topicNames;

      // Initialize user answers array
      userAnswers.value = List.filled(questions.length, '');
    } catch (e) {
      print('Error loading questions from multiple topics: $e');
      Get.snackbar(
        'Error',
        'Failed to load quiz questions from selected topics',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void selectOption(String option) {
    selectedOption.value = option;
    // Store the answer for current question
    userAnswers[currentIndex.value] = option;
  }

  void nextQuestion() {
    // Store current answer
    userAnswers[currentIndex.value] = selectedOption.value;

    if (currentIndex.value < questions.length - 1) {
      currentIndex.value++;
      // Load the answer for next question if exists
      selectedOption.value = userAnswers[currentIndex.value];
    }
  }

  void previousQuestion() {
    if (currentIndex.value > 0) {
      // Store current answer
      userAnswers[currentIndex.value] = selectedOption.value;

      currentIndex.value--;
      // Load the answer for previous question
      selectedOption.value = userAnswers[currentIndex.value];
    }
  }

  void skipQuestion() {
    // Store empty answer (skipped)
    userAnswers[currentIndex.value] = '';
    selectedOption.value = '';

    if (currentIndex.value < questions.length - 1) {
      nextQuestion();
    }
  }

  void submitQuiz() {
    // Store final answer
    userAnswers[currentIndex.value] = selectedOption.value;

    // Calculate score and wrong answers
    _calculateResults();

    // Save statistics
    _saveQuizStatistics();

    print("Your Score: ${score.value}/${questions.length}");
  }

  void autoSubmitQuiz() {
    // Store current answer when auto-submitting
    userAnswers[currentIndex.value] = selectedOption.value;

    // Calculate score and wrong answers
    _calculateResults();

    // Save statistics
    _saveQuizStatistics();

    print("Auto-submitted! Your Score: ${score.value}/${questions.length}");

    // Navigate to results
    Get.to(() => PaginatedResultsScreen(resultsData: wrongAnswerList));
  }

  void _calculateResults() {
    score.value = 0;
    wrongAnswerList.clear();

    for (int i = 0; i < questions.length; i++) {
      if (userAnswers[i] == questions[i].answer) {
        score.value++;
      } else {
        var wrongQuestion = {
          'question': questions[i].question,
          'selectedOption':
              userAnswers[i].isEmpty
                  ? "You Skipped this question"
                  : userAnswers[i],
          'correctOption': questions[i].answer,
        };
        wrongAnswerList.add(wrongQuestion);
      }
    }
  }

  void _saveQuizStatistics() async {
    try {
      // Try to find existing StatisticsController or create one
      StatisticsController statisticsController;
      try {
        statisticsController = Get.find<StatisticsController>();
      } catch (e) {
        statisticsController = Get.put(StatisticsController());
      }

      await statisticsController.addQuizResult(
        topics: currentQuizTopics,
        score: score.value,
        totalQuestions: questions.length,
        timeTaken: timeTaken,
      );
    } catch (e) {
      print('Error saving quiz statistics: $e');
    }
  }
}
