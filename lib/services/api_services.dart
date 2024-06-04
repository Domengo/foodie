import 'package:http/http.dart' as http;
import '../models/food_item.dart';
import 'dart:convert';

class APIService {
  static const String baseUrl = 'https://api.spoonacular.com/recipes/complexSearch';

  Future<List<FoodItem>> fetchFoodItems() async {
    final response = await http.get(Uri.parse('$baseUrl?apiKey='));
    print(response.body);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => FoodItem.fromJson(item)).toList();
    } else {
      throw Exception('Failed to fetch food items');
    }
  }

  // Other API-related methods...
}
