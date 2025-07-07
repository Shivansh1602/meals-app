import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screen_widgets/categories_screen.dart';
import 'package:meals/screen_widgets/main_drawer.dart';
import 'package:meals/screen_widgets/meals_screen.dart';

// for tabs
class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectPageIndex = 0;                                                     // setting the 0 index for one page and 1 for another page
  final List<Meal> _favouriteMeals =[];                                                 // would be used to display favourite meals,, final becuase its gonna be only used once
 
  void _showInfoMessage(String message){
    ScaffoldMessenger.of(context).clearSnackBars(); 
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(seconds: 4),content: Text(message)));

  }


  void _toggleMealFavouritesStatus(Meal meal) {                                          // function to either add or remove a meal from favourites , taking meal as a parameter
    final isExisting = _favouriteMeals.contains( meal,);                                                  //.contains is a built in method which ia used here wether favoutite meals contains the meal which we are getting as a parameter contains stores tru and false as value

    if (isExisting) {
      setState(() {
        _favouriteMeals.remove(meal);
        _showInfoMessage('Meal is no longer a favourite ');
      });
      
    } else {
      setState(() {
          _favouriteMeals.add(meal);
          _showInfoMessage('Meal is added to favourites');
      });
    
    }
  }

  void _selectPage(int index) {
    // function created to change to the page by changing the index and connecting it to the ontap
    setState(() {
      _selectPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(
      onToggleFavourites: _toggleMealFavouritesStatus,
    );
    var activePageTitle = 'Categories';

    if (_selectPageIndex == 1) {
      activePage = MealsScreen(
        meals: _favouriteMeals,
        onToggleFavourites: _toggleMealFavouritesStatus,
      );
      activePageTitle = 'your Favourites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle)
        ),
        drawer: const  MainDrawer(),

      body: activePage,

      bottomNavigationBar: BottomNavigationBar(
        // creating a bottom navigation bar
        currentIndex: _selectPageIndex,

        onTap: _selectPage, // changes the page
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories ',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourites'),
        ],
      ),
    );
  }
}
