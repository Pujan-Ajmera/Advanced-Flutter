// import 'package:flutter_highlight/flutter_highlight.dart';
// import 'package:flutter_highlight/themes/github.dart';
// import 'package:get/get.dart';
// import '../../utils/import_export.dart';
//
// class ConceptDetailView extends StatelessWidget {
//   final dynamic concept;
//   final String categoryName;
//
//   ConceptDetailView({required this.concept, required this.categoryName});
//
//   List<Widget> buildDescriptionWidgets(String rawDescription) {
//     List<Widget> widgets = [];
//
//     final parts = rawDescription.split(RegExp(r'<pre>|</pre>'));
//     for (int i = 0; i < parts.length; i++) {
//       final isCodeBlock = i % 2 == 1;
//       final content = parts[i].trim();
//
//       if (content.isEmpty) continue;
//
//       if (isCodeBlock) {
//         widgets.add(
//           Stack(
//             children: [
//               Container(
//                 width: double.infinity,
//                 padding: const EdgeInsets.all(12),
//                 margin: const EdgeInsets.only(bottom: 12),
//                 decoration: BoxDecoration(
//                   color: Colors.grey[200],
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: HighlightView(
//                   content,
//                   language: 'javascript',
//                   theme: githubTheme,
//                   padding: const EdgeInsets.all(8),
//                   textStyle: const TextStyle(
//                     fontFamily: 'monospace',
//                     fontSize: 14,
//                   ),
//                 ),
//               ),
//               Positioned(
//                 top: 4,
//                 right: 4,
//                 child: IconButton(
//                   icon: const Icon(Icons.copy, size: 20, color: Colors.black54),
//                   tooltip: 'Copy Code',
//                   onPressed: () {
//                     Clipboard.setData(ClipboardData(text: content));
//                     ScaffoldMessenger.of(Get.context!).showSnackBar(
//                       SnackBar(
//                         content: Text("Code copied to clipboard!"),
//                         duration: Duration(seconds: 2),
//                         backgroundColor: Colors.green[600],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         );
//       } else {
//         widgets.add(
//           Padding(
//             padding: const EdgeInsets.only(bottom: 12),
//             child: Text(
//               content,
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.grey[700],
//                 height: 1.6,
//               ),
//             ),
//           ),
//         );
//       }
//     }
//
//     return widgets;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[50],
//       appBar: AppBar(
//         title: Text(
//           concept.name,
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//         backgroundColor: Colors.indigo[600],
//         elevation: 0,
//         centerTitle: true,
//         iconTheme: IconThemeData(color: Colors.white),
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
//             stops: [0.0, 0.2],
//           ),
//         ),
//         child: SingleChildScrollView(
//           padding: EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Breadcrumb Navigation
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(12),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black12,
//                       blurRadius: 4,
//                       offset: Offset(0, 2),
//                     ),
//                   ],
//                 ),
//                 child: Row(
//                   children: [
//                     Icon(
//                       Icons.route_rounded,
//                       color: Colors.indigo[600],
//                       size: 20,
//                     ),
//                     SizedBox(width: 8),
//                     Expanded(
//                       child: Text(
//                         "Categories / $categoryName / ${concept.name}",
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.grey[700],
//                           fontWeight: FontWeight.w500,
//                         ),
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//
//               SizedBox(height: 20),
//
//               // Main Content Card
//               Container(
//                 width: double.infinity,
//                 padding: EdgeInsets.all(24),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(16),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black12,
//                       blurRadius: 8,
//                       offset: Offset(0, 4),
//                     ),
//                   ],
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Header with Icon
//                     Row(
//                       children: [
//                         Container(
//                           width: 60,
//                           height: 60,
//                           decoration: BoxDecoration(
//                             color: Colors.indigo[100],
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           child: Icon(
//                             Icons.abc,
//                             color: Colors.indigo[600],
//                             size: 30,
//                           ),
//                         ),
//                         SizedBox(width: 16),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 concept.name,
//                                 style: TextStyle(
//                                   fontSize: 24,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.grey[800],
//                                 ),
//                               ),
//                               SizedBox(height: 4),
//                               Container(
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: 12, vertical: 6),
//                                 decoration: BoxDecoration(
//                                   color: Colors.indigo[50],
//                                   borderRadius: BorderRadius.circular(20),
//                                 ),
//                                 child: Text(
//                                   categoryName,
//                                   style: TextStyle(
//                                     fontSize: 12,
//                                     color: Colors.indigo[600],
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//
//                     SizedBox(height: 24),
//
//                     // Description Section
//                     Container(
//                       // width: double.infinity,
//                       // padding: EdgeInsets.all(20),
//                       decoration: BoxDecoration(
//                         color: Colors.grey[50],
//                         borderRadius: BorderRadius.circular(12),
//                         border: Border.all(color: Colors.grey[200]!),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               Icon(
//                                 Icons.description_rounded,
//                                 color: Colors.indigo[600],
//                                 size: 20,
//                               ),
//                               SizedBox(width: 8),
//                               Text(
//                                 "Description",
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.grey[800],
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: 16),
//                           ...buildDescriptionWidgets(concept.description),
//                         ],
//                       ),
//                     ),
//
//                     SizedBox(height: 20),
//
//                     // Concept Info Section
//                     Container(
//                       width: double.infinity,
//                       padding: EdgeInsets.all(20),
//                       decoration: BoxDecoration(
//                         color: Colors.blue[50],
//                         borderRadius: BorderRadius.circular(12),
//                         border: Border.all(color: Colors.blue[200]!),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               Icon(
//                                 Icons.info_outline_rounded,
//                                 color: Colors.blue[600],
//                                 size: 20,
//                               ),
//                               SizedBox(width: 8),
//                               Text(
//                                 "Concept Details",
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.grey[800],
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: 16),
//                           Row(
//                             children: [
//                               Icon(
//                                 Icons.tag_rounded,
//                                 color: Colors.blue[600],
//                                 size: 16,
//                               ),
//                               SizedBox(width: 8),
//                               Text(
//                                 "Concept ID: ${concept.id}",
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   color: Colors.grey[600],
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: 8),
//                           Row(
//                             children: [
//                               Icon(
//                                 Icons.category_rounded,
//                                 color: Colors.blue[600],
//                                 size: 16,
//                               ),
//                               SizedBox(width: 8),
//                               Text(
//                                 "Category ID: ${concept.categoryId}",
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   color: Colors.grey[600],
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//
//               SizedBox(height: 20),
//
//               // Back Button
//               Container(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () => Get.back(),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.indigo[600],
//                     foregroundColor: Colors.white,
//                     padding: EdgeInsets.symmetric(vertical: 16),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     elevation: 2,
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(Icons.arrow_back_rounded, size: 20),
//                       SizedBox(width: 8),
//                       Text(
//                         "Back to $categoryName",
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import '../../utils/import_export.dart';

