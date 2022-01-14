import 'package:flutter/material.dart';

import 'package:meals/shareds/components/button_back_favorite/app_back_favorite.dart';
import 'package:meals/shareds/models/meal_modal.dart';
import 'package:meals/shareds/theme/app_colors.dart';
import 'package:meals/shareds/theme/app_styles.dart';

class MealDetailsPage extends StatelessWidget {
  final Function(MealModel) onToggleFavorite;
  final bool Function(MealModel) isFavorite;

  const MealDetailsPage({
    Key? key,
    required this.onToggleFavorite,
    required this.isFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as MealModel;
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Scaffold(
          backgroundColor: AppColors.white,
          // extendBodyBehindAppBar: true,
          body: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight: size.height * 1.4, maxHeight: double.infinity),
              child: Stack(
                children: [
                  Container(
                    color: AppColors.background,
                    width: size.width,
                    height: 365,
                    child: Stack(
                      children: [
                        Hero(
                          tag: meal.id,
                          child: Image.network(
                            meal.imageUrl,
                            fit: BoxFit.cover,
                            height: 365,
                          ),
                        ),
                        AppBackFavorite(
                          meal: meal,
                          onToggleFavorite: onToggleFavorite,
                          isFavorite: isFavorite,
                          isVisibleBtnFavorite: true,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: size.height / 1.69,
                    right: 0,
                    left: 0,
                    child: Container(
                      padding: const EdgeInsets.only(top: 60),
                      // height: size.height,
                      decoration: const BoxDecoration(
                        color: AppColors.background,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16),
                            color: AppColors.white,
                            child: TabBar(
                              labelPadding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 16),
                              labelColor: AppColors.white,
                              unselectedLabelColor: AppColors.grey800,
                              indicator: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: AppColors.primary),
                              indicatorColor: AppColors.primary,
                              tabs: const [
                                Text("Resumo"),
                                Text("Ingredientes"),
                                Text("Passos"),
                              ],
                            ),
                          ),
                          Container(
                            width: size.width,
                            height: size.height / 1.5,
                            color: AppColors.white,
                            child: TabBarView(children: [
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: Text(
                                  meal.summary,
                                  style: AppStyles.textContent,
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                              ItemList(
                                  size: size.width, item: meal.ingredients),
                              ItemList(
                                size: size.width,
                                item: meal.steps,
                                isSteps: true,
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: size.height / 3,
                    right: 0,
                    left: 0,
                    child: CardSummary(size: size, meal: meal),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CardSummary extends StatelessWidget {
  const CardSummary({
    Key? key,
    required this.size,
    required this.meal,
  }) : super(key: key);

  final Size size;
  final MealModel meal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        width: size.width,
        height: 240,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              meal.title,
              style: AppStyles.cartalogTitle,
            ),
            const SizedBox(height: 18.5),
            Row(
              children: const [
                Icon(
                  Icons.favorite_outline,
                  color: AppColors.primary,
                ),
                SizedBox(width: 4),
                Text(
                  "4.8 | 67 Reviews",
                  style: AppStyles.cartalogViews,
                ),
              ],
            ),
            const SizedBox(height: 18.5),
            Container(
              padding: const EdgeInsets.only(
                  top: 16, right: 16, bottom: 8, left: 16),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1, color: AppColors.border),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CardSummaryItem(
                    iconData: Icons.schedule_outlined,
                    label: "${meal.duration.toString()} min",
                  ),
                  Container(height: 48, width: 1, color: AppColors.border),
                  CardSummaryItem(
                      iconData: Icons.restaurant_menu_outlined,
                      label: meal.compplexityText),
                  Container(height: 48, width: 1, color: AppColors.border),
                  CardSummaryItem(
                      iconData: Icons.money_outlined, label: meal.costText),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final double size;
  final bool isSteps;
  const ItemList({
    Key? key,
    this.isSteps = false,
    required this.size,
    required this.item,
  }) : super(key: key);

  final List item;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemCount: item.length,
      itemBuilder: (ctx, index) {
        return Container(
          margin: const EdgeInsets.only(top: 12),
          padding: const EdgeInsets.only(bottom: 12),
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 1, color: AppColors.border))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: isSteps
                ? ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    title: Text(item[index], style: AppStyles.textContent),
                    leading: CircleAvatar(
                      child: Text('${index + 1}'),
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.white,
                    ),
                  )
                : Text.rich(
                    TextSpan(
                      text: "•  ",
                      style: AppStyles.bullets,
                      children: [
                        TextSpan(
                            text: item[index], style: AppStyles.textContent),
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }
}

class CardSummaryItem extends StatelessWidget {
  final IconData iconData;
  final String label;

  const CardSummaryItem({
    Key? key,
    required this.iconData,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          color: AppColors.primary,
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: AppStyles.cartalogyCard,
        ),
      ],
    );
  }
}
