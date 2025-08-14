import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/darcula.dart';
import 'package:flutter_highlight/themes/monokai.dart';
import 'package:get/get.dart';

import '../../utils/import_export.dart';

class ConceptDetailView extends StatelessWidget {
  final dynamic concept;
  final String categoryName;

  const ConceptDetailView({super.key, required this.concept, required this.categoryName});

  // List<Widget> buildDescriptionWidgets(String rawDescription) {
  //   List<Widget> widgets = [];
  //   final parts = rawDescription.split(RegExp(r'<pre>|</pre>'));
  //
  //   for (int i = 0; i < parts.length; i++) {
  //     final isCodeBlock = i % 2 == 1;
  //     final content = parts[i].trim();
  //
  //     if (content.isEmpty) continue;
  //
  //     if (isCodeBlock) {
  //       widgets.add(
  //         Container(
  //           margin: const EdgeInsets.symmetric(vertical: 16),
  //           decoration: BoxDecoration(
  //             color: const Color(0xFF0D1117),
  //             borderRadius: BorderRadius.circular(8),
  //             border: Border.all(color: const Color(0xFF21262D), width: 1),
  //           ),
  //           child: HighlightView(
  //             content,
  //             language: 'javascript',
  //             theme: monokaiTheme,
  //             padding: const EdgeInsets.all(16),
  //             textStyle: const TextStyle(
  //               fontFamily: 'monospace',
  //               fontSize: 14,
  //               height: 1.5,
  //             ),
  //           ),
  //         ),
  //       );
  //     } else {
  //       widgets.add(
  //         Padding(
  //           padding: const EdgeInsets.symmetric(vertical: 8),
  //           child: Text(
  //             content,
  //             style: const TextStyle(
  //               fontSize: 16,
  //               color: Color(0xFFE6EDF3),
  //               height: 1.6,
  //             ),
  //           ),
  //         ),
  //       );
  //     }
  //   }
  //   return widgets;
  // }
  // List<Widget> buildDescriptionWidgets(String rawDescription) {
  //   List<Widget> widgets = [];
  //   final parts = rawDescription.split(RegExp(r'<pre>|</pre>'));
  //
  //   for (int i = 0; i < parts.length; i++) {
  //     final isCodeBlock = i % 2 == 1;
  //     final content = parts[i].trim();
  //
  //     if (content.isEmpty) continue;
  //
  //     if (isCodeBlock) {
  //       widgets.add(
  //         Stack(
  //           children: [
  //             Container(
  //               margin: const EdgeInsets.symmetric(vertical: 16),
  //               decoration: BoxDecoration(
  //                 color: const Color(0xFF0D1117),
  //                 borderRadius: BorderRadius.circular(8),
  //                 border: Border.all(color: const Color(0xFF21262D), width: 1),
  //               ),
  //               child: HighlightView(
  //                 content,
  //                 language: 'javascript',
  //                 theme: monokaiTheme,
  //                 padding: const EdgeInsets.all(16),
  //                 textStyle: const TextStyle(
  //                   fontFamily: 'monospace',
  //                   fontSize: 14,
  //                   height: 1.5,
  //                 ),
  //               ),
  //             ),
  //             Positioned(
  //               top: 8,
  //               right: 8,
  //               child: Container(
  //                 decoration: BoxDecoration(
  //                   color: const Color(0xFF161B22),
  //                   borderRadius: BorderRadius.circular(4),
  //                   border: Border.all(color: const Color(0xFF30363D)),
  //                 ),
  //                 child: IconButton(
  //                   icon: const Icon(Icons.content_copy, size: 18),
  //                   color: const Color(0xFFE6EDF3),
  //                   onPressed: () {
  //                     Clipboard.setData(ClipboardData(text: content));
  //                     ScaffoldMessenger.of(Get.context!).showSnackBar(
  //                       const SnackBar(
  //                         content: Text('Code copied to clipboard'),
  //                         duration: Duration(seconds: 2),
  //                       ),
  //                     );
  //                   },
  //                   padding: const EdgeInsets.all(4),
  //                   constraints: const BoxConstraints(),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       );
  //     } else {
  //       widgets.add(
  //         Padding(
  //           padding: const EdgeInsets.symmetric(vertical: 8),
  //           child: Text(
  //             content,
  //             style: const TextStyle(
  //               fontSize: 16,
  //               color: Color(0xFFE6EDF3),
  //               height: 1.6,
  //             ),
  //           ),
  //         ),
  //       );
  //     }
  //   }
  //   return widgets;
  // }

