import 'package:flutter/material.dart';
import 'package:meals/screen_widgets/categories_screen.dart';
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

  int _selectPageIndex=0;// setting the 0 index for one page and 1 for another page 

  void _selectPage(int index){// function created to change to the page by changing the index and connecting it to the ontap
  setState(() {
    _selectPageIndex=index;
  });

  }


  @override
  Widget build(BuildContext context) {

  Widget activePage=const CategoriesScreen();
  var activePageTitle='Categories';

       if( _selectPageIndex==1){
        activePage=const MealsScreen( meals:[] );
        activePageTitle='your Favourites';
      }
  


    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
        ),

    body: activePage,

      
      bottomNavigationBar: BottomNavigationBar(// creating a bottom navigation bar
      currentIndex: _selectPageIndex,
       
       
        onTap: _selectPage,   // changes the page 
        items: const[
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star), 
            label: 'Favourites'
            ),
        ],
      ),
    );
  }
}
