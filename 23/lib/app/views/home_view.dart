//region previous working code
// import 'package:get/get.dart';
// import '../../utils/import_export.dart';
// class HomeView extends StatelessWidget {
//   final DBController controller = Get.find();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[50],
//       appBar: AppBar(
//         title: Text(
//           "Categories",
//           style: TextStyle(
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//         backgroundColor: Colors.indigo[600],
//         elevation: 0,
//         centerTitle: true,
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Colors.indigo[600]!,
//               Colors.grey[50]!,
//             ],
//             stops: [0.0, 0.3],
//           ),
//         ),
//         child: Obx(() {
//           if (controller.categories.isEmpty) {
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   CircularProgressIndicator(
//                     valueColor: AlwaysStoppedAnimation<Color>(Colors.indigo[600]!),
//                     strokeWidth: 3,
//                   ),
//                   SizedBox(height: 16),
//                   Text(
//                     "Loading categories...",
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.grey[600],
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           }
//
//           return Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: ListView.builder(
//               itemCount: controller.categories.length,
//               itemBuilder: (_, index) {
//                 final category = controller.categories[index];
//                 return Container(
//                   margin: EdgeInsets.only(bottom: 16),
//                   child: Card(
//                     elevation: 4,
//                     shadowColor: Colors.black26,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                     child: InkWell(
//                       borderRadius: BorderRadius.circular(16),
//                       onTap: () {
//                         print('this is the id from home page ${category.id}');
//                         controller.fetchConcepts(category.id);
//                         Get.to(() => ConceptView(category.name,category.description));
//                       },
//                       child: Container(
//                         padding: EdgeInsets.all(20),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(16),
//                           gradient: LinearGradient(
//                             begin: Alignment.topLeft,
//                             end: Alignment.bottomRight,
//                             colors: [
//                               Colors.white,
//                               Colors.grey[50]!,
//                             ],
//                           ),
//                         ),
//                         child: Row(
//                           children: [
//                             Container(
//                               width: 60,
//                               height: 60,
//                               decoration: BoxDecoration(
//                                 color: Colors.indigo[100],
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                               child: Icon(
//                                 Icons.category_rounded,
//                                 color: Colors.indigo[600],
//                                 size: 28,
//                               ),
//                             ),
//                             SizedBox(width: 16),
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     category.name,
//                                     style: TextStyle(
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.grey[800],
//                                     ),
//                                   ),
//                                   SizedBox(height: 8),
//                                   Text(
//                                     category.description,
//                                     style: TextStyle(
//                                       fontSize: 14,
//                                       color: Colors.grey[600],
//                                       height: 1.4,
//                                     ),
//                                     maxLines: 2,
//                                     overflow: TextOverflow.ellipsis,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Icon(
//                               Icons.arrow_forward_ios_rounded,
//                               color: Colors.grey[400],
//                               size: 18,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           );
//         }),
//       ),
//     );
//   }
// }
//endregion
// region working code
// import 'package:get/get.dart';
// import '../../utils/import_export.dart';
//
// class HomeView extends StatelessWidget {
//   final DBController controller = Get.find();
//   final RxBool isGridView = false.obs;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text(
//           "NextJS Learning.",
//           style: TextStyle(
//             fontSize: 22,
//             fontWeight: FontWeight.w900,
//             color: Colors.white,
//             letterSpacing: 1.5,
//           ),
//         ),
//         backgroundColor: const Color(0xFF2B2D42),
//         elevation: 0,
//         centerTitle: true,
//         toolbarHeight: 70,
//         actions: [
//           Obx(() => IconButton(
//             icon: Icon(
//               isGridView.value ? Icons.list : Icons.grid_view,
//               color: Colors.white,
//             ),
//             onPressed: () {
//               isGridView.toggle();
//             },
//           )),
//         ],
//       ),
//       body: Container(
//         color: Colors.white,
//         child: Obx(() {
//           if (controller.categories.isEmpty) {
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     width: 60,
//                     height: 60,
//                     child: CircularProgressIndicator(
//                       valueColor: AlwaysStoppedAnimation<Color>(
//                         const Color(0xFF2B2D42),
//                       ),
//                       strokeWidth: 4,
//                     ),
//                   ),
//                   const SizedBox(height: 25),
//                   Text(
//                     "Loading Knowledge Categories",
//                     style: TextStyle(
//                       fontSize: 18,
//                       color: const Color(0xFF2B2D42),
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           }
//
//           return Obx(() {
//             if (isGridView.value) {
//               return Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: GridView.builder(
//                   physics: const BouncingScrollPhysics(),
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     crossAxisSpacing: 16,
//                     mainAxisSpacing: 16,
//                     childAspectRatio: 0.85,
//                   ),
//                   itemCount: controller.categories.length,
//                   itemBuilder: (_, index) {
//                     return _buildGridCard(index);
//                   },
//                 ),
//               );
//             } else {
//               return Padding(
//                 padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
//                 child: ListView.builder(
//                   physics: const BouncingScrollPhysics(),
//                   itemCount: controller.categories.length,
//                   itemBuilder: (_, index) {
//                     return Padding(
//                       padding: const EdgeInsets.only(bottom: 16),
//                       child: _buildListCard(index),
//                     );
//                   },
//                 ),
//               );
//             }
//           });
//         }),
//       ),
//     );
//   }
//
//   Widget _buildListCard(int index) {
//     final category = controller.categories[index];
//     final color = _getCategoryColor(index);
//
//     return SizedBox(
//       height: 100,
//       child: Material(
//         color: Colors.transparent,
//         child: InkWell(
//           borderRadius: BorderRadius.circular(16),
//           onTap: () => _navigateToConceptView(category),
//           splashColor: color.withOpacity(0.2),
//           highlightColor: Colors.transparent,
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(16),
//               color: color.withOpacity(0.1), // Solid light color
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.1),
//                   blurRadius: 10,
//                   offset: const Offset(0, 4),
//                 ),
//               ],
//               border: Border.all(
//                 color: color.withOpacity(0.2),
//                 width: 1,
//               ),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Row(
//                 children: [
//                   Container(
//                     width: 60,
//                     height: 60,
//                     decoration: BoxDecoration(
//                       color: color.withOpacity(0.2),
//                       borderRadius: BorderRadius.circular(12),
//                       border: Border.all(
//                         color: color.withOpacity(0.4),
//                         width: 2,
//                       ),
//                     ),
//                     child: Icon(
//                       _getCategoryIcon(index),
//                       color: color,
//                       size: 28,
//                     ),
//                   ),
//                   const SizedBox(width: 16),
//                   Expanded(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           category.name,
//                           style: const TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w700,
//                             color: Color(0xFF2B2D42),
//                           ),
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         const SizedBox(height: 4),
//                         Text(
//                           'ID: ${category.id}',
//                           style: TextStyle(
//                             fontSize: 12,
//                             color: Colors.grey[700],
//                           ),
//                         ),
//                         const SizedBox(height: 4),
//                         Text(
//                           category.description,
//                           style: TextStyle(
//                             fontSize: 12,
//                             color: Colors.grey[600],
//                           ),
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ],
//                     ),
//                   ),
//                   Icon(
//                     Icons.arrow_forward_ios_rounded,
//                     color: color,
//                     size: 16,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildGridCard(int index) {
//     final category = controller.categories[index];
//     final color = _getCategoryColor(index);
//
//     return Material(
//       color: Colors.transparent,
//       child: InkWell(
//         borderRadius: BorderRadius.circular(16),
//         onTap: () => _navigateToConceptView(category),
//         splashColor: color.withOpacity(0.2),
//         highlightColor: Colors.transparent,
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(16),
//             color: color.withOpacity(0.1), // Solid light color
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.1),
//                 blurRadius: 10,
//                 offset: const Offset(0, 4),
//               ),
//             ],
//             border: Border.all(
//               color: color.withOpacity(0.2),
//               width: 1,
//             ),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(12),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   width: 50,
//                   height: 50,
//                   decoration: BoxDecoration(
//                     color: color.withOpacity(0.2),
//                     borderRadius: BorderRadius.circular(12),
//                     border: Border.all(
//                       color: color.withOpacity(0.4),
//                       width: 2,
//                     ),
//                   ),
//                   child: Icon(
//                     _getCategoryIcon(index),
//                     color: color,
//                     size: 24,
//                   ),
//                 ),
//                 const SizedBox(height: 12),
//                 Text(
//                   category.name,
//                   style: const TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w700,
//                     color: Color(0xFF2B2D42),
//                   ),
//                   textAlign: TextAlign.center,
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   'ID: ${category.id}',
//                   style: TextStyle(
//                     fontSize: 11,
//                     color: Colors.grey[700],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _navigateToConceptView(Category category) {
//     controller.fetchConcepts(category.id);
//     Get.to(() => ConceptView(category.name, category.description));
//   }
//
//   Color _getCategoryColor(int index) {
//     final colors = [
//       const Color(0xFFEF476F),
//       const Color(0xFF118AB2),
//       const Color(0xFF06D6A0),
//       const Color(0xFF7209B7),
//       const Color(0xFFF8961E),
//       const Color(0xFF073B4C),
//     ];
//     return colors[index % colors.length];
//   }
//
//   IconData _getCategoryIcon(int index) {
//     final icons = [
//       Icons.lightbulb_outline,
//       Icons.code,
//       Icons.science,
//       Icons.calculate,
//       Icons.language,
//       Icons.history_edu,
//     ];
//     return icons[index % icons.length];
//   }
// }
// endregion

