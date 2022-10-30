import 'package:dio/dio.dart';
import 'package:veg_kitchen/models/food.dart';

class FoodApi {
  static const String _urlMainCourse =
      'https://api.spoonacular.com/recipes/complexSearch?apiKey=d33129e006ca499da3684e15240b01d5&diet=vegan&type=main course';

  static const String _urlBreakfast =
      'https://api.spoonacular.com/recipes/complexSearch?apiKey=d33129e006ca499da3684e15240b01d5&diet=vegan&type=breakfast';

  static const String _urlSnack =
      'https://api.spoonacular.com/recipes/complexSearch?apiKey=d33129e006ca499da3684e15240b01d5&diet=vegan&type=snack';

  static Future<List<FoodModel>> fetchMainCourses() async {
    List<FoodModel> _list = [];
    var response = await Dio().get(_urlMainCourse);
    var data = response.data["results"];
    // print(data);
    if (data is List) {
      _list = data.map((e) => FoodModel.fromJson(e)).toList();
    }
    // print(_list[0]);
    return _list;
  }

  static Future<List<FoodModel>> fetchBreakfasts() async {
    List<FoodModel> _list = [];
    var response = await Dio().get(_urlBreakfast);
    var data = response.data["results"];
    if (data is List) {
      _list = data.map((e) => FoodModel.fromJson(e)).toList();
    }
    return _list;
  }

  static Future<List<FoodModel>> fetchSnacks() async {
    List<FoodModel> _list = [];
    var response = await Dio().get(_urlSnack);
    var data = response.data["results"];
    if (data is List) {
      _list = data.map((e) => FoodModel.fromJson(e)).toList();
    }
    return _list;
  }
}
