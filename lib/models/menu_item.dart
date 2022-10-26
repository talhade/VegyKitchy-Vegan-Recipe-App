import 'package:flutter/material.dart';

class MenuItems {
  final String type;
  final int cardId;
  final String title;
  final String description;
  final IconData icon;

  MenuItems(this.type, this.cardId, this.title, this.icon, this.description);
}

List<MenuItems> menuItems = [
  MenuItems('breakfast', 0, 'Breakfast', Icons.breakfast_dining_outlined,
      'Have The Best Options Of Vegan Breakfasts.'),
  MenuItems('main course', 1, 'Main Course', Icons.local_dining_outlined,
      'Have The Best Options Of Vegan Main Courses.'),
  MenuItems('snack', 2, 'Snack', Icons.foundation_outlined,
      'Have The Best Options Of Vegan Snacks.'),
];
