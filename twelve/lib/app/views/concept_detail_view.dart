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
// import 'package:flutter/material.dart';
// import 'package:flutter_highlight/flutter_highlight.dart';
// import 'package:flutter_highlight/themes/github.dart';
// import 'package:get/get.dart';
// import 'package:flutter/services.dart';
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
//           Container(
//             width: double.infinity,
//             padding: const EdgeInsets.all(12),
//             margin: const EdgeInsets.only(bottom: 16),
//             decoration: BoxDecoration(
//               color: const Color(0xFFF8FAFC),
//               borderRadius: BorderRadius.circular(8),
//               border: Border.all(
//                 color: const Color(0xFFE2E8F0),
//                 width: 1,
//               ),
//             ),
//             child: HighlightView(
//               content,
//               language: 'javascript',
//               theme: githubTheme,
//               padding: const EdgeInsets.all(8),
//               textStyle: const TextStyle(
//                 fontFamily: 'monospace',
//                 fontSize: 14,
//               ),
//             ),
//           ),
//         );
//       } else {
//         widgets.add(
//           Padding(
//             padding: const EdgeInsets.only(bottom: 16),
//             child: Text(
//               content,
//               style: const TextStyle(
//                 fontSize: 16,
//                 color: Color(0xFF4B5563),
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
//     final color = _getCategoryColor(categoryName.hashCode % 6);
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text(
//           concept.name.toString(),
//           style: const TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.w600,
//             color: Colors.white,
//           ),
//         ),
//         backgroundColor: color,
//         elevation: 0,
//         centerTitle: true,
//         iconTheme: const IconThemeData(color: Colors.white),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Breadcrumb Navigation with overflow handling
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.symmetric(vertical: 8),
//               decoration: BoxDecoration(
//                 color: Colors.grey[50],
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Wrap(
//                 crossAxisAlignment: WrapCrossAlignment.center,
//                 spacing: 4,
//                 runSpacing: 4,
//                 children: [
//                   _BreadcrumbItem(
//                     text: 'Categories',
//                     isActive: false,
//                     color: color,
//                   ),
//                   _BreadcrumbDivider(color: color),
//                   _BreadcrumbItem(
//                     text: categoryName,
//                     isActive: false,
//                     color: color,
//                   ),
//                   _BreadcrumbDivider(color: color),
//                   _BreadcrumbItem(
//                     text: concept.name.toString(),
//                     isActive: true,
//                     color: color,
//                   ),
//                 ],
//               ),
//             ),
//
//             const SizedBox(height: 24),
//
//             // Main Card
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(12),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.1),
//                     blurRadius: 10,
//                     offset: const Offset(0, 4),
//                   ),
//                 ],
//                 border: Border.all(
//                   color: Colors.grey[200]!,
//                   width: 1,
//                 ),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Header
//                   Row(
//                     children: [
//                       Container(
//                         width: 60,
//                         height: 60,
//                         decoration: BoxDecoration(
//                           color: color.withOpacity(0.1),
//                           borderRadius: BorderRadius.circular(12),
//                           border: Border.all(
//                             color: color.withOpacity(0.3),
//                             width: 1.5,
//                           ),
//                         ),
//                         child: Icon(
//                           _getConceptIcon(categoryName.hashCode % 6),
//                           color: color,
//                           size: 30,
//                         ),
//                       ),
//                       const SizedBox(width: 16),
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               concept.name.toString(),
//                               style: const TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w700,
//                                 color: Color(0xFF1F2937),
//                               ),
//                             ),
//                             const SizedBox(height: 6),
//                             Container(
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 12, vertical: 4),
//                               decoration: BoxDecoration(
//                                 color: color.withOpacity(0.1),
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//                               child: Text(
//                                 categoryName,
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   color: color,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//
//                   const SizedBox(height: 24),
//
//                   // Description Section
//                   const Text(
//                     'Description',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w600,
//                       color: Color(0xFF1F2937),
//                     ),
//                   ),
//                   const SizedBox(height: 12),
//                   ...buildDescriptionWidgets(concept.description.toString()),
//
//                   const SizedBox(height: 24),
//
//                   // Metadata Section
//                   const Text(
//                     'Details',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w600,
//                       color: Color(0xFF1F2937),
//                     ),
//                   ),
//                   const SizedBox(height: 12),
//                   _DetailRow(
//                     icon: Icons.tag_rounded,
//                     label: 'Concept ID',
//                     value: concept.id.toString(),
//                     color: color,
//                   ),
//                   const SizedBox(height: 8),
//                   _DetailRow(
//                     icon: Icons.category_rounded,
//                     label: 'Category ID',
//                     value: concept.categoryId.toString(),
//                     color: color,
//                   ),
//                 ],
//               ),
//             ),
//
//             const SizedBox(height: 24),
//
//             // Back Button
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: () => Get.back(),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: color,
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   elevation: 0,
//                 ),
//                 child: const Text(
//                   'Back to Concepts',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Color _getCategoryColor(int index) {
//     final colors = [
//       const Color(0xFFEF476F), // Vibrant red
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
//       Icons.code_rounded,
//       Icons.science_rounded,
//       Icons.calculate_rounded,
//       Icons.language_rounded,
//       Icons.history_edu_rounded,
//     ];
//     return icons[index % icons.length];
//   }
// }
//
// class _BreadcrumbItem extends StatelessWidget {
//   final String text;
//   final bool isActive;
//   final Color color;
//
//   const _BreadcrumbItem({
//     required this.text,
//     required this.isActive,
//     required this.color,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//       decoration: BoxDecoration(
//         color: isActive ? color.withOpacity(0.1) : null,
//         borderRadius: BorderRadius.circular(20),
//         border: isActive
//             ? Border.all(
//           color: color.withOpacity(0.3),
//           width: 1,
//         )
//             : null,
//       ),
//       child: Text(
//         text,
//         style: TextStyle(
//           fontSize: 14,
//           color: isActive ? color : Colors.grey[600],
//           fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
//         ),
//       ),
//     );
//   }
// }
//
// class _BreadcrumbDivider extends StatelessWidget {
//   final Color color;
//
//   const _BreadcrumbDivider({required this.color});
//
//   @override
//   Widget build(BuildContext context) {
//     return Icon(
//       Icons.chevron_right_rounded,
//       size: 20,
//       color: Colors.grey[400],
//     );
//   }
// }
//
// class _DetailRow extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   final String value;
//   final Color color;
//
//   const _DetailRow({
//     required this.icon,
//     required this.label,
//     required this.value,
//     required this.color,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Container(
//           width: 40,
//           height: 40,
//           decoration: BoxDecoration(
//             color: color.withOpacity(0.1),
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Icon(
//             icon,
//             size: 20,
//             color: color,
//           ),
//         ),
//         const SizedBox(width: 12),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               label,
//               style: TextStyle(
//                 fontSize: 14,
//                 color: Colors.grey[600],
//               ),
//             ),
//             const SizedBox(height: 2),
//             Text(
//               value,
//               style: const TextStyle(
//                 fontSize: 16,
//                 color: Color(0xFF1F2937),
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:flutter_highlight/flutter_highlight.dart';
// import 'package:flutter_highlight/themes/monokai.dart';
// import 'package:get/get.dart';
// import 'package:flutter/services.dart';
//
// class ConceptDetailView extends StatelessWidget {
//   final dynamic concept;
//   final String categoryName;
//
//   ConceptDetailView({required this.concept, required this.categoryName});
//
//   List<Widget> buildDescriptionWidgets(String rawDescription) {
//     List<Widget> widgets = [];
//     final parts = rawDescription.split(RegExp(r'<pre>|</pre>'));
//
//     for (int i = 0; i < parts.length; i++) {
//       final isCodeBlock = i % 2 == 1;
//       final content = parts[i].trim();
//
//       if (content.isEmpty) continue;
//
//       if (isCodeBlock) {
//         widgets.add(
//           Container(
//             margin: const EdgeInsets.symmetric(vertical: 12),
//             decoration: BoxDecoration(
//               color: const Color(0xFF1C1C1E),
//               borderRadius: BorderRadius.circular(12),
//               border: Border.all(color: const Color(0xFF48484A), width: 1),
//             ),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(12),
//               child: HighlightView(
//                 content,
//                 language: 'javascript',
//                 theme: monokaiTheme,
//                 padding: const EdgeInsets.all(20),
//                 textStyle: const TextStyle(
//                   fontFamily: 'monospace',
//                   fontSize: 14,
//                   height: 1.4,
//                 ),
//               ),
//             ),
//           ),
//         );
//       } else {
//         widgets.add(
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 6),
//             child: Text(
//               content,
//               style: const TextStyle(
//                 fontSize: 16,
//                 color: Color(0xFFF2F2F7),
//                 height: 1.6,
//                 letterSpacing: 0.2,
//               ),
//             ),
//           ),
//         );
//       }
//     }
//     return widgets;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final color = _getCategoryColor(categoryName.hashCode % 6);
//     final screenWidth = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       backgroundColor: const Color(0xFF000000),
//       body: SafeArea(
//         child: Column(
//           children: [
//             // Custom Header
//             _buildHeader(color),
//
//             // Scrollable Content
//             Expanded(
//               child: SingleChildScrollView(
//                 physics: const BouncingScrollPhysics(),
//                 child: Column(
//                   children: [
//                     const SizedBox(height: 20),
//
//                     // Breadcrumb with proper wrapping
//                     _buildBreadcrumb(screenWidth),
//                     const SizedBox(height: 32),
//
//                     // Hero Card
//                     _buildHeroCard(color),
//                     const SizedBox(height: 24),
//
//                     // Content Cards
//                     _buildDescriptionCard(color),
//                     const SizedBox(height: 20),
//
//                     _buildDetailsCard(color),
//                     const SizedBox(height: 32),
//
//                     // Action Button
//                     _buildActionButton(color),
//                     const SizedBox(height: 24),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildHeader(Color color) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//       decoration: BoxDecoration(
//         color: const Color(0xFF1C1C1E),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.3),
//             blurRadius: 10,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           GestureDetector(
//             onTap: () => Get.back(),
//             child: Container(
//               width: 40,
//               height: 40,
//               decoration: BoxDecoration(
//                 color: const Color(0xFF2C2C2E),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: const Icon(
//                 Icons.arrow_back_ios_new_rounded,
//                 color: Colors.white,
//                 size: 18,
//               ),
//             ),
//           ),
//           const SizedBox(width: 16),
//           Expanded(
//             child: Text(
//               concept.name.toString(),
//               style: const TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.w700,
//                 color: Colors.white,
//                 letterSpacing: 0.5,
//               ),
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//             decoration: BoxDecoration(
//               color: color.withOpacity(0.2),
//               borderRadius: BorderRadius.circular(8),
//               border: Border.all(color: color.withOpacity(0.4), width: 1),
//             ),
//             child: Icon(
//               _getConceptIcon(categoryName.hashCode % 6),
//               color: color,
//               size: 20,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildBreadcrumb(double screenWidth) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Container(
//         width: double.infinity,
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: const Color(0xFF1C1C1E),
//           borderRadius: BorderRadius.circular(12),
//           border: Border.all(color: const Color(0xFF48484A), width: 0.5),
//         ),
//         child: Wrap(
//           children: [
//             const Icon(
//               Icons.layers_outlined,
//               size: 16,
//               color: Color(0xFF8E8E93),
//             ),
//             const SizedBox(width: 8),
//             RichText(
//               text: TextSpan(
//                 style: const TextStyle(
//                   fontSize: 14,
//                   color: Color(0xFF8E8E93),
//                   fontWeight: FontWeight.w500,
//                 ),
//                 children: [
//                   const TextSpan(text: 'Categories '),
//                   const TextSpan(text: '> '),
//                   TextSpan(
//                     text: categoryName,
//                     style: TextStyle(
//                       color: _getCategoryColor(categoryName.hashCode % 6),
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   const TextSpan(text: ' > '),
//                   TextSpan(
//                     text: concept.name.toString(),
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildHeroCard(Color color) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Container(
//         width: double.infinity,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [
//               const Color(0xFF1C1C1E),
//               const Color(0xFF2C2C2E),
//             ],
//           ),
//           borderRadius: BorderRadius.circular(20),
//           boxShadow: [
//             BoxShadow(
//               color: color.withOpacity(0.1),
//               blurRadius: 20,
//               spreadRadius: 1,
//               offset: const Offset(0, 8),
//             ),
//           ],
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(28),
//           child: Column(
//             children: [
//               // Icon with glow effect
//               Container(
//                 width: 80,
//                 height: 80,
//                 decoration: BoxDecoration(
//                   gradient: RadialGradient(
//                     colors: [
//                       color.withOpacity(0.3),
//                       color.withOpacity(0.1),
//                       Colors.transparent,
//                     ],
//                     stops: const [0.3, 0.6, 1.0],
//                   ),
//                   borderRadius: BorderRadius.circular(24),
//                 ),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: [color, color.withOpacity(0.7)],
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                     ),
//                     borderRadius: BorderRadius.circular(24),
//                     boxShadow: [
//                       BoxShadow(
//                         color: color.withOpacity(0.4),
//                         blurRadius: 15,
//                         offset: const Offset(0, 8),
//                       ),
//                     ],
//                   ),
//                   child: Icon(
//                     _getConceptIcon(categoryName.hashCode % 6),
//                     color: Colors.white,
//                     size: 40,
//                   ),
//                 ),
//               ),
//
//               const SizedBox(height: 24),
//
//               // Title
//               Text(
//                 concept.name.toString(),
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(
//                   fontSize: 28,
//                   fontWeight: FontWeight.w800,
//                   color: Colors.white,
//                   letterSpacing: 0.5,
//                 ),
//               ),
//
//               const SizedBox(height: 16),
//
//               // Category Badge
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [
//                       color.withOpacity(0.2),
//                       color.withOpacity(0.1),
//                     ],
//                   ),
//                   borderRadius: BorderRadius.circular(25),
//                   border: Border.all(color: color.withOpacity(0.4), width: 1),
//                 ),
//                 child: Text(
//                   categoryName,
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: color,
//                     fontWeight: FontWeight.w700,
//                     letterSpacing: 0.5,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildDescriptionCard(Color color) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Container(
//         width: double.infinity,
//         decoration: BoxDecoration(
//           color: const Color(0xFF1C1C1E),
//           borderRadius: BorderRadius.circular(16),
//           border: Border.all(color: const Color(0xFF48484A), width: 0.5),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Header
//             Padding(
//               padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
//               child: Row(
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.all(8),
//                     decoration: BoxDecoration(
//                       color: color.withOpacity(0.1),
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: Icon(
//                       Icons.article_outlined,
//                       color: color,
//                       size: 20,
//                     ),
//                   ),
//                   const SizedBox(width: 12),
//                   const Text(
//                     'Description',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w700,
//                       color: Colors.white,
//                       letterSpacing: 0.3,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//             // Content
//             Padding(
//               padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
//               child: Container(
//                 width: double.infinity,
//                 padding: const EdgeInsets.all(20),
//                 decoration: BoxDecoration(
//                   color: const Color(0xFF000000),
//                   borderRadius: BorderRadius.circular(12),
//                   border: Border.all(color: const Color(0xFF48484A), width: 0.5),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: buildDescriptionWidgets(concept.description.toString()),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildDetailsCard(Color color) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Container(
//         width: double.infinity,
//         decoration: BoxDecoration(
//           color: const Color(0xFF1C1C1E),
//           borderRadius: BorderRadius.circular(16),
//           border: Border.all(color: const Color(0xFF48484A), width: 0.5),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Header
//             Padding(
//               padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
//               child: Row(
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.all(8),
//                     decoration: BoxDecoration(
//                       color: color.withOpacity(0.1),
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: Icon(
//                       Icons.info_outline_rounded,
//                       color: color,
//                       size: 20,
//                     ),
//                   ),
//                   const SizedBox(width: 12),
//                   const Text(
//                     'Details',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w700,
//                       color: Colors.white,
//                       letterSpacing: 0.3,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//             // Content
//             Padding(
//               padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
//               child: Column(
//                 children: [
//                   _buildDetailRow(
//                     Icons.tag_rounded,
//                     'Concept ID',
//                     concept.id.toString(),
//                     color,
//                   ),
//                   const SizedBox(height: 16),
//                   _buildDetailRow(
//                     Icons.category_rounded,
//                     'Category ID',
//                     concept.categoryId.toString(),
//                     color,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildDetailRow(IconData icon, String label, String value, Color color) {
//     return Container(
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: const Color(0xFF000000),
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: const Color(0xFF48484A), width: 0.5),
//       ),
//       child: Row(
//         children: [
//           Container(
//             width: 48,
//             height: 48,
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   color.withOpacity(0.2),
//                   color.withOpacity(0.1),
//                 ],
//               ),
//               borderRadius: BorderRadius.circular(12),
//               border: Border.all(color: color.withOpacity(0.3), width: 1),
//             ),
//             child: Icon(icon, size: 24, color: color),
//           ),
//           const SizedBox(width: 16),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   label,
//                   style: const TextStyle(
//                     fontSize: 13,
//                     color: Color(0xFF8E8E93),
//                     fontWeight: FontWeight.w500,
//                     letterSpacing: 0.2,
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   value,
//                   style: const TextStyle(
//                     fontSize: 17,
//                     color: Colors.white,
//                     fontWeight: FontWeight.w700,
//                     letterSpacing: 0.3,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildActionButton(Color color) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Container(
//         width: double.infinity,
//         height: 56,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [color, color.withOpacity(0.8)],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//           borderRadius: BorderRadius.circular(16),
//           boxShadow: [
//             BoxShadow(
//               color: color.withOpacity(0.3),
//               blurRadius: 15,
//               offset: const Offset(0, 8),
//             ),
//           ],
//         ),
//         child: Material(
//           color: Colors.transparent,
//           child: InkWell(
//             onTap: () => Get.back(),
//             borderRadius: BorderRadius.circular(16),
//             child: const Center(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(
//                     Icons.arrow_back_rounded,
//                     color: Colors.white,
//                     size: 20,
//                   ),
//                   SizedBox(width: 8),
//                   Text(
//                     'Back to Concepts',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w700,
//                       color: Colors.white,
//                       letterSpacing: 0.5,
//                     ),
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
//   Color _getCategoryColor(int index) {
//     final colors = [
//       const Color(0xFFFF6B6B), // Coral red
//       const Color(0xFF4ECDC4), // Turquoise
//       const Color(0xFF45B7D1), // Sky blue
//       const Color(0xFF96CEB4), // Mint green
//       const Color(0xFFFFA726), // Orange
//       const Color(0xFFAB47BC), // Purple
//     ];
//     return colors[index % colors.length];
//   }
//
//   IconData _getConceptIcon(int index) {
//     final icons = [
//       Icons.lightbulb_outline_rounded,
//       Icons.code_rounded,
//       Icons.science_rounded,
//       Icons.calculate_rounded,
//       Icons.language_rounded,
//       Icons.history_edu_rounded,
//     ];
//     return icons[index % icons.length];
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/monokai.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

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
            margin: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: const Color(0xFF0D1117),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFF21262D), width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: HighlightView(
                    content,
                    language: 'javascript',
                    theme: monokaiTheme,
                    padding: const EdgeInsets.all(24),
                    textStyle: const TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 15,
                      height: 1.5,
                    ),
                  ),
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFF21262D),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      'JS',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF7C3AED),
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      } else {
        widgets.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              content,
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFFE6EDF3),
                height: 1.7,
                letterSpacing: 0.3,
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
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF0D1117),
      body: SafeArea(
        child: Column(
          children: [
            // Enhanced Header
            _buildHeader(color),

            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(height: 24),

                    // Simple Breadcrumb
                    _buildBreadcrumb(),
                    const SizedBox(height: 32),

                    // Modern Hero Section
                    _buildHeroSection(color),
                    const SizedBox(height: 32),

                    // Description Card
                    _buildDescriptionCard(color),
                    const SizedBox(height: 24),

                    // Details Card
                    _buildDetailsCard(color),
                    const SizedBox(height: 32),

                    // Action Button
                    _buildActionButton(color),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: const Color(0xFF161B22),
        border: Border(
          bottom: BorderSide(color: const Color(0xFF21262D), width: 1),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0xFF21262D),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFF30363D), width: 1),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => Get.back(),
                borderRadius: BorderRadius.circular(12),
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Color(0xFFE6EDF3),
                  size: 18,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              concept.name.toString(),
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: Color(0xFFE6EDF3),
                letterSpacing: 0.2,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 12),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [color.withOpacity(0.15), color.withOpacity(0.05)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: color.withOpacity(0.3), width: 1),
            ),
            child: Icon(
              _getConceptIcon(categoryName.hashCode % 6),
              color: color,
              size: 22,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBreadcrumb() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Icon(
            Icons.home_outlined,
            size: 16,
            color: const Color(0xFF7D8590),
          ),
          const SizedBox(width: 8),
          Text(
            'Categories',
            style: TextStyle(
              fontSize: 14,
              color: const Color(0xFF7D8590),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 8),
          Icon(
            Icons.keyboard_arrow_right_rounded,
            size: 16,
            color: const Color(0xFF7D8590),
          ),
          const SizedBox(width: 8),
          Text(
            categoryName,
            style: TextStyle(
              fontSize: 14,
              color: _getCategoryColor(categoryName.hashCode % 6),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 8),
          Icon(
            Icons.keyboard_arrow_right_rounded,
            size: 16,
            color: const Color(0xFF7D8590),
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              concept.name.toString(),
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFFE6EDF3),
                fontWeight: FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroSection(Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF161B22),
              const Color(0xFF21262D),
              const Color(0xFF161B22),
            ],
          ),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: const Color(0xFF30363D), width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 20,
              spreadRadius: 2,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              // Modern Icon Design
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [
                      color.withOpacity(0.2),
                      color.withOpacity(0.1),
                      Colors.transparent,
                    ],
                    stops: const [0.3, 0.7, 1.0],
                  ),
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [color, color.withOpacity(0.8)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: color.withOpacity(0.5),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Icon(
                    _getConceptIcon(categoryName.hashCode % 6),
                    color: Colors.white,
                    size: 44,
                  ),
                ),
              ),

              const SizedBox(height: 28),

              // Title with modern styling
              Text(
                concept.name.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFFE6EDF3),
                  letterSpacing: -0.5,
                  height: 1.1,
                ),
              ),

              const SizedBox(height: 20),

              // Enhanced Category Badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      color.withOpacity(0.15),
                      color.withOpacity(0.08),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: color.withOpacity(0.4), width: 1.5),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      categoryName,
                      style: TextStyle(
                        fontSize: 16,
                        color: color,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDescriptionCard(Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFF161B22),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFF30363D), width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Modern Header
            Padding(
              padding: const EdgeInsets.fromLTRB(28, 28, 28, 20),
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          color.withOpacity(0.15),
                          color.withOpacity(0.05),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: color.withOpacity(0.3), width: 1),
                    ),
                    child: Icon(
                      Icons.description_outlined,
                      color: color,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFFE6EDF3),
                      letterSpacing: 0.2,
                    ),
                  ),
                ],
              ),
            ),

            // Content with enhanced styling
            Padding(
              padding: const EdgeInsets.fromLTRB(28, 0, 28, 28),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xFF0D1117),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFF21262D), width: 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: buildDescriptionWidgets(concept.description.toString()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailsCard(Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFF161B22),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFF30363D), width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Modern Header
            Padding(
              padding: const EdgeInsets.fromLTRB(28, 28, 28, 20),
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          color.withOpacity(0.15),
                          color.withOpacity(0.05),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: color.withOpacity(0.3), width: 1),
                    ),
                    child: Icon(
                      Icons.info_outline_rounded,
                      color: color,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    'Details',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFFE6EDF3),
                      letterSpacing: 0.2,
                    ),
                  ),
                ],
              ),
            ),

            // Enhanced Content
            Padding(
              padding: const EdgeInsets.fromLTRB(28, 0, 28, 28),
              child: Column(
                children: [
                  _buildDetailRow(
                    Icons.tag_rounded,
                    'Concept ID',
                    concept.id.toString(),
                    color,
                  ),
                  const SizedBox(height: 16),
                  _buildDetailRow(
                    Icons.category_rounded,
                    'Category ID',
                    concept.categoryId.toString(),
                    color,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value, Color color) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF0D1117),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF21262D), width: 1),
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  color.withOpacity(0.15),
                  color.withOpacity(0.08),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: color.withOpacity(0.4), width: 1.5),
            ),
            child: Icon(icon, size: 28, color: color),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF7D8590),
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color(0xFFE6EDF3),
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        height: 64,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color, color.withOpacity(0.9)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.4),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => Get.back(),
            borderRadius: BorderRadius.circular(20),
            child: const Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                    size: 22,
                  ),
                  SizedBox(width: 12),
                  Text(
                    'Back to Concepts',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      letterSpacing: 0.3,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
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

  IconData _getConceptIcon(int index) {
    final icons = [
      Icons.lightbulb_outline_rounded,
      Icons.code_rounded,
      Icons.science_rounded,
      Icons.calculate_rounded,
      Icons.language_rounded,
      Icons.history_edu_rounded,
    ];
    return icons[index % icons.length];
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_highlight/flutter_highlight.dart';
// import 'package:flutter_highlight/themes/monokai.dart';
// import 'package:get/get.dart';
// import 'package:flutter/services.dart';
//
// class ConceptDetailView extends StatelessWidget {
//   final dynamic concept;
//   final String categoryName;
//
//   ConceptDetailView({required this.concept, required this.categoryName});
//
//   List<Widget> buildDescriptionWidgets(String rawDescription) {
//     List<Widget> widgets = [];
//     final parts = rawDescription.split(RegExp(r'<pre>|</pre>'));
//
//     for (int i = 0; i < parts.length; i++) {
//       final isCodeBlock = i % 2 == 1;
//       final content = parts[i].trim();
//
//       if (content.isEmpty) continue;
//
//       if (isCodeBlock) {
//         widgets.add(
//           Container(
//             margin: const EdgeInsets.symmetric(vertical: 20),
//             decoration: BoxDecoration(
//               color: const Color(0xFF0F0F0F),
//               borderRadius: BorderRadius.circular(12),
//               border: Border.all(color: const Color(0xFF2A2A2A), width: 1),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.3),
//                   blurRadius: 12,
//                   offset: const Offset(0, 4),
//                 ),
//               ],
//             ),
//             child: Stack(
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(12),
//                   child: HighlightView(
//                     content,
//                     language: 'javascript',
//                     theme: monokaiTheme,
//                     padding: const EdgeInsets.all(20),
//                     textStyle: const TextStyle(
//                       fontFamily: 'monospace',
//                       fontSize: 14,
//                       height: 1.6,
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   top: 8,
//                   right: 8,
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                     decoration: BoxDecoration(
//                       color: const Color(0xFF1A1A1A),
//                       borderRadius: BorderRadius.circular(6),
//                       border: Border.all(color: const Color(0xFF333333), width: 0.5),
//                     ),
//                     child: const Text(
//                       'JS',
//                       style: TextStyle(
//                         fontSize: 10,
//                         fontWeight: FontWeight.w600,
//                         color: Color(0xFF00D9FF),
//                         letterSpacing: 0.5,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       } else {
//         widgets.add(
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 6),
//             child: Text(
//               content,
//               style: const TextStyle(
//                 fontSize: 15,
//                 color: Color(0xFFF0F0F0),
//                 height: 1.6,
//                 letterSpacing: 0.2,
//               ),
//             ),
//           ),
//         );
//       }
//     }
//     return widgets;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final color = _getCategoryColor(categoryName.hashCode % 6);
//     final screenWidth = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       backgroundColor: const Color(0xFF0A0A0A),
//       body: SafeArea(
//         child: Column(
//           children: [
//             // Minimalist Header
//             _buildHeader(color),
//
//             // Scrollable Content
//             Expanded(
//               child: SingleChildScrollView(
//                 physics: const BouncingScrollPhysics(),
//                 child: Column(
//                   children: [
//                     const SizedBox(height: 20),
//
//                     // Simple Breadcrumb
//                     _buildBreadcrumb(),
//                     const SizedBox(height: 40),
//
//                     // Hero Section
//                     _buildHeroSection(color),
//                     const SizedBox(height: 32),
//
//                     // Description Section
//                     _buildDescriptionCard(color),
//                     const SizedBox(height: 24),
//
//                     // Details Section
//                     _buildDetailsCard(color),
//                     const SizedBox(height: 32),
//
//                     // Action Button
//                     _buildActionButton(color),
//                     const SizedBox(height: 40),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildHeader(Color color) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
//       decoration: const BoxDecoration(
//         color: Color(0xFF111111),
//         border: Border(
//           bottom: BorderSide(color: Color(0xFF1E1E1E), width: 1),
//         ),
//       ),
//       child: Row(
//         children: [
//           Container(
//             width: 40,
//             height: 40,
//             decoration: BoxDecoration(
//               color: const Color(0xFF1A1A1A),
//               borderRadius: BorderRadius.circular(10),
//               border: Border.all(color: const Color(0xFF2A2A2A), width: 1),
//             ),
//             child: Material(
//               color: Colors.transparent,
//               child: InkWell(
//                 onTap: () => Get.back(),
//                 borderRadius: BorderRadius.circular(10),
//                 child: const Icon(
//                   Icons.arrow_back_ios_new,
//                   color: Color(0xFFF0F0F0),
//                   size: 16,
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(width: 16),
//           Expanded(
//             child: Text(
//               concept.name.toString(),
//               style: const TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.w700,
//                 color: Color(0xFFF0F0F0),
//                 letterSpacing: -0.2,
//               ),
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildBreadcrumb() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 24),
//       child: Row(
//         children: [
//           Text(
//             'Categories',
//             style: TextStyle(
//               fontSize: 13,
//               color: const Color(0xFF808080),
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           const SizedBox(width: 8),
//           Text(
//             '/',
//             style: TextStyle(
//               fontSize: 13,
//               color: const Color(0xFF404040),
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//           const SizedBox(width: 8),
//           Text(
//             categoryName,
//             style: TextStyle(
//               fontSize: 13,
//               color: _getCategoryColor(categoryName.hashCode % 6).withOpacity(0.8),
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           const SizedBox(width: 8),
//           Text(
//             '/',
//             style: TextStyle(
//               fontSize: 13,
//               color: const Color(0xFF404040),
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//           const SizedBox(width: 8),
//           Flexible(
//             child: Text(
//               concept.name.toString(),
//               style: const TextStyle(
//                 fontSize: 13,
//                 color: Color(0xFFF0F0F0),
//                 fontWeight: FontWeight.w600,
//               ),
//               overflow: TextOverflow.ellipsis,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildHeroSection(Color color) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 24),
//       child: Container(
//         width: double.infinity,
//         padding: const EdgeInsets.all(32),
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [
//               const Color(0xFF121212),
//               const Color(0xFF0F0F0F),
//             ],
//           ),
//           borderRadius: BorderRadius.circular(16),
//           border: Border.all(color: const Color(0xFF1E1E1E), width: 1),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.4),
//               blurRadius: 24,
//               offset: const Offset(0, 8),
//             ),
//           ],
//         ),
//         child: Column(
//           children: [
//             // Icon with glow effect
//             Container(
//               width: 80,
//               height: 80,
//               decoration: BoxDecoration(
//                 gradient: RadialGradient(
//                   colors: [
//                     color.withOpacity(0.3),
//                     color.withOpacity(0.1),
//                     Colors.transparent,
//                   ],
//                 ),
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: color.withOpacity(0.1),
//                   borderRadius: BorderRadius.circular(20),
//                   border: Border.all(color: color.withOpacity(0.3), width: 1),
//                 ),
//                 child: Icon(
//                   _getConceptIcon(categoryName.hashCode % 6),
//                   color: color,
//                   size: 36,
//                 ),
//               ),
//             ),
//
//             const SizedBox(height: 24),
//
//             // Title
//             Text(
//               concept.name.toString(),
//               textAlign: TextAlign.center,
//               style: const TextStyle(
//                 fontSize: 28,
//                 fontWeight: FontWeight.w800,
//                 color: Color(0xFFF0F0F0),
//                 letterSpacing: -0.8,
//                 height: 1.2,
//               ),
//             ),
//
//             const SizedBox(height: 16),
//
//             // Category badge
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//               decoration: BoxDecoration(
//                 color: color.withOpacity(0.1),
//                 borderRadius: BorderRadius.circular(20),
//                 border: Border.all(color: color.withOpacity(0.3), width: 1),
//               ),
//               child: Text(
//                 categoryName,
//                 style: TextStyle(
//                   fontSize: 13,
//                   color: color,
//                   fontWeight: FontWeight.w700,
//                   letterSpacing: 0.5,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildDescriptionCard(Color color) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 24),
//       child: Container(
//         width: double.infinity,
//         decoration: BoxDecoration(
//           color: const Color(0xFF111111),
//           borderRadius: BorderRadius.circular(12),
//           border: Border.all(color: const Color(0xFF1E1E1E), width: 1),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Header
//             Padding(
//               padding: const EdgeInsets.all(20),
//               child: Row(
//                 children: [
//                   Container(
//                     width: 36,
//                     height: 36,
//                     decoration: BoxDecoration(
//                       color: color.withOpacity(0.1),
//                       borderRadius: BorderRadius.circular(8),
//                       border: Border.all(color: color.withOpacity(0.3), width: 1),
//                     ),
//                     child: Icon(
//                       Icons.description,
//                       color: color,
//                       size: 18,
//                     ),
//                   ),
//                   const SizedBox(width: 12),
//                   const Text(
//                     'Description',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w700,
//                       color: Color(0xFFF0F0F0),
//                       letterSpacing: -0.2,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//             // Content
//             Container(
//               margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
//               padding: const EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 color: const Color(0xFF0A0A0A),
//                 borderRadius: BorderRadius.circular(8),
//                 border: Border.all(color: const Color(0xFF1A1A1A), width: 1),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: buildDescriptionWidgets(concept.description.toString()),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildDetailsCard(Color color) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 24),
//       child: Container(
//         width: double.infinity,
//         decoration: BoxDecoration(
//           color: const Color(0xFF111111),
//           borderRadius: BorderRadius.circular(12),
//           border: Border.all(color: const Color(0xFF1E1E1E), width: 1),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Header
//             Padding(
//               padding: const EdgeInsets.all(20),
//               child: Row(
//                 children: [
//                   Container(
//                     width: 36,
//                     height: 36,
//                     decoration: BoxDecoration(
//                       color: color.withOpacity(0.1),
//                       borderRadius: BorderRadius.circular(8),
//                       border: Border.all(color: color.withOpacity(0.3), width: 1),
//                     ),
//                     child: Icon(
//                       Icons.info_outline,
//                       color: color,
//                       size: 18,
//                     ),
//                   ),
//                   const SizedBox(width: 12),
//                   const Text(
//                     'Details',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w700,
//                       color: Color(0xFFF0F0F0),
//                       letterSpacing: -0.2,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//             // Content
//             Padding(
//               padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
//               child: Column(
//                 children: [
//                   _buildDetailRow(
//                     Icons.tag,
//                     'Concept ID',
//                     concept.id.toString(),
//                     color,
//                   ),
//                   const SizedBox(height: 12),
//                   _buildDetailRow(
//                     Icons.category,
//                     'Category ID',
//                     concept.categoryId.toString(),
//                     color,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildDetailRow(IconData icon, String label, String value, Color color) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: const Color(0xFF0A0A0A),
//         borderRadius: BorderRadius.circular(8),
//         border: Border.all(color: const Color(0xFF1A1A1A), width: 1),
//       ),
//       child: Row(
//         children: [
//           Container(
//             width: 40,
//             height: 40,
//             decoration: BoxDecoration(
//               color: color.withOpacity(0.1),
//               borderRadius: BorderRadius.circular(8),
//               border: Border.all(color: color.withOpacity(0.2), width: 1),
//             ),
//             child: Icon(icon, size: 18, color: color),
//           ),
//           const SizedBox(width: 16),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   label,
//                   style: const TextStyle(
//                     fontSize: 12,
//                     color: Color(0xFF808080),
//                     fontWeight: FontWeight.w500,
//                     letterSpacing: 0.2,
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   value,
//                   style: const TextStyle(
//                     fontSize: 15,
//                     color: Color(0xFFF0F0F0),
//                     fontWeight: FontWeight.w600,
//                     letterSpacing: -0.2,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildActionButton(Color color) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 24),
//       child: Container(
//         width: double.infinity,
//         height: 54,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [color.withOpacity(0.9), color.withOpacity(0.7)],
//             begin: Alignment.centerLeft,
//             end: Alignment.centerRight,
//           ),
//           borderRadius: BorderRadius.circular(12),
//           boxShadow: [
//             BoxShadow(
//               color: color.withOpacity(0.3),
//               blurRadius: 16,
//               offset: const Offset(0, 6),
//             ),
//           ],
//         ),
//         child: Material(
//           color: Colors.transparent,
//           child: InkWell(
//             onTap: () => Get.back(),
//             borderRadius: BorderRadius.circular(12),
//             child: const Center(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(
//                     Icons.arrow_back,
//                     color: Colors.white,
//                     size: 18,
//                   ),
//                   SizedBox(width: 8),
//                   Text(
//                     'Back to Concepts',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w700,
//                       color: Colors.white,
//                       letterSpacing: -0.2,
//                     ),
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
//   Color _getCategoryColor(int index) {
//     final colors = [
//       const Color(0xFF00D9FF), // Cyan
//       const Color(0xFF7B68EE), // Medium slate blue
//       const Color(0xFF32CD32), // Lime green
//       const Color(0xFFFF6B6B), // Light coral
//       const Color(0xFFFFB347), // Peach
//       const Color(0xFFDA70D6), // Orchid
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