  List<Widget> buildDescriptionWidgets(String rawDescription) {
    List<Widget> widgets = [];
    final parts = rawDescription.split(RegExp(r'<pre>|</pre>'));

    for (int i = 0; i < parts.length; i++) {
      final isCodeBlock = i % 2 == 1;
      final content = parts[i]
          .trim()
          .replaceAll('&lt;', '<')
          .replaceAll('&gt;', '>')
          .replaceAll('&amp;', '&');

      if (content.isEmpty) continue;

      if (isCodeBlock) {
        widgets.add(
          Stack(
            children: [
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: HighlightView(
                  content,
                  language: 'dart',
                  theme: darculaTheme,
                  padding: const EdgeInsets.all(12),
                  textStyle: const TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 14,
                  ),
                ),
              ),
              Positioned(
                top: 4,
                right: 4,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.content_copy, size: 16),
                    color: Colors.white,
                    onPressed: () async {
                      await Clipboard.setData(ClipboardData(text: content));
                      Get.snackbar(
                        'Copied',
                        'Code copied to clipboard',
                        duration: const Duration(seconds: 1),
                        snackPosition: SnackPosition.TOP,
                        backgroundColor: Colors.grey[800],
                        colorText: Colors.white,
                      );
                    },
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ),
              ),
            ],
          ),
        );
      } else {
        widgets.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: SelectableText(
              content,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w500,
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
      backgroundColor: const Color(0xFF0D1117),
      appBar: AppBar(
        backgroundColor: const Color(0xFF161B22),
        elevation: 0,
        title: Text(
          concept.name.toString(),
          style: const TextStyle(
            fontSize: 18,
            color: Color(0xFFE6EDF3),
          ),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back, color: Color(0xFFE6EDF3)),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category label
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: color.withOpacity(0.3)),
              ),
              child: Text(
                categoryName,
                style: TextStyle(
                  color: color,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Description section
            const Text(
              'Description',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xFFE6EDF3),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF161B22),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: buildDescriptionWidgets(concept.description.toString()),
              ),
            ),
            const SizedBox(height: 24),
            // Container(
            //   width: double.infinity,
            //   padding: const EdgeInsets.all(16),
            //   decoration: BoxDecoration(
            //     color: const Color(0xFF161B22),
            //     borderRadius: BorderRadius.circular(8),
            //   ),
            //   child: Column(
            //     children: [
            //       _buildDetailItem('Concept ID', concept.id.toString()),
            //       const SizedBox(height: 12),
            //       _buildDetailItem('Category ID', concept.categoryId.toString()),
            //     ],
            //   ),
            // ),
            // const SizedBox(height: 24),

            // Back button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.back(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: color,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
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

  Widget _buildDetailItem(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF7D8590),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFFE6EDF3),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Color _getCategoryColor(int index) {
    final colors = [
      const Color(0xFFFF6B6B), // Coral red
      const Color(0xFF4ECDC4), // Turquoise
      const Color(0xFF45B7D1), // Sky blue
      const Color(0xFF96CEB4), // Mint green
      const Color(0xFFFFA726), // Orange
      const Color(0xFFAB47BC), // Purple
    ];
    return colors[index % colors.length];
  }
}
final customDarculaTheme = {
  ...darculaTheme, // Start with the original Darcula theme
  'brace': TextStyle(color: Color(0xFFFFD700)), // Gold color for braces
  'punctuation': TextStyle(color: Color(0xFF569CD6)), // Blue for other punctuation
};