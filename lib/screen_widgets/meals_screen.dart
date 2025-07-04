import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/non_screen_widgets/meal_item.dart'; // this file is created to add meals to go to after tapping on the category items

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meals});
  final String title;
  final List<Meal> meals;

  @override
  Widget build(context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) => MealItem(meal: meals[index]),// it builds the item , index refers to each of the meal to be built by using there index it uses meal_item file to get the data 
    );

    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Uh oh... nothing here to see',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 16), 
            Text(
              'Try selecting a different category',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body:
          content, // to show list of meals we  use list view builder to make scrollable list and items only visible will be displayed to optimize performance where we might have long lists
    );
  }
}
