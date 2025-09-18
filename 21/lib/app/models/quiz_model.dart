class QuizResult {
  final String question;
  final String selectedOption;
  final String correctOption;

  const QuizResult({
    required this.question,
    required this.selectedOption,
    required this.correctOption,
  });

  factory QuizResult.fromMap(Map<String, String> map) {
    return QuizResult(
      question: map['question']!,
      selectedOption: map['selectedOption']!,
      correctOption: map['correctOption']!,
    );
  }

  bool get isCorrect => selectedOption == correctOption;
}


