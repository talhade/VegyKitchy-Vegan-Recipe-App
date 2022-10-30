import 'package:flutter/material.dart';
import 'package:veg_kitchen/models/food.dart';
import 'package:veg_kitchen/services/food_api.dart';

class MenuItems {
  final String type;
  final int cardId;
  final String title;
  final String description;
  final IconData icon;
  final Future<List<FoodModel>> fetchApi;

  MenuItems(this.type, this.cardId, this.title, this.icon, this.description,
      this.fetchApi);
}

List<MenuItems> menuItems = [
  MenuItems(
    'breakfast',
    0,
    'Breakfasts',
    Icons.breakfast_dining_outlined,
    'Have The Best Options Of Vegan Breakfasts.',
    FoodApi.fetchBreakfasts(),
  ),
  MenuItems(
      'main course',
      1,
      'Main Courses',
      Icons.local_dining_outlined,
      'Have The Best Options Of Vegan Main Courses.',
      FoodApi.fetchMainCourses()),
  MenuItems(
    'snack',
    2,
    'Snacks',
    Icons.foundation_outlined,
    'Have The Best Options Of Vegan Snacks.',
    FoodApi.fetchSnacks(),
  ),
];
