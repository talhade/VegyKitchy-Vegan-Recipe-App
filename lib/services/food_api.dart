import 'package:dio/dio.dart';
import 'package:veg_kitchen/models/food.dart';
import 'package:veg_kitchen/secret/api_key.dart';

class FoodApi {
  static final String _urlMainCourse =
      'https://api.spoonacular.com/recipes/complexSearch?apiKey=${ApiKey.apiKey}&diet=vegan&type=main course';

  static final String _urlBreakfast =
      'https://api.spoonacular.com/recipes/complexSearch?apiKey=${ApiKey.apiKey}&diet=vegan&type=breakfast';

  static final String _urlSnack =
      'https://api.spoonacular.com/recipes/complexSearch?apiKey=${ApiKey.apiKey}&diet=vegan&type=snack';

  static final String _urlRandom =
      'https://api.spoonacular.com/recipes/complexSearch?apiKey=${ApiKey.apiKey}&diet=vegan&sort=random';

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

  static Future<List<FoodModel>> fetchRandomRecipe() async {
    List<FoodModel> _list = [];
    List<FoodModel> _firstItemList = [];
    var response = await Dio().get(_urlRandom);
    var data = response.data["results"];
    if (data is List) {
      _list = data.map((e) => FoodModel.fromJson(e)).toList();
    }
    var firstItem = _list[0];
    _firstItemList.add(firstItem);

    return _firstItemList;
  }
}
