import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

import '../widgets/meal_item.dart';

class FavoritesScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  const FavoritesScreen(this.favoriteMeals, {Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<Meal> meals = [];

  @override
  void initState() {
    meals = widget.favoriteMeals;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.favoriteMeals == null || widget.favoriteMeals.isEmpty) {
      return Center(
        child: Text('You do not have favorites yet  - start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: meals[index].id,
            title: meals[index].title,
            imageUrl: meals[index].imageUrl,
            complexity: meals[index].complexity,
            affordability: meals[index].affordability,
            duration: meals[index].duration,
          );
        },
        itemCount: meals.length,
      );
    }
  }
}
