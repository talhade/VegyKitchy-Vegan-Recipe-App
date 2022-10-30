import 'package:flutter/material.dart';
import 'package:veg_kitchen/constants/paddings.dart';
import 'package:veg_kitchen/models/food.dart';
import 'package:veg_kitchen/models/ingredients_model.dart';
import 'package:veg_kitchen/services/ingredients_api.dart';
import 'package:veg_kitchen/theme/colors.dart';
import 'package:veg_kitchen/widgets/ingredient_tile.dart';

class DetailsScreen extends StatefulWidget {
  final FoodModel food;
  const DetailsScreen({super.key, required this.food});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late Future<List<IngredientsModel>> _ingredientList;

  @override
  void initState() {
    super.initState();
    _ingredientList = IngredientsApi.fetchIngredientsById(widget.food.id!);
    // FoodApi.fetchMainCourses();
  }

  @override
  Widget build(BuildContext context) {
    final double screenwidth = MediaQuery.of(context).size.width;
    final double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: FutureBuilder(
        future: _ingredientList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<IngredientsModel> _list = snapshot.data!;
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _topImageWidget(screenheight, screenwidth),
                _itemTitle(context),
                Expanded(
                  child: ListView.builder(
                    itemCount: _list.length,
                    itemBuilder: (context, index) {
                      IngredientsModel _ingredient = _list[index];
                      return IngredientTile(ingredient: _ingredient);
                    },
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Unable to Load'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Padding _itemTitle(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MyPaddings().defaultPadding2x),
      child: Text(
        widget.food.title!,
        maxLines: 1,
        style: Theme.of(context).textTheme.headline5?.copyWith(
              color: Colors.grey[600],
              fontWeight: FontWeight.bold,
              letterSpacing: 1.4,
              overflow: TextOverflow.ellipsis,
            ),
      ),
    );
  }

  Stack _topImageWidget(double screenheight, double screenwidth) {
    return Stack(
      children: [
        Container(
          height: screenheight * 0.35,
          width: screenwidth,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 7),
                spreadRadius: -6,
                blurRadius: 11,
                color: MyColors().black,
              ),
            ],
          ),
          child: Hero(
            tag: widget.food.id!,
            child: ClipRRect(
              borderRadius: const BorderRadiusDirectional.only(
                bottomEnd: Radius.circular(26),
                bottomStart: Radius.circular(26),
              ),
              child: Image.network(
                widget.food.image!,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          top: 20,
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.chevron_left,
              color: MyColors().white,
              size: screenwidth * 0.1,
            ),
          ),
        ),
      ],
    );
  }
}



/* SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _topImageWidget(screenheight, screenwidth),
            _itemTitle(context),
            IngredientTile(),
          ],
        ),
      ), */