import 'package:flutter/material.dart';
import 'package:meals/shareds/data/dummy_data.dart';

import 'package:meals/shareds/models/category_model.dart';
import 'package:meals/shareds/theme/app_colors.dart';
import 'package:meals/shareds/theme/app_styles.dart';
import 'package:meals/shareds/utils/app_routes.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;
  final int index;
  final double? extent;
  final double? bottomSpace;

  const CategoryItem({
    Key? key,
    required this.category,
    required this.index,
    this.extent,
    this.bottomSpace,
  }) : super(key: key);

  void _selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoutes.categoriyMeals,
      arguments: category,
    );
  }

  List _countRecipe(String cat) {
    final recipes = dummyMeals.where((count) {
      return count.categories.contains(category.id);
    }).toList();
    return recipes;
  }

  @override
  Widget build(BuildContext context) {
    final child = InkWell(
      onTap: () => _selectCategory(context),
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).colorScheme.primary,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Container(
              height: extent,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(category.imageUrl!),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  colors: [category.color!.withOpacity(0.5), category.color!],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 16, right: 16, bottom: 4, left: 16),
              child: Center(
                child: Text(
                  category.title,
                  style: AppStyles.titleBold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Center(
                child: Text(
                  "${_countRecipe(category.id).length.toString()} receitas",
                  style: AppStyles.subTitle,
                ),
              ),
            ),
          ],
        ),
      ),
    );

    if (bottomSpace == null) return child;

    return Column(
      children: [
        Expanded(child: child),
        Container(
          height: bottomSpace,
          color: Colors.green,
        )
      ],
    );
  }
}
