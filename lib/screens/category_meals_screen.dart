import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = "/category-meals";

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  List<Meal> categoryMeals = [];
  String categoryTitle = "";
  bool isInitialised = false;

  @override
  Widget build(BuildContext context) {
    if (!isInitialised) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      final String? categoryId = routeArgs['id'];
      categoryTitle = (routeArgs['title'])!;
      categoryMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId!);
      }).toList();
      isInitialised = true;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: categoryMeals[index].id,
              title: categoryMeals[index].title,
              imageUrl: categoryMeals[index].imageUrl,
              duration: categoryMeals[index].duration,
              complexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordability,
            );
          },
          itemCount: categoryMeals.length),
    );
  }
}
