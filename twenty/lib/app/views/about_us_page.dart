import '../../utils/import_export.dart';

class AboutUsPage extends StatefulWidget {
  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: Container(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 32),
                child: _buildAppTitle(theme),
              ),

              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    _buildInfoCard(
                      theme: theme,
                      title: 'Meet Our Team',
                      icon: Icons.people,
                      children: _buildTeamInfo(theme),
                    ),
                    SizedBox(height: 16),
                    _buildInfoCard(
                      theme: theme,
                      title: 'About Next.Js Learning',
                      icon: Icons.info,
                      children: _buildAppInfo(theme),
                    ),
                    SizedBox(height: 16),
                    _buildInfoCard(
                      theme: theme,
                      title: 'About ASWDC',
                      icon: Icons.school,
                      children: _buildAswdcInfo(theme),
                    ),
                    SizedBox(height: 16),
                    _buildInfoCard(
                      theme: theme,
                      title: 'Contact Us',
                      icon: Icons.contact_mail,
                      children: _buildContactInfo(theme),
                    ),
                    SizedBox(height: 16),
                    _buildInfoCard(
                      theme: theme,
                      title: 'Quick Links',
                      icon: Icons.link,
                      children: _buildOtherLinks(theme),
                    ),
                    SizedBox(height: 24),
                    _buildFooter(theme),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppTitle(ThemeData theme) {
    return Column(
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: theme.colorScheme.primary,
            boxShadow: [
              BoxShadow(
                color: theme.colorScheme.primary,
                blurRadius: 15,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: theme.colorScheme.primary,
            ),
            child: Image.asset(
              'assets/next_js_2.png',
              fit: BoxFit.cover,
              width: 80,
              height: 80,
            ),
          ),
        ),
        SizedBox(height: 24),
        Text(
          'Next JS Learning',
          style: theme.textTheme.headlineSmall?.copyWith(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoCard({
    required ThemeData theme,
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Row(
              children: [
                Icon(icon, color: theme.colorScheme.onPrimary),
                SizedBox(width: 12),
                Text(
                  title,
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: theme.colorScheme.onPrimary,
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

  Widget _buildKeyValueRow(ThemeData theme, String key, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              '$key:',
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.onSurface,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(0.8),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactRow(ThemeData theme, IconData icon, String info) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: theme.colorScheme.primary, size: 20),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              info,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLinkRow(ThemeData theme, IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: theme.colorScheme.primary, size: 20),
          SizedBox(width: 12),
          Text(
            title,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildParagraph(ThemeData theme, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        text,
        style: theme.textTheme.bodyMedium?.copyWith(
          color: theme.colorScheme.onSurface.withOpacity(0.8),
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _buildFooter(ThemeData theme) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Text(
        '© 2025 Darshan University\nAll Rights Reserved - Privacy Policy',
        style: theme.textTheme.bodySmall?.copyWith(
          color: theme.colorScheme.onSurface.withOpacity(0.6),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  List<Widget> _buildTeamInfo(ThemeData theme) {
    return [
      _buildKeyValueRow(theme, 'Developed by', 'Ajmera Pujan (23010101401)'),
      _buildKeyValueRow(theme, 'Mentored by', 'Prof. Mehul Bhundiya'),
      _buildKeyValueRow(theme, 'Explored by', 'ASWDC, School Of Computer Science'),
      _buildKeyValueRow(theme, 'Eulogized by', 'Darshan University'),
    ];
  }

  List<Widget> _buildAppInfo(ThemeData theme) {
    return [
      _buildParagraph(theme, 'Next.js Learning App is a Flutter-based project designed to explore and understand the core concepts of Next.js in an interactive way.'),
      _buildParagraph(theme, 'The app covers essential topics such as server-side rendering, static site generation, API routes, dynamic routing, and deployment practices.'),
      _buildParagraph(theme, 'Built in Flutter, the app provides a structured and cross-platform experience for learning modern web development with Next.js.'),
    ];
  }

  List<Widget> _buildAswdcInfo(ThemeData theme) {
    return [
      _buildParagraph(theme, 'ASWDC is an Application, Software, and Website Development Center at Darshan University.'),
      _buildParagraph(theme, 'It bridges the gap between academics and industry with real-world projects.'),
    ];
  }

  List<Widget> _buildContactInfo(ThemeData theme) {
    return [
      _buildContactRow(theme, Icons.email, 'aswdc@darshan.ac.in'),
      _buildContactRow(theme, Icons.phone, '+91-8799402510'),
      _buildContactRow(theme, Icons.language, 'www.darshan.ac.in'),
    ];
  }

  List<Widget> _buildOtherLinks(ThemeData theme) {
    return [
      _buildLinkRow(theme, Icons.share, 'Share App'),
      _buildLinkRow(theme, Icons.apps, 'More Apps'),
      _buildLinkRow(theme, Icons.star, 'Rate Us'),
      _buildLinkRow(theme, Icons.thumb_up, 'Like us on Facebook'),
      _buildLinkRow(theme, Icons.update, 'Check For Update'),
    ];
  }
}