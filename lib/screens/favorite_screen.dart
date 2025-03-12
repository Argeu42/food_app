import 'package:flutter/material.dart';
import 'package:food_app/components/meal_item.dart';
import 'package:food_app/models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen(this.favoriteMeals, {super.key});

  final List<Meal> favoriteMeals;

  @override
  Widget build(BuildContext context) {

    if (favoriteMeals.isEmpty) {
      return Center(child: Text('No favorite meals added yet!'));
    } else {
      return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(favoriteMeals[index]);
        },
      );
    }
  }
}
