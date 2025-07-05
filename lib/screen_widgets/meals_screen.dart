import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/non_screen_widgets/meal_item.dart';
import 'package:meals/screen_widgets/meal_detail_screen.dart'; // this file is created to add meals to go to after tapping on the category items

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meals});
  final String title;
  final List<Meal> meals;

  void selectMeal(BuildContext context,Meal meal){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MealDetailsScreen(meal:meal),)); 
  }

  @override
  Widget build(context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) => MealItem(
  meal: meals[index],
  onSelectMeal: (context, meal) {
    selectMeal(context, meal);
  },
),
 // it builds the item , index refers to each of the meal to be built by using there index it uses meal_item file to get the data 
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
