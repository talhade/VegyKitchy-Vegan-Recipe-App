import 'package:flutter/material.dart';
import 'package:veg_kitchen/constants/paddings.dart';
import 'package:veg_kitchen/models/ingredients_model.dart';
import 'package:veg_kitchen/theme/colors.dart';

class IngredientTile extends StatelessWidget {
  final IngredientsModel ingredient;
  const IngredientTile({
    Key? key,
    required this.ingredient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenwidth = MediaQuery.of(context).size.width;
    final double screenheight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MyPaddings().defaultPadding,
          vertical: MyPaddings().defaultPadding),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: MyPaddings().defaultPadding,
        ),
        width: screenwidth,
        height: screenheight * 0.15,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(26),
          // border: Border.all(color: Colors.black, width: 0.5),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 0),
              spreadRadius: -6,
              blurRadius: 11,
              color: MyColors().black,
            )
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              ingredient.name!.toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: Colors.black),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  ingredient.amount!.metric!.value.toString().toUpperCase(),
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                ),
                Text(
                  ingredient.amount!.metric!.unit.toString(),
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
