import 'package:get/get.dart';
import '../../utils/import_export.dart';

class QuizController extends GetxController {
  var questions = <Question>[].obs;
  var currentIndex = 0.obs;
  var selectedOption = ''.obs;
  var score = 0.obs;
  RxInt secondsElapsed = 0.obs;
  RxString timeLeft = '1:00'.obs;
  Timer? _timer;
  int totalSeconds = 1 * 60;

  void startTimer(int durationInSeconds) {
    totalSeconds = durationInSeconds;
    secondsElapsed.value = 0;
    _updateTimeLeft();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      secondsElapsed.value++;
      _updateTimeLeft();
      if(timeLeft.value=='00:00'){
        timer.cancel();
        submitQuiz();
      }
      if (secondsElapsed.value >= totalSeconds) {
        timer.cancel();
        submitQuiz();
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
    questions.value = await ApiService.fetchQuestions(topicName);
    currentIndex.value = 0;
    selectedOption.value = '';
    score.value = 0;
  }

  void selectOption(String option) {
    selectedOption.value = option;
  }

  void nextQuestion() {
    if (selectedOption.value == questions[currentIndex.value].answer) {
      score.value++;
    }
    if (currentIndex.value < questions.length - 1) {
      currentIndex.value++;
      selectedOption.value = '';
    }
  }

  void submitQuiz() {
    if (selectedOption.value == questions[currentIndex.value].answer) {
      score.value++;
    }
    print("Your Score: ${score.value}/${questions.length}");
  }
}
