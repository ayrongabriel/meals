import 'package:flutter/material.dart';
import 'package:meals/shareds/theme/app_colors.dart';

class AppBottomNavigation extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onChange;
  const AppBottomNavigation({
    Key? key,
    required this.currentIndex,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: MediaQuery.of(context).size.width,
      color: AppColors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconBottomNavigation(
            onTap: () {
              onChange(0);
            },
            enable: currentIndex == 0,
            icon: Icons.category_outlined,
          ),
          IconBottomNavigation(
              onTap: () {
                onChange(1);
              },
              enable: currentIndex == 1,
              icon: Icons.favorite_outline),
          IconBottomNavigation(
              onTap: () {
                onChange(2);
              },
              enable: currentIndex == 2,
              icon: Icons.settings_outlined),
        ],
      ),
    );
  }
}

class IconBottomNavigation extends StatelessWidget {
  final Function() onTap;
  final bool enable;
  final IconData icon;

  const IconBottomNavigation({
    Key? key,
    required this.onTap,
    required this.enable,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40.5,
        width: 40.5,
        color: Colors.transparent,
        child: Icon(
          icon,
          color: enable ? AppColors.primary : AppColors.black,
          size: 35,
        ),
      ),
    );
  }
}