class ConceptDetailView extends StatelessWidget {
  final dynamic concept;
  final String categoryName;

  ConceptDetailView({required this.concept, required this.categoryName});

  List<Widget> buildDescriptionWidgets(String rawDescription) {
    List<Widget> widgets = [];

    final parts = rawDescription.split(RegExp(r'<pre>|</pre>'));
    for (int i = 0; i < parts.length; i++) {
      final isCodeBlock = i % 2 == 1;
      final content = parts[i].trim();

      if (content.isEmpty) continue;

      if (isCodeBlock) {
        widgets.add(
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: const Color(0xFFE2E8F0),
                width: 1,
              ),
            ),
            child: HighlightView(
              content,
              language: 'javascript',
              theme: githubTheme,
              padding: const EdgeInsets.all(8),
              textStyle: const TextStyle(
                fontFamily: 'monospace',
                fontSize: 14,
              ),
            ),
          ),
        );
      } else {
        widgets.add(
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              content,
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF4B5563),
                height: 1.6,
              ),
            ),
          ),
        );
      }
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    final color = _getCategoryColor(categoryName.hashCode % 6);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          concept.name.toString(),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        backgroundColor: color,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Breadcrumb Navigation with overflow handling
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 4,
                runSpacing: 4,
                children: [
                  _BreadcrumbItem(
                    text: 'Categories',
                    isActive: false,
                    color: color,
                  ),
                  _BreadcrumbDivider(color: color),
                  _BreadcrumbItem(
                    text: categoryName,
                    isActive: false,
                    color: color,
                  ),
                  _BreadcrumbDivider(color: color),
                  _BreadcrumbItem(
                    text: concept.name.toString(),
                    isActive: true,
                    color: color,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Main Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
                border: Border.all(
                  color: Colors.grey[200]!,
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: color.withOpacity(0.3),
                            width: 1.5,
                          ),
                        ),
                        child: Icon(
                          _getConceptIcon(categoryName.hashCode % 6),
                          color: color,
                          size: 30,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              concept.name.toString(),
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF1F2937),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              decoration: BoxDecoration(
                                color: color.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                categoryName,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: color,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Description Section
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1F2937),
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...buildDescriptionWidgets(concept.description.toString()),

                  const SizedBox(height: 24),

                  // Metadata Section
                  const Text(
                    'Details',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1F2937),
                    ),
                  ),
                  const SizedBox(height: 12),
                  _DetailRow(
                    icon: Icons.tag_rounded,
                    label: 'Concept ID',
                    value: concept.id.toString(),
                    color: color,
                  ),
                  const SizedBox(height: 8),
                  _DetailRow(
                    icon: Icons.category_rounded,
                    label: 'Category ID',
                    value: concept.categoryId.toString(),
                    color: color,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Back Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.back(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: color,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Back to Concepts',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getCategoryColor(int index) {
    final colors = [
      const Color(0xFFEF476F), // Vibrant red
      const Color(0xFF118AB2), // Ocean blue
      const Color(0xFF06D6A0), // Emerald green
      const Color(0xFF7209B7), // Royal purple
      const Color(0xFFF8961E), // Sunset orange
      const Color(0xFF073B4C), // Dark teal
    ];
    return colors[index % colors.length];
  }

  IconData _getConceptIcon(int index) {
    final icons = [
      Icons.lightbulb_outline,
      Icons.code_rounded,
      Icons.science_rounded,
      Icons.calculate_rounded,
      Icons.language_rounded,
      Icons.history_edu_rounded,
    ];
    return icons[index % icons.length];
  }
}

class _BreadcrumbItem extends StatelessWidget {
  final String text;
  final bool isActive;
  final Color color;

  const _BreadcrumbItem({
    required this.text,
    required this.isActive,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isActive ? color.withOpacity(0.1) : null,
        borderRadius: BorderRadius.circular(20),
        border: isActive
            ? Border.all(
          color: color.withOpacity(0.3),
          width: 1,
        )
            : null,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          color: isActive ? color : Colors.grey[600],
          fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
        ),
      ),
    );
  }
}

class _BreadcrumbDivider extends StatelessWidget {
  final Color color;

  const _BreadcrumbDivider({required this.color});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.chevron_right_rounded,
      size: 20,
      color: Colors.grey[400],
    );
  }
}

class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _DetailRow({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            size: 20,
            color: color,
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 2),
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF1F2937),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}