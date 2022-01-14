import 'package:flutter/material.dart';
import 'package:meals/shareds/theme/app_colors.dart';
import 'package:meals/shareds/theme/app_styles.dart';
import 'package:meals/shareds/utils/app_routes.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1)).then((value) {
      Navigator.of(context).pushReplacementNamed(AppRoutes.home);
    });
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              AppColors.secondary.withOpacity(.9),
              AppColors.primary,
            ],
            radius: 3,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(height: 16),
            CircularProgressIndicator(
              backgroundColor: AppColors.primary,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white60),
              semanticsLabel: 'carregando...',
            ),
            SizedBox(height: 16),
            Text(
              "carregando...",
              style: AppStyles.loading,
            )
          ],
        ),
      ),
    );
  }
}
