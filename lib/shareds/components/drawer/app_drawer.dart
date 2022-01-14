import 'package:flutter/material.dart';
import 'package:meals/shareds/theme/app_colors.dart';
import 'package:meals/shareds/theme/app_images.dart';
import 'package:meals/shareds/theme/app_styles.dart';
import 'package:meals/shareds/utils/app_routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  Widget _itemDrawer(
      {required IconData icon,
      required String label,
      required Function() onTap}) {
    return ListTile(
      leading: Icon(
        icon,
        color: AppColors.primary,
        size: 26,
      ),
      title: Text(label),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 250,
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.primary, AppColors.secondary],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  AppImages.logo,
                  scale: 0.6,
                ),
                const Text(
                  "Vamos\n conzinhar?",
                  style: AppStyles.titleDrawer,
                ),
              ],
            ),
          ),
          _itemDrawer(
              icon: Icons.restaurant_menu_outlined,
              label: "Refeições",
              onTap: () =>
                  Navigator.of(context).pushReplacementNamed(AppRoutes.home)),
          const Divider(
            height: 2,
            color: AppColors.grey600,
          ),
          _itemDrawer(
              icon: Icons.settings_outlined,
              label: "Configurações",
              onTap: () => Navigator.of(context)
                  .pushReplacementNamed(AppRoutes.settigns))
        ],
      ),
    );
  }
}
