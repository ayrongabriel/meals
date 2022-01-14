import 'package:flutter/material.dart';
import 'package:meals/shareds/components/button_back_favorite/app_back_favorite.dart';
import 'package:meals/shareds/components/category/meal_item.dart';
import 'package:meals/shareds/data/dummy_data.dart';

import 'package:meals/shareds/models/category_model.dart';
import 'package:meals/shareds/models/filters_model.dart';
import 'package:meals/shareds/models/meal_modal.dart';
import 'package:meals/shareds/theme/app_colors.dart';
import 'package:meals/shareds/theme/app_styles.dart';
import 'package:meals/shareds/utils/app_routes.dart';

class CategoriesMealsPage extends StatefulWidget {
  final List<MealModel> meals;

  const CategoriesMealsPage({
    required this.meals,
    Key? key,
  }) : super(key: key);

  @override
  State<CategoriesMealsPage> createState() => _CategoriesMealsPageState();
}

class _CategoriesMealsPageState extends State<CategoriesMealsPage> {
  FiltersModel filter = FiltersModel();

  void _filterMeals(FiltersModel filter) {
    setState(() {
      this.filter = filter;

      dummyMeals.where((meal) {
        final fGluten = filter.isGlutenFree && !meal.isGlutenFree;
        final fLactose = filter.isLactoseFree && !meal.isLactoseFree;
        final fVegan = filter.isVegan && !meal.isVegan;
        final fVegetarian = filter.isVegetarian && !meal.isVegetarian;
        return !fGluten && !fLactose && !fVegan && !fVegetarian;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final category =
        ModalRoute.of(context)!.settings.arguments as CategoryModel;
    final size = MediaQuery.of(context).size;

    final categoryMeals = widget.meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: size.height * 1.53,
            child: Stack(
              children: [
                Stack(
                  children: [
                    Container(
                      width: size.width,
                      height: 366,
                      color: AppColors.background,
                      child: category.imageUrl != null
                          ? Image.network(
                              category.imageUrl!,
                              fit: BoxFit.cover,
                            )
                          : Container(),
                    ),
                    const AppBackFavorite(),
                  ],
                ),
                Positioned(
                  top: 366,
                  right: 0,
                  left: 0,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                            top: 150, right: 16, left: 16),
                        width: size.width,
                        color: AppColors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Total de receitas (${categoryMeals.length})",
                              style: AppStyles.title,
                            ),
                            InkWell(
                              child: const Icon(
                                Icons.filter_alt_outlined,
                                size: 25,
                                color: AppColors.grey800,
                              ),
                              onTap: () => Navigator.of(context).pushNamed(
                                  AppRoutes.filterMeal,
                                  arguments: {_filterMeals}),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 16),
                        color: AppColors.white,
                        height: size.height,
                        width: size.width,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: categoryMeals.length,
                          itemBuilder: (context, index) {
                            return MealItem(meal: categoryMeals[index]);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 296,
                  left: 16,
                  right: 16,
                  child: Container(
                    width: size.width,
                    height: 183,
                    padding:
                        const EdgeInsets.only(top: 24, right: 16, left: 16),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      border: Border.all(width: 1, color: AppColors.border),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          category.title,
                          style: AppStyles.cartalogTitle,
                        ),
                        const SizedBox(height: 14),
                        Text(
                          category.description!,
                          style: AppStyles.cartalogSubTitle,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
