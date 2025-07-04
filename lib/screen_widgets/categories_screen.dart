
import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/non_screen_widgets/category_grid_item.dart';
import 'package:meals/screen_widgets/meals_screen.dart';
import 'package:meals/models/category.dart';

class CategoriesScreen extends StatelessWidget {
  // This is the first screen displaying categories
  const CategoriesScreen({super.key});

  void _selectcategory(BuildContext context, Category category)
  // creating a method that changes the screen after tapping on the categories
  {
   final filterMeals= dummyMeals.where((meal) => meal.categories.contains(category.id)).toList();

    //Navigator.push(context, route)
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealsScreen(title: category.title, meals: filterMeals),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("PICK OUR CATEGORY")),
      body: GridView(
        //body is the main content of the screen and using gridveiw so to display categories as grid
        padding: EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          //alternative = availableCategories.map((category)=>CategoryGridItem(category:category)).toList()
          for (final category in availableCategories) // passed all the values of dummy data here by using for loop
            CategoryGridItem(
              category: category,
              onSelectCatergory: () {
                _selectcategory(context,category);
              },
              // how every category is to be displayed on the screen with all the customization done in categoryGriditem file
            ),
        ],
      ),
    );
  }
}
