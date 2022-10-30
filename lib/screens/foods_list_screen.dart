import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veg_kitchen/models/food.dart';
import 'package:veg_kitchen/models/menu_item.dart';
import 'package:veg_kitchen/services/food_api.dart';
import 'package:veg_kitchen/widgets/food_list_tile.dart';

import '../constants/strings.dart';

class FoodListScreen extends StatefulWidget {
  final MenuItems menuItem;
  const FoodListScreen({super.key, required this.menuItem});

  @override
  State<FoodListScreen> createState() => _FoodListScreenState();
}

class _FoodListScreenState extends State<FoodListScreen> {
  late Future<List<FoodModel>> _foodList;
  @override
  void initState() {
    super.initState();
    _foodList = widget.menuItem.fetchApi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: FutureBuilder(
          future: _foodList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<FoodModel> _list = snapshot.data!;
              return ListView.builder(
                itemCount: _list.length,
                itemBuilder: (context, index) {
                  var _food = _list[index];
                  return FoodListTile(
                    food: _food,
                  );
                },
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
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        widget.menuItem.title,
        style: GoogleFonts.pacifico(color: Colors.black),
      ),
    );
  }
}
