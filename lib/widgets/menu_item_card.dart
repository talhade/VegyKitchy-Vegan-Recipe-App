import 'package:flutter/material.dart';

import 'package:veg_kitchen/models/menu_item.dart';
import 'package:veg_kitchen/screens/foods_list_screen.dart';

class MenuItemCard extends StatelessWidget {
  final MenuItems menuItem;
  const MenuItemCard({super.key, required this.menuItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => FoodListScreen(
            menuItem: menuItem,
          ),
        ),
      ),
      child: Container(
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
            color: menuItem.cardId == 0
                ? Colors.red
                : menuItem.cardId == 2
                    ? Colors.blue
                    : Colors.orange,
            borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              menuItem.icon,
              color: Colors.white,
            ),
            Text(
              menuItem.title,
              style: Theme.of(context).textTheme.headline4,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                menuItem.description,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
