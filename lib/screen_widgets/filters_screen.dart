
import 'package:flutter/material.dart';
// import 'package:meals/screen_widgets/main_drawer.dart';
// import 'package:meals/screen_widgets/tabs_screen.dart';



enum Filter{
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,

}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key,required this.currentFilter});

final Map<Filter,bool> currentFilter;

  @override
  State<FiltersScreen> createState() {
    return _FilterScreen();
  }
}

class _FilterScreen extends State<FiltersScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFilterSet = false;
  var _veganFilterSet = false;
@override
  void initState() {
    super.initState();
    _glutenFreeFilterSet=widget.currentFilter[Filter.glutenFree]!;
    _lactoseFreeFilterSet=widget.currentFilter[Filter.lactoseFree]!;
    _vegetarianFilterSet=widget.currentFilter[Filter.vegetarian]!;
    _veganFilterSet=widget.currentFilter[Filter.vegan]!;

  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Filters ')),

      // drawer: MainDrawer(
      //   onSelectScreen: (identifier) {
      //     Navigator.of(context).pop();
      //     if (identifier == 'meals') {
      //       Navigator.of(context ).pushReplacement(
      //         MaterialPageRoute(builder: (context) => const TabsScreen()));
      //     }
      //   },
      // ),

      

      body: PopScope(
        
       canPop: false,
       onPopInvokedWithResult: (bool didPop, dynamic result) {
       if(didPop) return;
       Navigator.of(context).pop({
        Filter.glutenFree: _glutenFreeFilterSet,
        Filter.lactoseFree: _lactoseFreeFilterSet,
        Filter.vegetarian: _vegetarianFilterSet,
        Filter.vegan: _veganFilterSet,
      });
    },

          child: Column(
          children: [
            SwitchListTile(
              value: _glutenFreeFilterSet,
              onChanged: (isCchecked) {
                setState(() {
                  _glutenFreeFilterSet = isCchecked;
                });
              },
              title: Text(
                'Gluten-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
        
              subtitle: Text(
                'Only Gluten free meals included',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
        
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
        
        
             SwitchListTile(
              value: _lactoseFreeFilterSet,
              onChanged: (isCchecked) {
                setState(() {
                  _lactoseFreeFilterSet = isCchecked;
                });
              },
              title: Text(
                'Lactose-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
        
              subtitle: Text(
                'Only Lactose free meals included',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
        
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
        
        
        
             SwitchListTile(
              value: _vegetarianFilterSet,
              onChanged: (isCchecked) {
                setState(() {
                  _vegetarianFilterSet = isCchecked;
                });
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
        
              subtitle: Text(
                'Only Vegetarian meals included',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
        
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
        
        
        
             SwitchListTile(
              value: _veganFilterSet,
              onChanged: (isCchecked) {
                setState(() {
                  _veganFilterSet = isCchecked;
                });
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
        
              subtitle: Text(
                'Only Vegan meals included',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
        
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      ));
    
  }
}
