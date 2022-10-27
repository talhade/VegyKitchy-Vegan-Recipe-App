import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veg_kitchen/constants/paddings.dart';
import 'package:veg_kitchen/models/food.dart';
import 'package:veg_kitchen/services/food_api.dart';
import 'package:veg_kitchen/theme/colors.dart';
import 'package:veg_kitchen/widgets/food_list_tile.dart';

import '../constants/strings.dart';

class FoodListScreen extends StatefulWidget {
  const FoodListScreen({super.key});

  @override
  State<FoodListScreen> createState() => _FoodListScreenState();
}

class _FoodListScreenState extends State<FoodListScreen> {
  String _url =
      'https://api.spoonacular.com/recipes/complexSearch?apiKey=d33129e006ca499da3684e15240b01d5&diet=vegan&type=main course';
  @override
  void initState() {
    super.initState();
    fetchApi();
  }

  fetchApi() async {
    List<FoodModel> _list = [];
    var response = await Dio().get(_url);
    Map<String, dynamic> data = jsonDecode(response.data);
    var res = data["results"];
    print(res);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: _buildAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              FoodListTile(),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        MyStrings().AppBarText,
        style: GoogleFonts.pacifico(color: Colors.black),
      ),
    );
  }
}
