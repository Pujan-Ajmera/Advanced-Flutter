import 'package:get/get.dart';
import '../../utils/import_export.dart';

class EnhancedCodeBlock extends StatelessWidget {
  final String code;
  final String language;
  final ThemeController themeController = Get.find<ThemeController>();

  EnhancedCodeBlock({Key? key, required this.code, this.language = 'dart'})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color:
                themeController.isDarkMode.value
                    ? Colors.grey[700]!
                    : Colors.grey[300]!,
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with language and copy button
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color:
                    themeController.isDarkMode.value
                        ? Colors.grey[800]
                        : Colors.grey[100],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.code,
                        size: 16,
                        color:
                            themeController.isDarkMode.value
                                ? Colors.grey[400]
                                : Colors.grey[600],
                      ),
                      const SizedBox(width: 8),
                      Text(
                        language.toUpperCase(),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color:
                              themeController.isDarkMode.value
                                  ? Colors.grey[400]
                                  : Colors.grey[600],
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(6),
                      onTap: () => _copyToClipboard(code),
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: const Color(0xFF2B2D42).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.content_copy,
                              size: 14,
                              color: const Color(0xFF2B2D42),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Copy',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF2B2D42),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Code content
            Container(
              width: double.infinity,
              child: HighlightView(
                code,
                language: language,
                theme: darculaTheme, // Use consistent dark theme
                padding: const EdgeInsets.all(16),
                textStyle: const TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 14,
                  height: 1.4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _copyToClipboard(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
    Get.snackbar(
      'Copied! ✅',
      'Code copied to clipboard',
      duration: const Duration(seconds: 2),
      snackPosition: SnackPosition.TOP,
      backgroundColor: const Color(0xFF2B2D42),
      colorText: Colors.white,
      borderRadius: 8,
      margin: const EdgeInsets.all(16),
      icon: const Icon(Icons.check_circle, color: Colors.white, size: 20),
    );
  }
}

// Helper function to create enhanced code blocks from description text
List<Widget> buildEnhancedDescriptionWidgets(String rawDescription) {
  final ThemeController themeController = Get.find<ThemeController>();
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
      widgets.add(EnhancedCodeBlock(code: content));
    } else {
      widgets.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: SelectableText(
            content,
            style: TextStyle(
              fontSize: 16,
              color:
                  themeController.isDarkMode.value
                      ? Colors.white
                      : const Color(0xFF1F2937),
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
