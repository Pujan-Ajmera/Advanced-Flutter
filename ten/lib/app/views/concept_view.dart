import 'package:get/get.dart';
import '../../utils/import_export.dart';

class ConceptView extends StatelessWidget {
  final String categoryName;
  final String description;
  final DBController controller = Get.find();

  ConceptView(this.categoryName, this.description);

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
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF2B2D42).withOpacity(0.08),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: const Color(0xFF2B2D42).withOpacity(0.2),
                width: 1,
              ),
            ),
            child: SelectableText(
              content,
              style: const TextStyle(
                fontFamily: 'monospace',
                fontSize: 14,
                color: Color(0xFF2B2D42),
              ),
            ),
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
                color: Color(0xFF2B2D42),
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
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Get.to(QuizPage(name: categoryName));
      },child: Icon(Icons.quiz_outlined),),
      appBar: AppBar(
        title: Text(
          categoryName.toUpperCase(),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            letterSpacing: 1.2,
          ),
        ),
        backgroundColor: const Color(0xFF2B2D42),
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.zero, // Straight edge
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF2B2D42),
              Color(0xFFF8F9FA),
            ],
            stops: [0.0, 0.1],
          ),
        ),
        child: Obx(() {
          return Column(
            children: [
              // Description Container
              Container(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: buildDescriptionWidgets(description),
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: controller.concepts.isEmpty
                      ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off_rounded,
                          size: 60,
                          color: const Color(0xFF2B2D42).withOpacity(0.3),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "No concepts found",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF2B2D42),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Try selecting a different category",
                          style: TextStyle(
                            fontSize: 14,
                            color: const Color(0xFF2D3748).withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                  )
                      : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: controller.concepts.length,
                    itemBuilder: (context, index) {
                      final concept = controller.concepts[index];
                      final color = _getConceptColor(index);

                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(16),
                            onTap: () {
                              Get.to(() => ConceptDetailView(
                                concept: concept,
                                categoryName: categoryName,
                              ));
                            },
                            splashColor: color.withOpacity(0.2),
                            highlightColor: Colors.transparent,
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    color.withOpacity(0.15),
                                    Colors.white.withOpacity(0.9),
                                  ],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: color.withOpacity(0.1),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                                border: Border.all(
                                  color: color.withOpacity(0.3),
                                  width: 1.5,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: color.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: color.withOpacity(0.4),
                                        width: 2,
                                      ),
                                    ),
                                    child: Icon(
                                      _getConceptIcon(index),
                                      color: color,
                                      size: 24,
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          concept.name,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xFF2B2D42),
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 6),
                                        Text(
                                          concept.description,
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.grey[700],
                                            height: 1.3,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: color,
                                    size: 16,
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
              ),
            ],
          );
        }),
      ),
    );
  }

  Color _getConceptColor(int index) {
    final colors = [
      const Color(0xFFEF476F), // Vibrant pink
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
      Icons.code,
      Icons.science,
      Icons.calculate,
      Icons.language,
      Icons.history_edu,
    ];
    return icons[index % icons.length];
  }
}