import 'package:get/get.dart';
import '../../utils/import_export.dart';
import '../data/quiz_data.dart';
import 'concept_view.dart';

class TopicLearningView extends StatelessWidget {
  final ThemeController themeController = Get.find();
  final DBController dbController = Get.find();

  TopicLearningView({super.key});

  @override
  Widget build(BuildContext context) {
    final availableTopics = QuizData.getTopicNames();

    return Obx(
      () => Scaffold(
        backgroundColor:
            themeController.isDarkMode.value
                ? const Color(0xFF111827)
                : Colors.white,
        appBar: CustomAppBar(title: 'Learn Topics', showBackButton: true),
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
                        Icons.school,
                        color: const Color(0xFF118AB2),
                        size: 24,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Learning Center',
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
                    'Select a topic to explore detailed concepts and examples',
                    style: TextStyle(
                      fontSize: 14,
                      color:
                          themeController.isDarkMode.value
                              ? Colors.grey[400]
                              : Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF118AB2).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color(0xFF118AB2).withOpacity(0.3),
                      ),
                    ),
                    child: Text(
                      '${availableTopics.length} topics available',
                      style: const TextStyle(
                        color: Color(0xFF118AB2),
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
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
                  final questionsCount =
                      QuizData.getQuestionsForTopic(topic).length;
                  final color = _getTopicColor(index);

                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: () => _navigateToTopicLearning(topic),
                        splashColor: color.withOpacity(0.2),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color:
                                themeController.isDarkMode.value
                                    ? const Color(0xFF1F2937)
                                    : Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: color.withOpacity(0.3),
                              width: 1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              // Topic Icon
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: color.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: color.withOpacity(0.3),
                                    width: 2,
                                  ),
                                ),
                                child: Icon(
                                  _getTopicIcon(index),
                                  color: color,
                                  size: 28,
                                ),
                              ),
                              const SizedBox(width: 20),

                              // Topic Info
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      topic,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            themeController.isDarkMode.value
                                                ? Colors.white
                                                : const Color(0xFF1F2937),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      _getTopicDescription(topic),
                                      style: TextStyle(
                                        fontSize: 14,
                                        color:
                                            themeController.isDarkMode.value
                                                ? Colors.grey[400]
                                                : Colors.grey[600],
                                        height: 1.4,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 12),
                                    Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 4,
                                          ),
                                          decoration: BoxDecoration(
                                            color: color.withOpacity(0.1),
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                          child: Text(
                                            '$questionsCount concepts',
                                            style: TextStyle(
                                              color: color,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        const Spacer(),
                                        Text(
                                          'Tap to learn',
                                          style: TextStyle(
                                            color: color,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              // Arrow Icon
                              Icon(
                                Icons.arrow_forward_ios,
                                color: color,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToTopicLearning(String topic) {
    // Try to find a matching category for the topic
    final categories = dbController.categories;
    Category? matchingCategory;

    // First try exact match
    for (var category in categories) {
      if (category.name.toLowerCase() == topic.toLowerCase()) {
        matchingCategory = category;
        break;
      }
    }

    // If no exact match, try partial match
    if (matchingCategory == null) {
      for (var category in categories) {
        if (category.name.toLowerCase().contains(topic.toLowerCase()) ||
            topic.toLowerCase().contains(category.name.toLowerCase())) {
          matchingCategory = category;
          break;
        }
      }
    }

    if (matchingCategory != null) {
      // Navigate to existing concept view
      dbController.fetchConcepts(matchingCategory.id);
      Get.to(
        () => ConceptView(matchingCategory!.name, matchingCategory.description),
      );
    } else {
      // Create a fallback navigation for topics without categories
      Get.to(() => ConceptView(topic, _getTopicDescription(topic)));

      // Show a message to the user
      Get.snackbar(
        'Learning Mode',
        'Detailed concepts for \"$topic\" will be available soon!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFF118AB2),
        colorText: Colors.white,
      );
    }
  }

  Color _getTopicColor(int index) {
    final colors = [
      const Color(0xFF118AB2), // Blue
      const Color(0xFFEF476F), // Pink
      const Color(0xFF06D6A0), // Green
      const Color(0xFF7209B7), // Purple
      const Color(0xFFF8961E), // Orange
      const Color(0xFF9D4EDD), // Light Purple
      const Color(0xFFE63946), // Red
      const Color(0xFF457B9D), // Steel Blue
    ];
    return colors[index % colors.length];
  }

  IconData _getTopicIcon(int index) {
    final icons = [
      Icons.code, // React Fundamentals
      Icons.web, // Next.js Basics
      Icons.route, // Routing System
      Icons.phone_android, // Flutter Basics
      Icons.science,
      Icons.calculate,
      Icons.language,
      Icons.history_edu,
    ];
    return icons[index % icons.length];
  }

  String _getTopicDescription(String topic) {
    final descriptions = {
      'React Fundamentals':
          'Learn the core concepts of React including components, JSX, hooks, and state management',
      'Next.js Basics':
          'Explore Next.js framework for server-side rendering, static generation, and modern web apps',
      'Routing System':
          'Understand navigation, dynamic routes, and URL handling in modern web applications',
      'Flutter Basics':
          'Master Flutter widgets, Dart programming, and cross-platform mobile app development',
    };

    return descriptions[topic] ??
        'Comprehensive learning materials and practical examples for $topic';
  }
}
