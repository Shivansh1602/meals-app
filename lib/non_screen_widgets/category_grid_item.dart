// this is created to present categories on the screen basically to present the dummy data on the screen so that we ddont end up creating a huge widget in categories_screen file but seperate the logic here
import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({super.key, required this.category,required this.onSelectCatergory});

  final Category category;
  final void Function() onSelectCatergory;

  @override
  Widget build(BuildContext context) {
    return InkWell(// inkwell is used to make the items tapable instead of gesture detector to get the feedback which gesturedetector does not provide 
      onTap: 
        onSelectCatergory
      ,
      splashColor:Theme.of(context).primaryColor,
      borderRadius:  BorderRadius.circular(18),

      child: Container(
        
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: LinearGradient(
            colors: [
              category.color.withValues(alpha: 0.5),
              category.color.withValues(alpha: 0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child:Text(category.title,style:Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onSurface,
        ),),
      ),
    );
  }
}
