//region working code
// import 'package:get/get.dart';
// import '../../utils/import_export.dart';
//
// class ConceptView extends StatelessWidget {
//   final String categoryName;
//   final String description;
//   final DBController controller = Get.find();
//
//   ConceptView(this.categoryName, this.description);
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
//           Container(
//             width: double.infinity,
//             padding: const EdgeInsets.all(12),
//             margin: const EdgeInsets.symmetric(vertical: 8),
//             decoration: BoxDecoration(
//               color: const Color(0xFF2B2D42).withOpacity(0.08),
//               borderRadius: BorderRadius.circular(8),
//               border: Border.all(
//                 color: const Color(0xFF2B2D42).withOpacity(0.2),
//                 width: 1,
//               ),
//             ),
//             child: SelectableText(
//               content,
//               style: const TextStyle(
//                 fontFamily: 'monospace',
//                 fontSize: 14,
//                 color: Color(0xFF2B2D42),
//               ),
//             ),
//           ),
//         );
//       } else {
//         widgets.add(
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 8),
//             child: SelectableText(
//               content,
//               style: const TextStyle(
//                 fontSize: 16,
//                 color: Color(0xFF2B2D42),
//                 fontWeight: FontWeight.w500,
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
//       backgroundColor: const Color(0xFFF8F9FA),
//       floatingActionButton: FloatingActionButton(onPressed: (){
//         Get.to(QuizPage(name: categoryName));
//       },child: Icon(Icons.quiz_outlined),),
//       appBar: AppBar(
//         title: Text(
//           categoryName.toUpperCase(),
//           style: const TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.w800,
//             color: Colors.white,
//             letterSpacing: 1.2,
//           ),
//         ),
//         backgroundColor: const Color(0xFF2B2D42),
//         elevation: 0,
//         centerTitle: true,
//         iconTheme: const IconThemeData(color: Colors.white),
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(
//             bottom: Radius.zero, // Straight edge
//           ),
//         ),
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Color(0xFF2B2D42),
//               Color(0xFFF8F9FA),
//             ],
//             stops: [0.0, 0.1],
//           ),
//         ),
//         child: Obx(() {
//           return Column(
//             children: [
//               // Description Container
//               Container(
//                 padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
//                 decoration: BoxDecoration(
//                   color: Colors.white.withOpacity(0.9),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.05),
//                       blurRadius: 8,
//                       offset: const Offset(0, 4),
//                     ),
//                   ],
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: buildDescriptionWidgets(description),
//                 ),
//               ),
//               const SizedBox(height: 8),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16),
//                   child: controller.concepts.isEmpty
//                       ? Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.search_off_rounded,
//                           size: 60,
//                           color: const Color(0xFF2B2D42).withOpacity(0.3),
//                         ),
//                         const SizedBox(height: 16),
//                         const Text(
//                           "No concepts found",
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: Color(0xFF2B2D42),
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         Text(
//                           "Try selecting a different category",
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: const Color(0xFF2D3748).withOpacity(0.6),
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                       : ListView.builder(
//                     physics: const BouncingScrollPhysics(),
//                     itemCount: controller.concepts.length,
//                     itemBuilder: (context, index) {
//                       final concept = controller.concepts[index];
//                       final color = _getConceptColor(index);
//
//                       return Container(
//                         margin: const EdgeInsets.only(bottom: 12),
//                         child: Material(
//                           color: Colors.transparent,
//                           child: InkWell(
//                             borderRadius: BorderRadius.circular(16),
//                             onTap: () {
//                               Get.to(() => ConceptDetailView(
//                                 concept: concept,
//                                 categoryName: categoryName,
//                               ));
//                             },
//                             splashColor: color.withOpacity(0.2),
//                             highlightColor: Colors.transparent,
//                             child: Container(
//                               padding: const EdgeInsets.all(16),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(16),
//                                 gradient: LinearGradient(
//                                   begin: Alignment.topCenter,
//                                   end: Alignment.bottomCenter,
//                                   colors: [
//                                     color.withOpacity(0.15),
//                                     Colors.white.withOpacity(0.9),
//                                   ],
//                                 ),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: color.withOpacity(0.1),
//                                     blurRadius: 10,
//                                     offset: const Offset(0, 4),
//                                   ),
//                                 ],
//                                 border: Border.all(
//                                   color: color.withOpacity(0.3),
//                                   width: 1.5,
//                                 ),
//                               ),
//                               child: Row(
//                                 children: [
//                                   Container(
//                                     width: 50,
//                                     height: 50,
//                                     decoration: BoxDecoration(
//                                       color: color.withOpacity(0.2),
//                                       borderRadius: BorderRadius.circular(12),
//                                       border: Border.all(
//                                         color: color.withOpacity(0.4),
//                                         width: 2,
//                                       ),
//                                     ),
//                                     child: Icon(
//                                       _getConceptIcon(index),
//                                       color: color,
//                                       size: 24,
//                                     ),
//                                   ),
//                                   const SizedBox(width: 16),
//                                   Expanded(
//                                     child: Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           concept.name,
//                                           style: const TextStyle(
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.w700,
//                                             color: Color(0xFF2B2D42),
//                                           ),
//                                           maxLines: 1,
//                                           overflow: TextOverflow.ellipsis,
//                                         ),
//                                         const SizedBox(height: 6),
//                                         Text(
//                                           concept.description,
//                                           style: TextStyle(
//                                             fontSize: 13,
//                                             color: Colors.grey[700],
//                                             height: 1.3,
//                                           ),
//                                           maxLines: 2,
//                                           overflow: TextOverflow.ellipsis,
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Icon(
//                                     Icons.arrow_forward_ios_rounded,
//                                     color: color,
//                                     size: 16,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ],
//           );
//         }),
//       ),
//     );
//   }
//
//   Color _getConceptColor(int index) {
//     final colors = [
//       const Color(0xFFEF476F), // Vibrant pink
//       const Color(0xFF118AB2), // Ocean blue
//       const Color(0xFF06D6A0), // Emerald green
//       const Color(0xFF7209B7), // Royal purple
//       const Color(0xFFF8961E), // Sunset orange
//       const Color(0xFF073B4C), // Dark teal
//     ];
//     return colors[index % colors.length];
//   }
//
//   IconData _getConceptIcon(int index) {
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
//
// import 'package:get/get.dart';
// import '../../utils/import_export.dart';
// class ConceptView extends StatelessWidget {
//   final String categoryName;
//   final String description;
//   final DBController controller = Get.find();
//   final RxBool isGridView = false.obs;
//
//   ConceptView(this.categoryName, this.description);
//
//   List<Widget> buildDescriptionWidgets(String rawDescription) {
//     List<Widget> widgets = [];
//     final parts = rawDescription.split(RegExp(r'<pre>|</pre>'));
//     for (int i = 0; i < parts.length; i++) {
//       final isCodeBlock = i % 2 == 1;
//       final content = parts[i]
//           .trim()
//           .replaceAll('&lt;', '<')
//           .replaceAll('&gt;', '>')
//           .replaceAll('&amp;', '&');
//
//       if (content.isEmpty) continue;
//       if (isCodeBlock) {
//         widgets.add(
//           Stack(
//             children: [
//               Container(
//                 width: double.infinity,
//                 padding: const EdgeInsets.all(12),
//                 margin: const EdgeInsets.symmetric(vertical: 8),
//                 decoration: BoxDecoration(
//                   color: const Color(0xFF3A3B45),
//                   borderRadius: BorderRadius.circular(8),
//                   border: Border.all(
//                     color: const Color(0xFF4A4B55),
//                     width: 1,
//                   ),
//                 ),
//                 child: SelectableText(
//                   content,
//                   style: const TextStyle(
//                     fontFamily: 'monospace',
//                     fontSize: 14,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//               Positioned(
//                 top: 4,
//                 right: 4,
//                 child: IconButton(
//                   icon: const Icon(Icons.content_copy, size: 16),
//                   color: Colors.white.withOpacity(0.7),
//                   onPressed: () async {
//                     await Clipboard.setData(ClipboardData(text: content));
//                     ScaffoldMessenger.of(Get.context!).showSnackBar(
//                       const SnackBar(
//                         content: Text('Copied to clipboard'),
//                         duration: Duration(seconds: 1),
//                         behavior: SnackBarBehavior.floating,
//                         margin: EdgeInsets.all(10),
//                       ),
//                     );
//                   },
//                   padding: EdgeInsets.zero,
//                   constraints: const BoxConstraints(),
//                 ),
//               ),
//             ],
//           ),
//         );
//       } else {
//         widgets.add(
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 8),
//             child: SelectableText(
//               content,
//               style: const TextStyle(
//                 fontSize: 16,
//                 color: Colors.white,
//                 fontWeight: FontWeight.w500,
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
//       backgroundColor: const Color(0xFF1A1B23),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Get.to(QuizPage(name: categoryName));
//         },
//         backgroundColor: const Color(0xFFEF476F),
//         child: const Icon(
//           Icons.quiz_outlined,
//           color: Colors.white,
//         ),
//       ),
//       appBar: AppBar(
//         title: Text(
//           categoryName.toUpperCase(),
//           style: const TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.w800,
//             color: Colors.white,
//             letterSpacing: 1.2,
//           ),
//         ),
//         backgroundColor: const Color(0xFF2B2D42),
//         elevation: 0,
//         centerTitle: true,
//         iconTheme: const IconThemeData(color: Colors.white),
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(
//             bottom: Radius.zero, // Straight edge
//           ),
//         ),
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
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Color(0xFF2B2D42),
//               Color(0xFF1A1B23),
//             ],
//             stops: [0.0, 0.1],
//           ),
//         ),
//         // child: Obx(() {
//         //   return Column(
//         //     children: [
//         //       // Description Container
//         //       Container(
//         //         padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
//         //         decoration: BoxDecoration(
//         //           color: const Color(0xFF2A2B35),
//         //           boxShadow: [
//         //             BoxShadow(
//         //               color: Colors.black.withOpacity(0.2),
//         //               blurRadius: 8,
//         //               offset: const Offset(0, 4),
//         //             ),
//         //           ],
//         //         ),
//         //         child: Column(
//         //           crossAxisAlignment: CrossAxisAlignment.start,
//         //           children: buildDescriptionWidgets(description),
//         //         ),
//         //       ),
//         //       const SizedBox(height: 8),
//         //       Expanded(
//         //         child: Padding(
//         //           padding: const EdgeInsets.symmetric(horizontal: 16),
//         //           child: controller.concepts.isEmpty
//         //               ? Center(
//         //             child: Column(
//         //               mainAxisAlignment: MainAxisAlignment.center,
//         //               children: [
//         //                 Icon(
//         //                   Icons.search_off_rounded,
//         //                   size: 60,
//         //                   color: Colors.white.withOpacity(0.3),
//         //                 ),
//         //                 const SizedBox(height: 16),
//         //                 const Text(
//         //                   "No concepts found",
//         //                   style: TextStyle(
//         //                     fontSize: 18,
//         //                     color: Colors.white,
//         //                     fontWeight: FontWeight.w600,
//         //                   ),
//         //                 ),
//         //                 const SizedBox(height: 8),
//         //                 Text(
//         //                   "Try selecting a different category",
//         //                   style: TextStyle(
//         //                     fontSize: 14,
//         //                     color: Colors.grey[400],
//         //                   ),
//         //                 ),
//         //               ],
//         //             ),
//         //           )
//         //               : Obx(() {
//         //             if (isGridView.value) {
//         //               return GridView.builder(
//         //                 physics: const BouncingScrollPhysics(),
//         //                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         //                   crossAxisCount: 2,
//         //                   crossAxisSpacing: 12,
//         //                   mainAxisSpacing: 12,
//         //                   childAspectRatio: 0.85,
//         //                 ),
//         //                 itemCount: controller.concepts.length,
//         //                 itemBuilder: (context, index) {
//         //                   return _buildCompactConceptCard(index);
//         //                 },
//         //               );
//         //             } else {
//         //               return ListView.builder(
//         //                 physics: const BouncingScrollPhysics(),
//         //                 itemCount: controller.concepts.length,
//         //                 itemBuilder: (context, index) {
//         //                   return Container(
//         //                     margin: const EdgeInsets.only(bottom: 12),
//         //                     child: _buildConceptCard(index),
//         //                   );
//         //                 },
//         //               );
//         //             }
//         //           }),
//         //         ),
//         //       ),
//         //     ],
//         //   );
//         // }),
//         child: Obx(() {
//           return SingleChildScrollView(
//             physics: const BouncingScrollPhysics(),
//             child: Column(
//               children: [
//                 // Description Container
//                 Container(
//                   padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
//                   decoration: BoxDecoration(
//                     color: const Color(0xFF2A2B35),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.2),
//                         blurRadius: 8,
//                         offset: const Offset(0, 4),
//                       ),
//                     ],
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: buildDescriptionWidgets(description),
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//
//                 // Concepts List / Empty State
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16),
//                   child: controller.concepts.isEmpty
//                       ? Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.search_off_rounded,
//                           size: 60,
//                           color: Colors.white.withOpacity(0.3),
//                         ),
//                         const SizedBox(height: 16),
//                         const Text(
//                           "No concepts found",
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.white,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         Text(
//                           "Try selecting a different category",
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.grey,
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                       : Obx(() {
//                     if (isGridView.value) {
//                       return GridView.builder(
//                         shrinkWrap: true,
//                         physics: const NeverScrollableScrollPhysics(),
//                         gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 2,
//                           crossAxisSpacing: 12,
//                           mainAxisSpacing: 12,
//                           childAspectRatio: 0.85,
//                         ),
//                         itemCount: controller.concepts.length,
//                         itemBuilder: (context, index) {
//                           return _buildCompactConceptCard(index);
//                         },
//                       );
//                     } else {
//                       return ListView.builder(
//                         shrinkWrap: true,
//                         physics: const NeverScrollableScrollPhysics(),
//                         itemCount: controller.concepts.length,
//                         itemBuilder: (context, index) {
//                           return Container(
//                             margin: const EdgeInsets.only(bottom: 12),
//                             child: _buildConceptCard(index),
//                           );
//                         },
//                       );
//                     }
//                   }),
//                 ),
//               ],
//             ),
//           );
//         }),
//       ),
//     );
//   }
//
//   // Widget _buildConceptCard(int index) {
//   //   final concept = controller.concepts[index];
//   //   final color = _getConceptColor(index);
//   //
//   //   return Material(
//   //     color: Colors.transparent,
//   //     child: InkWell(
//   //       borderRadius: BorderRadius.circular(16),
//   //       onTap: () {
//   //         Get.to(() => ConceptDetailView(
//   //           concept: concept,
//   //           categoryName: categoryName,
//   //         ));
//   //       },
//   //       splashColor: color.withOpacity(0.2),
//   //       highlightColor: Colors.transparent,
//   //       child: Container(
//   //         padding: const EdgeInsets.all(16),
//   //         decoration: BoxDecoration(
//   //           borderRadius: BorderRadius.circular(16),
//   //           gradient: LinearGradient(
//   //             begin: Alignment.topCenter,
//   //             end: Alignment.bottomCenter,
//   //             colors: [
//   //               color.withOpacity(0.15),
//   //               const Color(0xFF2A2B35),
//   //             ],
//   //           ),
//   //           boxShadow: [
//   //             BoxShadow(
//   //               color: color.withOpacity(0.1),
//   //               blurRadius: 10,
//   //               offset: const Offset(0, 4),
//   //             ),
//   //           ],
//   //           border: Border.all(
//   //             color: color.withOpacity(0.3),
//   //             width: 1.5,
//   //           ),
//   //         ),
//   //         child: Row(
//   //           children: [
//   //             Container(
//   //               width: 50,
//   //               height: 50,
//   //               decoration: BoxDecoration(
//   //                 color: color.withOpacity(0.2),
//   //                 borderRadius: BorderRadius.circular(12),
//   //                 border: Border.all(
//   //                   color: color.withOpacity(0.4),
//   //                   width: 2,
//   //                 ),
//   //               ),
//   //               child: Icon(
//   //                 _getConceptIcon(index),
//   //                 color: color,
//   //                 size: 24,
//   //               ),
//   //             ),
//   //             const SizedBox(width: 16),
//   //             Expanded(
//   //               child: Column(
//   //                 crossAxisAlignment: CrossAxisAlignment.start,
//   //                 children: [
//   //                   Text(
//   //                     concept.name,
//   //                     style: const TextStyle(
//   //                       fontSize: 16,
//   //                       fontWeight: FontWeight.w700,
//   //                       color: Colors.white,
//   //                     ),
//   //                     maxLines: 1,
//   //                     overflow: TextOverflow.ellipsis,
//   //                   ),
//   //                   const SizedBox(height: 6),
//   //                   Text(
//   //                     concept.description,
//   //                     style: TextStyle(
//   //                       fontSize: 13,
//   //                       color: Colors.grey[400],
//   //                       height: 1.3,
//   //                     ),
//   //                     maxLines: 2,
//   //                     overflow: TextOverflow.ellipsis,
//   //                   ),
//   //                 ],
//   //               ),
//   //             ),
//   //             Icon(
//   //               Icons.arrow_forward_ios_rounded,
//   //               color: color,
//   //               size: 16,
//   //             ),
//   //           ],
//   //         ),
//   //       ),
//   //     ),
//   //   );
//   // }
//   //
//   // Widget _buildCompactConceptCard(int index) {
//   //   final concept = controller.concepts[index];
//   //   final color = _getConceptColor(index);
//   //
//   //   return Material(
//   //     color: Colors.transparent,
//   //     child: InkWell(
//   //       borderRadius: BorderRadius.circular(16),
//   //       onTap: () {
//   //         Get.to(() => ConceptDetailView(
//   //           concept: concept,
//   //           categoryName: categoryName,
//   //         ));
//   //       },
//   //       splashColor: color.withOpacity(0.2),
//   //       highlightColor: Colors.transparent,
//   //       child: Container(
//   //         padding: const EdgeInsets.all(12),
//   //         decoration: BoxDecoration(
//   //           borderRadius: BorderRadius.circular(16),
//   //           gradient: LinearGradient(
//   //             begin: Alignment.topCenter,
//   //             end: Alignment.bottomCenter,
//   //             colors: [
//   //               color.withOpacity(0.15),
//   //               const Color(0xFF2A2B35),
//   //             ],
//   //           ),
//   //           boxShadow: [
//   //             BoxShadow(
//   //               color: color.withOpacity(0.1),
//   //               blurRadius: 10,
//   //               offset: const Offset(0, 4),
//   //             ),
//   //           ],
//   //           border: Border.all(
//   //             color: color.withOpacity(0.3),
//   //             width: 1.5,
//   //           ),
//   //         ),
//   //         child: Column(
//   //           mainAxisAlignment: MainAxisAlignment.center,
//   //           children: [
//   //             Container(
//   //               width: 40,
//   //               height: 40,
//   //               decoration: BoxDecoration(
//   //                 color: color.withOpacity(0.2),
//   //                 borderRadius: BorderRadius.circular(10),
//   //                 border: Border.all(
//   //                   color: color.withOpacity(0.4),
//   //                   width: 2,
//   //                 ),
//   //               ),
//   //               child: Icon(
//   //                 _getConceptIcon(index),
//   //                 color: color,
//   //                 size: 20,
//   //               ),
//   //             ),
//   //             const SizedBox(height: 12),
//   //             Text(
//   //               concept.name,
//   //               style: const TextStyle(
//   //                 fontSize: 14,
//   //                 fontWeight: FontWeight.w700,
//   //                 color: Colors.white,
//   //               ),
//   //               textAlign: TextAlign.center,
//   //               maxLines: 2,
//   //               overflow: TextOverflow.ellipsis,
//   //             ),
//   //             const SizedBox(height: 6),
//   //             Text(
//   //               concept.description,
//   //               style: TextStyle(
//   //                 fontSize: 11,
//   //                 color: Colors.grey[400],
//   //                 height: 1.2,
//   //               ),
//   //               textAlign: TextAlign.center,
//   //               maxLines: 2,
//   //               overflow: TextOverflow.ellipsis,
//   //             ),
//   //             const Spacer(),
//   //             Icon(
//   //               Icons.arrow_forward_ios_rounded,
//   //               color: color,
//   //               size: 14,
//   //             ),
//   //           ],
//   //         ),
//   //       ),
//   //     ),
//   //   );
//   // }
//   Widget _buildConceptCard(int index) {
//     final concept = controller.concepts[index];
//     final color = _getConceptColor(index);
//
//     return Material(
//       color: Colors.transparent,
//       child: InkWell(
//         borderRadius: BorderRadius.circular(16),
//         onTap: () {
//           Get.to(() => ConceptDetailView(
//             concept: concept,
//             categoryName: categoryName,
//           ));
//         },
//         splashColor: color.withOpacity(0.2),
//         highlightColor: Colors.transparent,
//         child: Container(
//           padding: const EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             color: const Color(0xFF2A2B35),
//             borderRadius: BorderRadius.circular(16),
//             border: Border.all(
//               color: color.withOpacity(0.3),
//               width: 1,
//             ),
//           ),
//           child: Row(
//             children: [
//               Container(
//                 width: 50,
//                 height: 50,
//                 decoration: BoxDecoration(
//                   color: color.withOpacity(0.2),
//                   borderRadius: BorderRadius.circular(12),
//                   border: Border.all(
//                     color: color.withOpacity(0.4),
//                     width: 1,
//                   ),
//                 ),
//                 child: Icon(
//                   _getConceptIcon(index),
//                   color: color,
//                   size: 24,
//                 ),
//               ),
//               const SizedBox(width: 16),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       concept.name,
//                       style: const TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     const SizedBox(height: 4),
//                     Text(
//                       concept.description,
//                       style: TextStyle(
//                         fontSize: 12,
//                         color: Colors.grey[400],
//                       ),
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 width: 32,
//                 height: 32,
//                 decoration: BoxDecoration(
//                   color: const Color(0xFF3A3B45),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Icon(
//                   Icons.arrow_forward,
//                   color: color,
//                   size: 16,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//
//   Widget _buildCompactConceptCard(int index) {
//     final concept = controller.concepts[index];
//     final color = _getConceptColor(index);
//
//     return Material(
//       color: Colors.transparent,
//       child: InkWell(
//         borderRadius: BorderRadius.circular(16),
//         onTap: () {
//           Get.to(() => ConceptDetailView(
//             concept: concept,
//             categoryName: categoryName,
//           ));
//         },
//         splashColor: color.withOpacity(0.2),
//         highlightColor: Colors.transparent,
//         child: Container(
//           padding: const EdgeInsets.all(12),
//           decoration: BoxDecoration(
//             color: const Color(0xFF2A2B35),
//             borderRadius: BorderRadius.circular(16),
//             border: Border.all(
//               color: color.withOpacity(0.3),
//               width: 1,
//             ),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 width: 40,
//                 height: 40,
//                 decoration: BoxDecoration(
//                   color: color.withOpacity(0.2),
//                   borderRadius: BorderRadius.circular(10),
//                   border: Border.all(
//                     color: color.withOpacity(0.4),
//                     width: 1,
//                   ),
//                 ),
//                 child: Icon(
//                   _getConceptIcon(index),
//                   color: color,
//                   size: 20,
//                 ),
//               ),
//               const SizedBox(height: 12),
//               Text(
//                 concept.name,
//                 style: const TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//                 textAlign: TextAlign.center,
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//               ),
//               const SizedBox(height: 4),
//               Text(
//                 concept.description,
//                 style: TextStyle(
//                   fontSize: 10,
//                   color: Colors.grey[500],
//                 ),
//                 textAlign: TextAlign.center,
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Color _getConceptColor(int index) {
//     final colors = [
//       const Color(0xFFEF476F), // Vibrant pink
//       const Color(0xFF118AB2), // Ocean blue
//       const Color(0xFF06D6A0), // Emerald green
//       const Color(0xFF7209B7), // Royal purple
//       const Color(0xFFF8961E), // Sunset orange
//       const Color(0xFF073B4C), // Dark teal
//     ];
//     return colors[index % colors.length];
//   }
//
//   IconData _getConceptIcon(int index) {
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
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/darcula.dart';
import 'package:get/get.dart';
import '../../utils/import_export.dart';

class ConceptView extends StatelessWidget {
  final String categoryName;
  final String description;
  final DBController controller = Get.find();
  final RxBool isGridView = false.obs;

  ConceptView(this.categoryName, this.description);

  // List<Widget> buildDescriptionWidgets(String rawDescription) {
  //   List<Widget> widgets = [];
  //   final parts = rawDescription.split(RegExp(r'<pre>|</pre>'));
  //   for (int i = 0; i < parts.length; i++) {
  //     final isCodeBlock = i % 2 == 1;
  //     final content = parts[i]
  //         .trim()
  //         .replaceAll('&lt;', '<')
  //         .replaceAll('&gt;', '>')
  //         .replaceAll('&amp;', '&');
  //
  //     if (content.isEmpty) continue;
  //     if (isCodeBlock) {
  //       widgets.add(
  //         Stack(
  //           children: [
  //             Container(
  //               width: double.infinity,
  //               padding: const EdgeInsets.all(12),
  //               margin: const EdgeInsets.symmetric(vertical: 8),
  //               decoration: BoxDecoration(
  //                 color: const Color(0xFF3A3B45),
  //                 borderRadius: BorderRadius.circular(8),
  //                 border: Border.all(
  //                   color: const Color(0xFF4A4B55),
  //                   width: 1,
  //                 ),
  //               ),
  //               child: SelectableText(
  //                 content,
  //                 style: const TextStyle(
  //                   fontFamily: 'monospace',
  //                   fontSize: 14,
  //                   color: Colors.white,
  //                 ),
  //               ),
  //             ),
  //             Positioned(
  //               top: -5,
  //               right: 4,
  //               child: IconButton(
  //                 icon: const Icon(Icons.content_copy, size: 22),
  //                 color: Colors.white.withOpacity(0.7),
  //                   onPressed: () async {
  //                     await Clipboard.setData(ClipboardData(text: content));
  //                     Get.snackbar(
  //                       'Copied',
  //                       'Text copied to clipboard',
  //                       duration: const Duration(seconds: 2),
  //                       snackPosition: SnackPosition.TOP,
  //                       margin: const EdgeInsets.all(10),
  //                       borderRadius: 8,
  //                       backgroundColor: Colors.grey[800],
  //                       colorText: Colors.white,
  //                     );
  //                   },
  //                 padding: EdgeInsets.zero,
  //                 constraints: const BoxConstraints(),
  //               ),
  //             ),
  //           ],
  //         ),
  //       );
  //     } else {
  //       widgets.add(
  //         Padding(
  //           padding: const EdgeInsets.symmetric(vertical: 8),
  //           child: SelectableText(
  //             content,
  //             style: const TextStyle(
  //               fontSize: 16,
  //               color: Colors.white,
  //               fontWeight: FontWeight.w500,
  //               height: 1.6,
  //             ),
  //           ),
  //         ),
  //       );
  //     }
  //   }
  //
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
                  language: 'dart', // Change based on your content
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
    return Scaffold(
      backgroundColor: const Color(0xFF1A1B23),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(QuizPage(name: categoryName));
        },
        backgroundColor: const Color(0xFFEF476F),
        child: const Icon(
          Icons.quiz_outlined,
          color: Colors.white,
        ),
      ),
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
            bottom: Radius.zero,
          ),
        ),
        actions: [
          Obx(() => IconButton(
            icon: Icon(
              isGridView.value ? Icons.list : Icons.grid_view,
              color: Colors.white,
            ),
            onPressed: () {
              isGridView.toggle();
            },
          )),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF2B2D42),
              Color(0xFF1A1B23),
            ],
            stops: [0.0, 0.1],
          ),
        ),
        child: Obx(() {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                // Description Container
                Container(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2A2B35),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
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

                // Concepts List / Empty State
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: controller.concepts.isEmpty
                      ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off_rounded,
                          size: 60,
                          color: Colors.white.withOpacity(0.3),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "No concepts found",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Try selecting a different category",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                      : Obx(() {
                    if (isGridView.value) {
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 0.85,
                        ),
                        itemCount: controller.concepts.length,
                        itemBuilder: (context, index) {
                          return _buildCompactConceptCard(index);
                        },
                      );
                    } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.concepts.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            child: _buildConceptCard(index),
                          );
                        },
                      );
                    }
                  }),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildConceptCard(int index) {
    final concept = controller.concepts[index];
    final color = _getConceptColor(index);

    return Material(
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
            color: const Color(0xFF2A2B35),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: color.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                concept.name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Text(
                concept.description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[400],
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'View Details',
                  style: TextStyle(
                    fontSize: 12,
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

  Widget _buildCompactConceptCard(int index) {
    final concept = controller.concepts[index];
    final color = _getConceptColor(index);

    return Material(
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
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFF2A2B35),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: color.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                concept.name,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Text(
                concept.description,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[400],
                ),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
  SizedBox(height: 2,),
              // "View" text at bottom right
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
}