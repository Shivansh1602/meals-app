// to output the meal item data after tapping on the categories

import 'package:meals/non_screen_widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ), // to make the fade in image more structured and rounded to look good

      clipBehavior:
          Clip.hardEdge, //cuts the material that goes outside of the boundaries set above

      elevation: 2, // obvious to elevate

      child: InkWell(
        onTap: () {},
        child: Stack(
          // to stack one on top of another for eg. use image as a background and write some text on it .
          children: [
            FadeInImage(
              // this widget is used to get the animation of faded slow image after tapping on the categories and going to the meals
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              // this widget is to adjust the other widgets on top of on or other by giving the parameters
              bottom: 0,
              right: 0,
              left: 0,

              child: Container(
                color: const Color.fromARGB(
                  116,
                  0,
                  0,
                  0,
                ), // for a little translucent background behind the meal name
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 44),

                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis, //very long text ...
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      // to show metadata under the name of the meal using MailItemTrait widget
                      children: [
                        MealItemTrait(
                          icon: Icons.schedule,
                          label: '${meal.duration} min',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
