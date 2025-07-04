import 'package:flutter/material.dart'; // model of category and requirements of an eligible category

class Category {
  const Category({
    required this.id, 
    required this.title, 
    this.color = Colors.orange
    });
 final String id;
 final String title;
 final Color color;
}
