import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import '../models/food_item.dart';
import 'dart:convert';

const String apiKey = '274475f448a74a4499a0a1920ee7b028';

class APIService {
  static const String baseUrl =
      'https://api.spoonacular.com/recipes/complexSearch?apiKey=$apiKey';
static const String url = 'https://api.spoonacular.com/recipes/716429/information?apiKey=$apiKey&includeNutrition=true';

  Future<List<FoodItem>> fetchFoodItems() async {
    final response = await http.get(Uri.parse(baseUrl));
    print(response.body);

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as Map<String, dynamic>;
      final results = data['results'] as List;
      return results.map((item) => FoodItem.fromJson(item)).toList();
    } else {
      throw Exception('Failed to fetch food items');
    }
  }

}
