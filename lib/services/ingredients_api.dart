import 'package:dio/dio.dart';
import 'package:veg_kitchen/models/ingredients_model.dart';

class IngredientsApi {
  static Future<List<IngredientsModel>> fetchIngredientsById(int id) async {
    late String _url =
        'https://api.spoonacular.com/recipes/${id}/ingredientWidget.json?apiKey=d33129e006ca499da3684e15240b01d5';
    List<IngredientsModel> _list = [];
    var response = await Dio().get(_url);
    var data = response.data["ingredients"];
    if (data is List) {
      _list = data.map((e) => IngredientsModel.fromJson(e)).toList();
    }
    return _list;
  }
}
