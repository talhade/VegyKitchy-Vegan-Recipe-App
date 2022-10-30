import 'package:flutter/material.dart';
import 'package:veg_kitchen/constants/paddings.dart';
import 'package:veg_kitchen/models/food.dart';
import 'package:veg_kitchen/theme/colors.dart';

class FoodListTile extends StatelessWidget {
  final FoodModel food;
  const FoodListTile({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    final double screenwidth = MediaQuery.of(context).size.width;
    final double screenheight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MyPaddings().defaultPadding,
          vertical: MyPaddings().defaultPadding),
      child: Container(
        width: screenwidth,
        height: screenheight / 4,
        decoration: BoxDecoration(
          color: MyColors().deco,
          borderRadius: BorderRadius.circular(38),
          boxShadow: [
            _boxShadow(),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildImage(screenwidth),
            _titleField(screenwidth),
          ],
        ),
      ),
    );
  }

  Column _titleField(double screenwidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: screenwidth * 0.5,
          child: Text(
            food.title ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  SizedBox _buildImage(double screenwidth) {
    return SizedBox(
      width: screenwidth * 0.3,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: Image.network(
          food.image ?? '',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  BoxShadow _boxShadow() {
    return BoxShadow(
      color: MyColors().black,
      offset: const Offset(8, 8),
      spreadRadius: -16,
      blurRadius: 19,
    );
  }
}
