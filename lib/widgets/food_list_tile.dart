import 'package:flutter/material.dart';
import 'package:veg_kitchen/constants/paddings.dart';
import 'package:veg_kitchen/theme/colors.dart';

import '../constants/strings.dart';

class FoodListTile extends StatelessWidget {
  const FoodListTile({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenwidth = MediaQuery.of(context).size.width;
    final double screenheight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MyPaddings().defaultPadding),
      child: Container(
        width: screenwidth,
        height: screenheight / 4,
        decoration: BoxDecoration(
          color: MyColors().deco,
          borderRadius: BorderRadius.circular(38),
          boxShadow: [
            BoxShadow(
              color: MyColors().black,
              offset: Offset(8, 8),
              spreadRadius: -16,
              blurRadius: 19,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: screenwidth * 0.3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(29),
                child: Image.asset(
                  MyStrings().recomendedRecipePath,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: screenwidth * 0.5,
                  child: Text(
                    'Homemade Garlic and Basil French Fries',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
