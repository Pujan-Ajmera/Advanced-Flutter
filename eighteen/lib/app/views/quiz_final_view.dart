import 'package:get/get.dart';
import '../../utils/import_export.dart';
class PaginatedResultsScreen extends StatelessWidget {
  final List<Map<String, String>> resultsData;

  const PaginatedResultsScreen({
    super.key,
    required this.resultsData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: const Text('Review Answers'),
        backgroundColor: const Color(0xFF1F1F1F),
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: PaginatedResultsView(
        resultsData: resultsData,
      ),
    );
  }
}


class PaginatedResultsView extends StatefulWidget {
  final List<Map<String, String>> resultsData;
  const PaginatedResultsView({
    super.key,
    required this.resultsData,
  });

  @override
  State<PaginatedResultsView> createState() => _PaginatedResultsViewState();
}

class _PaginatedResultsViewState extends State<PaginatedResultsView> {
  late final PageController _pageController;
  int _currentPage = 0;
  late final List<QuizResult> _results;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _results = widget.resultsData.map((data) => QuizResult.fromMap(data)).toList();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToNextPage() {
    if (_currentPage < _results.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _goToPreviousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: _results.length,
            itemBuilder: (context, index) {
              return ResultCard(
                result: _results[index],
                questionNumber: index + 1,
              );
            },
          ),
        ),

        _buildBottomNavigationBar(),
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
    bool isFirstQuestion = _currentPage == 0;
    bool isLastQuestion = _currentPage == _results.length - 1;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
      color: const Color(0xFF1F1F1F),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (!isFirstQuestion)
            OutlinedButton(
              onPressed: _goToPreviousPage,
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                side: const BorderSide(color: Colors.white54),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              child: const Text(
                'Back',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            )
          else
            const SizedBox(width: 90),
          ElevatedButton(
            onPressed: () {
              if (isLastQuestion) {
                Get.offAll(() => HomeView());
              } else {
                _goToNextPage();
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: isLastQuestion ? Colors.green.shade600 : Get.theme.primaryColor,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            ),
            child: Text(
              isLastQuestion ? 'Finish' : 'Next',
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class ResultCard extends StatelessWidget {
  final QuizResult result;
  final int questionNumber;

  const ResultCard({
    super.key,
    required this.result,
    required this.questionNumber,
  });

  @override
  Widget build(BuildContext context) {
    final bool isCorrect = result.isCorrect;
    final Color wrongAnswerColor = Colors.red.shade400;
    final Color skippedAnswerColor = Colors.yellow.shade400;
    final Color correctAnswerColor = Colors.green.shade400;

    return Container(
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white24, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$questionNumber. ${result.question}',
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 24.0),
          const Divider(color: Colors.white24),
          const SizedBox(height: 16.0),

          if (!isCorrect) ...[
            _buildAnswerRow('Your Answer:', result.selectedOption, result.selectedOption == "You Skipped this question"?skippedAnswerColor:wrongAnswerColor),
            const SizedBox(height: 16.0),
          ],

          _buildAnswerRow('Correct Answer:', result.correctOption, correctAnswerColor),
        ],
      ),
    );
  }

  Widget _buildAnswerRow(String label, String answer, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 16, color: Colors.white70)),
        const SizedBox(height: 4),
        Text(
          answer,
          style: TextStyle(fontSize: 18, color: color, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
