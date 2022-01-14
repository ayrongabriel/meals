import 'package:flutter/material.dart';
import 'package:meals/modules/category/pages/categories_item_page.dart';
import 'package:meals/modules/category/pages/favorite_page.dart';
import 'package:meals/modules/category/pages/meal_details_page.dart';
import 'package:meals/modules/home/home_page.dart';
import 'package:meals/modules/home/tabs_home_page.dart';
import 'package:meals/modules/search/search_page.dart';
import 'package:meals/modules/settings/filter_page.dart';
import 'package:meals/modules/settings/settings_page.dart';
import 'package:meals/modules/splash/splash_page.dart';
import 'package:meals/shareds/data/dummy_data.dart';
import 'package:meals/shareds/models/filters_model.dart';
import 'package:meals/shareds/models/meal_modal.dart';
import 'package:meals/shareds/theme/app_colors.dart';
import 'package:meals/shareds/utils/app_routes.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<MealModel> _availableMeals = dummyMeals;
  List<MealModel> _favoriteMeals = [];
  FiltersModel filter = FiltersModel();

  void _filterMeals(FiltersModel filter) {
    setState(() {
      this.filter = filter;

      _availableMeals = dummyMeals.where((meal) {
        final fGluten = filter.isGlutenFree && !meal.isGlutenFree;
        final fLactose = filter.isLactoseFree && !meal.isLactoseFree;
        final fVegan = filter.isVegan && !meal.isVegan;
        final fVegetarian = filter.isVegetarian && !meal.isVegetarian;
        return !fGluten && !fLactose && !fVegan && !fVegetarian;
      }).toList();
    });
  }

  void _toggleFavorite(MealModel meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(MealModel meal) {
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos conzinhar?',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: AppColors.primary,
          secondary: AppColors.secondary,
        ),
        fontFamily: 'Raleway',
        canvasColor: const Color.fromRGBO(240, 241, 242, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      initialRoute: AppRoutes.splash,
      routes: {
        AppRoutes.splash: (context) => const SplashPage(),
        AppRoutes.home: (context) => TabsHomePage(
              pages: [
                const HomePage(),
                FavoritePage(
                  favoriteMeals: _favoriteMeals,
                ),
                SettignsPage(filter: filter, onFilterChanged: _filterMeals)
              ],
            ),
        AppRoutes.categoriyMeals: (context) => CategoriesMealsPage(
              meals: _availableMeals,
            ),
        AppRoutes.mealDetails: (context) => MealDetailsPage(
              onToggleFavorite: _toggleFavorite,
              isFavorite: _isFavorite,
            ),
        AppRoutes.settigns: (context) => SettignsPage(
              filter: filter,
              onFilterChanged: _filterMeals,
              isActions: false,
            ),
        AppRoutes.filterMeal: (context) => FilterPage(
              filter: filter,
              onFilterChanged: _filterMeals,
              isActions: false,
            ),
      },
    );
  }
}
