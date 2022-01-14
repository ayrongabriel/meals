import 'package:flutter/material.dart';
import 'package:meals/shareds/models/meal_modal.dart';
import 'package:meals/shareds/theme/app_colors.dart';

class AppBackFavorite extends StatelessWidget {
  final Function(MealModel)? onToggleFavorite;
  final bool Function(MealModel)? isFavorite;
  final bool isVisibleBtnFavorite;

  const AppBackFavorite({
    Key? key,
    this.meal,
    this.isVisibleBtnFavorite = false,
    this.onToggleFavorite,
    this.isFavorite,
  }) : super(key: key);

  final MealModel? meal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: ClipOval(
              child: Container(
                height: 48,
                width: 48,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.border),
                  color: AppColors.white,
                ),
                child: const Center(
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: AppColors.black,
                  ),
                ),
              ),
            ),
          ),
          isVisibleBtnFavorite
              ? InkWell(
                  onTap: () {
                    onToggleFavorite!(meal!);
                  },
                  child: ClipOval(
                    child: Container(
                      height: 48,
                      width: 48,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.border),
                        color: AppColors.white,
                      ),
                      child: Icon(
                        isFavorite!(meal!)
                            ? Icons.favorite
                            : Icons.favorite_outline,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
