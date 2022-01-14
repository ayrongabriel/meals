import 'package:flutter/material.dart';

import 'package:meals/shareds/models/meal_modal.dart';
import 'package:meals/shareds/theme/app_colors.dart';
import 'package:meals/shareds/theme/app_styles.dart';
import 'package:meals/shareds/utils/app_routes.dart';

class MealItem extends StatelessWidget {
  final MealModel meal;

  const MealItem({
    Key? key,
    required this.meal,
  }) : super(key: key);

  void _selectPage(BuildContext context) {
    Navigator.of(context)
        .pushNamed(AppRoutes.mealDetails, arguments: meal)
        .then((result) {
      if (result == null) {
        print("Sem resultado");
      } else {
        print("O nome da receita é $result");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectPage(context),
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 1, color: AppColors.border))),
        margin: const EdgeInsets.all(0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Hero(
                tag: meal.id,
                child: Container(
                  width: 57.8,
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppColors.border,
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage(meal.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 0),
                child: SizedBox(
                  height: 92,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Container(
                          padding: const EdgeInsets.only(bottom: 5),
                          width: double.infinity,
                          child: Text(
                            meal.title,
                            style: AppStyles.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.schedule_outlined,
                                color: AppColors.grey600,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                "${meal.duration.toString()}min",
                                style: AppStyles.subTitleListCat,
                              ),
                            ],
                          ),
                          const SizedBox(width: 16),
                          Row(
                            children: [
                              const Icon(
                                Icons.work_outline,
                                color: AppColors.grey600,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                meal.compplexityText,
                                style: AppStyles.subTitleListCat,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
