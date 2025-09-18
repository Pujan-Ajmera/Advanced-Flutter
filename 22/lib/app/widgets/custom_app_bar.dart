import 'package:get/get.dart';
import '../../utils/import_export.dart';
import '../views/about_us_page.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final RxBool? isGridView; // Optional for pages that have grid/list toggle

  const CustomAppBar({
    Key? key,
    required this.title,
    this.showBackButton = false,
    this.isGridView,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find<ThemeController>();

    return AppBar(
      title: Text(
        title,
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
      leading:
          showBackButton
              ? IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Get.back(),
              )
              : null,
      actions: [
        Builder(
          builder:
              (context) => IconButton(
                icon: const Icon(Icons.menu, color: Colors.white, size: 28),
                onPressed: () => _showCustomDrawer(context, themeController),
              ),
        ),
      ],
    );
  }

  void _showCustomDrawer(
    BuildContext context,
    ThemeController themeController,
  ) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder:
          (context) => Obx(
            () => Container(
              decoration: BoxDecoration(
                color:
                    themeController.isDarkMode.value
                        ? const Color(0xFF1F2937)
                        : Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Handle bar
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 12),
                    width: 50,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),

                  // Menu Title
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.tune,
                          color:
                              themeController.isDarkMode.value
                                  ? Colors.white
                                  : const Color(0xFF2B2D42),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Quick Actions',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color:
                                themeController.isDarkMode.value
                                    ? Colors.white
                                    : const Color(0xFF2B2D42),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Divider(height: 1),

                  // Menu Items
                  _buildMenuItem(
                    icon: Icons.info_outline,
                    title: 'About Us',
                    subtitle: 'Learn more about the app',
                    onTap: () {
                      Get.back();
                      Get.to(() => AboutUsPage());
                    },
                    themeController: themeController,
                  ),

                  _buildMenuItem(
                    icon:
                        themeController.isDarkMode.value
                            ? Icons.light_mode
                            : Icons.dark_mode,
                    title:
                        themeController.isDarkMode.value
                            ? 'Light Mode'
                            : 'Dark Mode',
                    subtitle: 'Switch app theme',
                    onTap: () {
                      themeController.toggleTheme();
                    },
                    themeController: themeController,
                  ),

                  // Grid/List toggle only for pages that support it
                  if (isGridView != null)
                    Obx(
                      () => _buildMenuItem(
                        icon: isGridView!.value ? Icons.list : Icons.grid_view,
                        title: isGridView!.value ? 'List View' : 'Grid View',
                        subtitle: 'Change layout style',
                        onTap: () {
                          isGridView!.toggle();
                        },
                        themeController: themeController,
                      ),
                    ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    required ThemeController themeController,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            children: [
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: const Color(0xFF2B2D42).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: const Color(0xFF2B2D42), size: 22),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color:
                            themeController.isDarkMode.value
                                ? Colors.white
                                : const Color(0xFF1F2937),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 13,
                        color:
                            themeController.isDarkMode.value
                                ? Colors.grey[400]
                                : Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color:
                    themeController.isDarkMode.value
                        ? Colors.grey[400]
                        : Colors.grey[600],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
