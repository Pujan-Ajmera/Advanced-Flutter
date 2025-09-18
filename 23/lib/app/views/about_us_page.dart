// import 'package:get/get.dart';
// import '../../utils/import_export.dart';
//
// class AboutUsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final ThemeController themeController = Get.find<ThemeController>();
//     return Obx(
//       () => Scaffold(
//         backgroundColor:
//             themeController.isDarkMode.value
//                 ? const Color(0xFF111827)
//                 : Colors.white,
//         appBar: CustomAppBar(title: 'About Us', showBackButton: true),
//         body: Container(
//           color:
//               themeController.isDarkMode.value
//                   ? const Color(0xFF111827)
//                   : Colors.white,
//           child: SingleChildScrollView(
//             physics: BouncingScrollPhysics(),
//             child: Column(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.symmetric(vertical: 32),
//                   child: _buildAppTitle(),
//                 ),
//
//                 Padding(
//                   padding: EdgeInsets.all(16),
//                   child: Column(
//                     children: [
//                       _buildInfoCard(
//                         title: 'Meet Our Team',
//                         icon: Icons.people,
//                         children: _buildTeamInfo(),
//                       ),
//                       SizedBox(height: 16),
//                       _buildInfoCard(
//                         title: 'About Next.Js Learning',
//                         icon: Icons.info,
//                         children: _buildAppInfo(),
//                       ),
//                       SizedBox(height: 16),
//                       _buildInfoCard(
//                         title: 'About ASWDC',
//                         icon: Icons.school,
//                         children: _buildAswdcInfo(),
//                       ),
//                       SizedBox(height: 16),
//                       _buildInfoCard(
//                         title: 'Contact Us',
//                         icon: Icons.contact_mail,
//                         children: _buildContactInfo(),
//                       ),
//                       SizedBox(height: 16),
//                       _buildInfoCard(
//                         title: 'Quick Links',
//                         icon: Icons.link,
//                         children: _buildOtherLinks(),
//                       ),
//                       SizedBox(height: 24),
//                       _buildLogosSection(),
//                       SizedBox(height: 24),
//                       _buildFooter(),
//                     ],
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
//   Widget _buildAppTitle() {
//     final ThemeController themeController = Get.find<ThemeController>();
//     return Column(
//       children: [
//         Container(
//           width: 120,
//           height: 120,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(16),
//             color: Colors.transparent,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black,
//                 blurRadius: 15,
//                 offset: Offset(0, 5),
//               ),
//             ],
//           ),
//           child: Container(
//             width: 120,
//             height: 120,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(16),
//               color: Colors.transparent, // Remove pink background
//             ),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(16),
//               child: Image.asset(
//                 'assets/next_js_2.png',
//                 fit: BoxFit.cover,
//                 width: 120,
//                 height: 120,
//               ),
//             ),
//           ),
//         ),
//         SizedBox(height: 24),
//         Text(
//           'Next JS Learning',
//           style: TextStyle(
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//             color: const Color(0xFF2B2D42),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildInfoCard({
//     required String title,
//     required IconData icon,
//     required List<Widget> children,
//   }) {
//     final ThemeController themeController = Get.find<ThemeController>();
//     return Card(
//       color:
//           themeController.isDarkMode.value
//               ? const Color(0xFF1F2937)
//               : Colors.white,
//       elevation: 4,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             padding: EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               color: const Color(0xFF2B2D42),
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(16),
//                 topRight: Radius.circular(16),
//               ),
//             ),
//             child: Row(
//               children: [
//                 Icon(icon, color: Colors.white),
//                 SizedBox(width: 12),
//                 Text(
//                   title,
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.all(16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: children,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildKeyValueRow(String key, String value) {
//     final ThemeController themeController = Get.find<ThemeController>();
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(
//             flex: 2,
//             child: Text(
//               '$key:',
//               style: TextStyle(
//                 fontWeight: FontWeight.w600,
//                 color:
//                     themeController.isDarkMode.value
//                         ? Colors.white
//                         : const Color(0xFF1F2937),
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 3,
//             child: Text(
//               value,
//               style: TextStyle(
//                 color:
//                     themeController.isDarkMode.value
//                         ? Colors.grey[300]
//                         : Colors.grey[700],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildContactRow(IconData icon, String info) {
//     final ThemeController themeController = Get.find<ThemeController>();
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         children: [
//           Icon(icon, color: const Color(0xFF2B2D42), size: 20),
//           SizedBox(width: 12),
//           Expanded(
//             child: Text(
//               info,
//               style: TextStyle(
//                 color:
//                     themeController.isDarkMode.value
//                         ? Colors.white
//                         : const Color(0xFF1F2937),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildLinkRow(IconData icon, String title) {
//     final ThemeController themeController = Get.find<ThemeController>();
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         children: [
//           Icon(icon, color: const Color(0xFF2B2D42), size: 20),
//           SizedBox(width: 12),
//           Text(
//             title,
//             style: TextStyle(
//               color:
//                   themeController.isDarkMode.value
//                       ? Colors.white
//                       : const Color(0xFF1F2937),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildParagraph(String text) {
//     final ThemeController themeController = Get.find<ThemeController>();
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 12.0),
//       child: Text(
//         text,
//         style: TextStyle(
//           color:
//               themeController.isDarkMode.value
//                   ? Colors.grey[300]
//                   : Colors.grey[700],
//         ),
//         textAlign: TextAlign.justify,
//       ),
//     );
//   }
//
//   Widget _buildFooter() {
//     final ThemeController themeController = Get.find<ThemeController>();
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 16),
//       child: Text(
//         '© 2025 Darshan University\nAll Rights Reserved - Privacy Policy',
//         style: TextStyle(
//           color:
//               themeController.isDarkMode.value
//                   ? Colors.grey[400]
//                   : Colors.grey[600],
//           fontSize: 12,
//         ),
//         textAlign: TextAlign.center,
//       ),
//     );
//   }
//
//   List<Widget> _buildTeamInfo() {
//     return [
//       _buildKeyValueRow('Developed by', 'Ajmera Pujan (23010101401)'),
//       _buildKeyValueRow('Mentored by', 'Prof. Mehul Bhundiya'),
//       _buildKeyValueRow('Explored by', 'ASWDC, School Of Computer Science'),
//       _buildKeyValueRow('Eulogized by', 'Darshan University'),
//     ];
//   }
//
//   List<Widget> _buildAppInfo() {
//     return [
//       _buildParagraph(
//         'Next.js Learning App is a Flutter-based project designed to explore and understand the core concepts of Next.js in an interactive way.',
//       ),
//       _buildParagraph(
//         'The app covers essential topics such as server-side rendering, static site generation, API routes, dynamic routing, and deployment practices.',
//       ),
//       _buildParagraph(
//         'Built in Flutter, the app provides a structured and cross-platform experience for learning modern web development with Next.js.',
//       ),
//     ];
//   }
//
//   List<Widget> _buildAswdcInfo() {
//     return [
//       _buildParagraph(
//         'ASWDC is an Application, Software, and Website Development Center at Darshan University.',
//       ),
//       _buildParagraph(
//         'It bridges the gap between academics and industry with real-world projects.',
//       ),
//     ];
//   }
//
//   List<Widget> _buildContactInfo() {
//     return [
//       _buildContactRow(Icons.email, 'aswdc@darshan.ac.in'),
//       _buildContactRow(Icons.phone, '+91-8799402510'),
//       _buildContactRow(Icons.language, 'www.darshan.ac.in'),
//     ];
//   }
//
//   List<Widget> _buildOtherLinks() {
//     return [
//       _buildLinkRow(Icons.share, 'Share App'),
//       _buildLinkRow(Icons.apps, 'More Apps'),
//       _buildLinkRow(Icons.star, 'Rate Us'),
//       _buildLinkRow(Icons.thumb_up, 'Like us on Facebook'),
//       _buildLinkRow(Icons.update, 'Check For Update'),
//     ];
//   }
//
//   Widget _buildLogosSection() {
//     final ThemeController themeController = Get.find<ThemeController>();
//     return Obx(
//       () => Container(
//         padding: EdgeInsets.symmetric(vertical: 20),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             // Darshan University Logo
//             Container(
//               width: 100,
//               height: 100,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(12),
//                 child: Image.asset(
//                   themeController.isDarkMode.value
//                       ? 'assets/DU_white.jpeg' // White logo for dark mode
//                       : 'assets/du_logo.png', // Dark logo for light mode
//                   fit: BoxFit.contain,
//                   width: 100,
//                   height: 100,
//                 ),
//               ),
//             ),
//             // ASWDC Logo
//             Container(
//               width: 100,
//               height: 100,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(12),
//                 child: Image.asset(
//                   themeController.isDarkMode.value
//                       ? 'assets/aswdc_white.jpeg' // White logo for dark mode
//                       : 'assets/logo_aswdc.png', // Dark logo for light mode
//                   fit: BoxFit.contain,
//                   width: 100,
//                   height: 100,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:get/get.dart';
import '../../utils/import_export.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'About Us', showBackButton: true),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 32),
                child: _buildAppTitle(),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    _buildInfoCard(
                      title: 'Meet Our Team',
                      icon: Icons.people,
                      children: _buildTeamInfo(),
                    ),
                    SizedBox(height: 16),
                    _buildInfoCard(
                      title: 'About Next.Js Learning',
                      icon: Icons.info,
                      children: _buildAppInfo(),
                    ),
                    SizedBox(height: 16),
                    _buildInfoCard(
                      title: 'About ASWDC',
                      icon: Icons.school,
                      children: _buildAswdcInfo(),
                    ),
                    SizedBox(height: 16),
                    _buildInfoCard(
                      title: 'Contact Us',
                      icon: Icons.contact_mail,
                      children: _buildContactInfo(),
                    ),
                    SizedBox(height: 16),
                    _buildInfoCard(
                      title: 'Quick Links',
                      icon: Icons.link,
                      children: _buildOtherLinks(),
                    ),
                    SizedBox(height: 24),
                    _buildLogosSection(),
                    SizedBox(height: 24),
                    _buildFooter(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppTitle() {
    return Column(
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.transparent,
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 15,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              'assets/next_js_2.png',
              fit: BoxFit.cover,
              width: 120,
              height: 120,
            ),
          ),
        ),
        SizedBox(height: 24),
        Text(
          'Next JS Learning',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF2B2D42),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoCard({
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return Card(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF2B2D42),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Row(
              children: [
                Icon(icon, color: Colors.white),
                SizedBox(width: 12),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKeyValueRow(String key, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              '$key:',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: const Color(0xFF1F2937),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(value, style: TextStyle(color: Colors.grey[700])),
          ),
        ],
      ),
    );
  }

  Widget _buildContactRow(IconData icon, String info) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF2B2D42), size: 20),
          SizedBox(width: 12),
          Expanded(
            child: Text(info, style: TextStyle(color: const Color(0xFF1F2937))),
          ),
        ],
      ),
    );
  }

  Widget _buildLinkRow(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF2B2D42), size: 20),
          SizedBox(width: 12),
          Text(title, style: TextStyle(color: const Color(0xFF1F2937))),
        ],
      ),
    );
  }

  Widget _buildParagraph(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(text, style: TextStyle(color: Colors.grey[700])),
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Text(
        '© 2025 Darshan University\nAll Rights Reserved - Privacy Policy',
        style: TextStyle(color: Colors.grey[600], fontSize: 12),
        textAlign: TextAlign.center,
      ),
    );
  }

  List<Widget> _buildTeamInfo() {
    return [
      _buildKeyValueRow('Developed by', 'Ajmera Pujan (23010101401)'),
      _buildKeyValueRow('Mentored by', 'Prof. Mehul Bhundiya'),
      _buildKeyValueRow('Explored by', 'ASWDC, School Of Computer Science'),
      _buildKeyValueRow('Eulogized by', 'Darshan University'),
    ];
  }

  List<Widget> _buildAppInfo() {
    return [
      _buildParagraph(
        'Next.js Learning App is a Flutter-based project designed to explore and understand the core concepts of Next.js in an interactive way.',
      ),
      _buildParagraph(
        'The app covers essential topics such as server-side rendering, static site generation, API routes, dynamic routing, and deployment practices.',
      ),
      _buildParagraph(
        'Built in Flutter, the app provides a structured and cross-platform experience for learning modern web development with Next.js.',
      ),
    ];
  }

  List<Widget> _buildAswdcInfo() {
    return [
      _buildParagraph(
        'ASWDC is an Application, Software, and Website Development Center at Darshan University.',
      ),
      _buildParagraph(
        'It bridges the gap between academics and industry with real-world projects.',
      ),
    ];
  }

  List<Widget> _buildContactInfo() {
    return [
      _buildContactRow(Icons.email, 'aswdc@darshan.ac.in'),
      _buildContactRow(Icons.phone, '+91-8799402510'),
      _buildContactRow(Icons.language, 'www.darshan.ac.in'),
    ];
  }

  List<Widget> _buildOtherLinks() {
    return [
      _buildLinkRow(Icons.share, 'Share App'),
      _buildLinkRow(Icons.apps, 'More Apps'),
      _buildLinkRow(Icons.star, 'Rate Us'),
      _buildLinkRow(Icons.thumb_up, 'Like us on Facebook'),
      _buildLinkRow(Icons.update, 'Check For Update'),
    ];
  }

  Widget _buildLogosSection() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ASWDC logo (same as splash screen)
          SizedBox(
            width: 80,
            height: 80,
            child: Image.asset('assets/logo_aswdc.png', fit: BoxFit.contain),
          ),
          const SizedBox(width: 48),
          // DU logo (same as splash screen)
          SizedBox(
            width: 160,
            height: 80,
            child: Image.asset('assets/du_logo.png', fit: BoxFit.contain),
          ),
        ],
      ),
    );
  }
}
