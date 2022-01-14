import 'package:flutter/material.dart';
import 'package:meals/shareds/components/category/meal_item.dart';

import 'package:meals/shareds/models/meal_modal.dart';

class FavoritePage extends StatelessWidget {
  final List<MealModel> favoriteMeals;

  const FavoritePage({
    Key? key,
    required this.favoriteMeals,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return const Center(
        child: Text("Nenhuma Receita foi marcada como favorita. "),
      );
    } else {
      return ListView.builder(
          itemCount: favoriteMeals.length,
          itemBuilder: (context, index) {
            return MealItem(meal: favoriteMeals[index]);
          });
    }
  }
}