import 'package:get/get.dart';
import '../../utils/import_export.dart';
import 'about_us_page.dart';
import 'aswdc_feedback.dart';
import 'quiz_topic_selection_view.dart';
import 'topic_learning_view.dart';
import '../controllers/statistics_controller.dart';

class HomeView extends StatelessWidget {
  final DBController controller = Get.find();
  final ThemeController themeController = Get.find();
  late final StatisticsController statisticsController;
  final RxBool isGridView = false.obs;

  HomeView({super.key}) {
    // Initialize StatisticsController with fallback
    try {
      statisticsController = Get.find<StatisticsController>();
    } catch (e) {
      statisticsController = Get.put(StatisticsController());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor:
            themeController.isDarkMode.value
                ? const Color(0xFF111827)
                : Colors.white,
        appBar: CustomAppBar(title: "Hey User! 👋", isGridView: isGridView),
        body: Container(
          color:
              themeController.isDarkMode.value
                  ? const Color(0xFF111827)
                  : Colors.white,
          child: Obx(() {
            if (controller.categories.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).colorScheme.primary,
                        ),
                        strokeWidth: 4,
                      ),
                    ),
                    const SizedBox(height: 25),
                    Text(
                      "Loading Knowledge Categories",
                      style: TextStyle(
                        fontSize: 18,
                        color:
                            themeController.isDarkMode.value
                                ? Colors.white
                                : const Color(0xFF2B2D42),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              );
            }
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildStatisticsSection(),
                  _buildQuickActionsSection(),
                  _buildTopicsSection(),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildStatisticsSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Row(
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: const Color(0xFFEF476F),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.analytics,
                  color: Colors.white,
                  size: 18,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                "Your Learning Progress",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color:
                      themeController.isDarkMode.value
                          ? Colors.white
                          : const Color(0xFF1F2937),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Obx(
            () => Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    "${statisticsController.totalQuizTaken.value}",
                    "QUIZZES TAKEN",
                    Icons.quiz,
                    const Color(0xFFEF476F),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    "${statisticsController.averageMarks.value.toStringAsFixed(1)}%",
                    "AVERAGE SCORE",
                    Icons.trending_up,
                    const Color(0xFF06D6A0),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    "${controller.categories.length}",
                    "TOPICS",
                    Icons.category,
                    const Color(0xFF118AB2),
                  ),
                ),
              ],
            ),
          ),
          if (statisticsController.quizHistory.isNotEmpty) ...[
            const SizedBox(height: 16),
            _buildRecentQuizCard(),
          ],
        ],
      ),
    );
  }

  Widget _buildStatCard(
    String number,
    String label,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color:
            themeController.isDarkMode.value
                ? const Color(0xFF1F2937)
                : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.2), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 8),
          Text(
            number,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color:
                  themeController.isDarkMode.value
                      ? Colors.white
                      : const Color(0xFF1F2937),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color:
                  themeController.isDarkMode.value
                      ? Colors.grey[400]
                      : Colors.grey[600],
              letterSpacing: 1.2,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildTopicsSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: const Color(0xFF2B2D42),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Icon(
                  Icons.blur_circular_sharp,
                  color: Colors.white,
                  size: 16,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                "Individual Topics",
                style: TextStyle(
                  fontSize: 20,
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
            "Dive deep into specific topics for focused learning",
            style: TextStyle(
              fontSize: 14,
              color:
                  themeController.isDarkMode.value
                      ? Colors.grey[400]
                      : Colors.grey[600],
            ),
          ),
          const SizedBox(height: 20),
          Obx(() {
            if (isGridView.value) {
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.9,
                ),
                itemCount: controller.categories.length,
                itemBuilder: (_, index) => _buildCompactTopicCard(index),
              );
            } else {
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.categories.length,
                itemBuilder:
                    (_, index) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: _buildTopicCard(index),
                    ),
              );
            }
          }),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildTopicCard(int index) {
    final category = controller.categories[index];
    final color = _getCategoryColor(index);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => _navigateToConceptView(category),
        splashColor: color.withOpacity(0.2),
        highlightColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color:
                themeController.isDarkMode.value
                    ? const Color(0xFF1F2937)
                    : Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: color.withOpacity(0.3), width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                category.name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: color,
                  letterSpacing: 1.1,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                category.description,
                style: TextStyle(
                  fontSize: 14,
                  color:
                      themeController.isDarkMode.value
                          ? Colors.white
                          : const Color(0xFF1F2937),
                  height: 1.4,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'View Details',
                    style: TextStyle(
                      fontSize: 12,
                      color: color,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCompactTopicCard(int index) {
    final category = controller.categories[index];
    final color = _getCategoryColor(index);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => _navigateToConceptView(category),
        splashColor: color.withOpacity(0.2),
        highlightColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color:
                themeController.isDarkMode.value
                    ? const Color(0xFF1F2937)
                    : Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: color.withOpacity(0.3), width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                category.name,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Expanded(
                child: Text(
                  category.description,
                  style: TextStyle(
                    fontSize: 12,
                    color:
                        themeController.isDarkMode.value
                            ? Colors.white70
                            : Colors.black87,
                    height: 1.4,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 3),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  'View',
                  style: TextStyle(
                    fontSize: 11,
                    color: color,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color:
                themeController.isDarkMode.value
                    ? const Color(0xFF1F2937)
                    : Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: color.withOpacity(0.2), width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 24),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color:
                      themeController.isDarkMode.value
                          ? Colors.white
                          : const Color(0xFF1F2937),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 12,
                  color:
                      themeController.isDarkMode.value
                          ? Colors.grey[400]
                          : Colors.grey[600],
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getCategoryColor(int index) {
    final colors = [
      const Color(0xFFEF476F), // Pink
      const Color(0xFF118AB2), // Blue
      const Color(0xFF06D6A0), // Green
      const Color(0xFF7209B7), // Purple
      const Color(0xFFF8961E), // Orange
      const Color(0xFF9D4EDD), // Light Purple
    ];
    return colors[index % colors.length];
  }

  Widget _buildQuickActionsSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: const Color(0xFF118AB2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.flash_on,
                  color: Colors.white,
                  size: 18,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                "Quick Actions",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color:
                      themeController.isDarkMode.value
                          ? Colors.white
                          : const Color(0xFF1F2937),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildActionButton(
                  title: "Take Quiz",
                  subtitle: "Custom quiz from multiple topics",
                  icon: Icons.quiz,
                  color: const Color(0xFFEF476F),
                  onTap: () => Get.to(() => QuizTopicSelectionView()),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildRecentQuizCard() {
    return Obx(() {
      final recentQuiz = statisticsController.quizHistory.first;
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color:
              themeController.isDarkMode.value
                  ? const Color(0xFF1F2937)
                  : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color(0xFFEF476F).withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.history, color: const Color(0xFFEF476F), size: 16),
                const SizedBox(width: 8),
                Text(
                  'Latest Quiz',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFFEF476F),
                  ),
                ),
                const Spacer(),
                Text(
                  statisticsController.getFormattedDate(recentQuiz['date']),
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
            const SizedBox(height: 8),
            Text(
              recentQuiz['topics'],
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color:
                    themeController.isDarkMode.value
                        ? Colors.white
                        : const Color(0xFF1F2937),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  '${recentQuiz['score']}/${recentQuiz['total']}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color:
                        recentQuiz['percentage'] >= 70
                            ? const Color(0xFF06D6A0)
                            : const Color(0xFFEF476F),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '(${recentQuiz['percentage'].toStringAsFixed(1)}%)',
                  style: TextStyle(
                    fontSize: 12,
                    color:
                        themeController.isDarkMode.value
                            ? Colors.grey[400]
                            : Colors.grey[600],
                  ),
                ),
                const Spacer(),
                Text(
                  recentQuiz['timeTaken'],
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
          ],
        ),
      );
    });
  }

  void _navigateToConceptView(Category category) {
    controller.fetchConcepts(category.id);
    Get.to(() => ConceptView(category.name, category.description));
  }
}
