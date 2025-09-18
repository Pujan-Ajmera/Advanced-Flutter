import 'package:get/get.dart';
import '../../utils/import_export.dart';

class PaginatedResultsScreen extends StatelessWidget {
  final List<Map<String, String>> resultsData;
  final ThemeController themeController = Get.find();

  PaginatedResultsScreen({super.key, required this.resultsData});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor:
            themeController.isDarkMode.value
                ? const Color(0xFF111827)
                : Colors.white,
        appBar: CustomAppBar(title: 'Review Answers', showBackButton: false),
        body: PaginatedResultsView(resultsData: resultsData),
      ),
    );
  }
}

class PaginatedResultsView extends StatefulWidget {
  final List<Map<String, String>> resultsData;
  const PaginatedResultsView({super.key, required this.resultsData});

  @override
  State<PaginatedResultsView> createState() => _PaginatedResultsViewState();
}

class _PaginatedResultsViewState extends State<PaginatedResultsView> {
  late final PageController _pageController;
  int _currentPage = 0;
  late final List<QuizResult> _results;
  final ThemeController themeController = Get.find();

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _results =
        widget.resultsData.map((data) => QuizResult.fromMap(data)).toList();
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

    return Obx(
      () => Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        color:
            themeController.isDarkMode.value
                ? const Color(0xFF1F2937)
                : Colors.grey[100],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (!isFirstQuestion)
              OutlinedButton(
                onPressed: _goToPreviousPage,
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 12,
                  ),
                  side: BorderSide(
                    color:
                        themeController.isDarkMode.value
                            ? Colors.white54
                            : Colors.grey.shade400,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Back',
                  style: TextStyle(
                    fontSize: 16,
                    color:
                        themeController.isDarkMode.value
                            ? Colors.white
                            : Colors.grey.shade700,
                  ),
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
                backgroundColor:
                    isLastQuestion
                        ? Colors.green.shade600
                        : const Color(0xFF7C3AED),
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                isLastQuestion ? 'Finish' : 'Next',
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResultCard extends StatelessWidget {
  final QuizResult result;
  final int questionNumber;
  final ThemeController themeController = Get.find();

  ResultCard({super.key, required this.result, required this.questionNumber});

  @override
  Widget build(BuildContext context) {
    final bool isCorrect = result.isCorrect;
    final bool isSkipped = result.selectedOption == "You Skipped this question";
    final Color wrongAnswerColor = Colors.red.shade400;
    final Color skippedAnswerColor = Colors.yellow.shade600;
    final Color correctAnswerColor = Colors.green.shade400;

    return Obx(
      () => Container(
        padding: const EdgeInsets.all(20.0),
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        decoration: BoxDecoration(
          color:
              themeController.isDarkMode.value
                  ? const Color(0xFF1F2937)
                  : Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color:
                themeController.isDarkMode.value
                    ? Colors.white24
                    : Colors.grey.shade300,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Question with status indicator
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color:
                        isCorrect
                            ? correctAnswerColor.withOpacity(0.2)
                            : isSkipped
                            ? skippedAnswerColor.withOpacity(0.2)
                            : wrongAnswerColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    isCorrect
                        ? 'CORRECT'
                        : isSkipped
                        ? 'SKIPPED'
                        : 'WRONG',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color:
                          isCorrect
                              ? correctAnswerColor
                              : isSkipped
                              ? skippedAnswerColor
                              : wrongAnswerColor,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    '$questionNumber. ${result.question}',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color:
                          themeController.isDarkMode.value
                              ? Colors.white
                              : const Color(0xFF1F2937),
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24.0),
            Divider(
              color:
                  themeController.isDarkMode.value
                      ? Colors.white24
                      : Colors.grey.shade300,
            ),
            const SizedBox(height: 16.0),

            // Show user answer if not correct
            if (!isCorrect) ...[
              _buildAnswerRow(
                'Your Answer:',
                result.selectedOption,
                isSkipped ? skippedAnswerColor : wrongAnswerColor,
              ),
              const SizedBox(height: 16.0),
            ],

            // Always show correct answer
            _buildAnswerRow(
              'Correct Answer:',
              result.correctOption,
              correctAnswerColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnswerRow(String label, String answer, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color:
                themeController.isDarkMode.value
                    ? Colors.white70
                    : Colors.grey.shade600,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: color.withOpacity(0.3)),
          ),
          child: Text(
            answer,
            style: TextStyle(
              fontSize: 16,
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
