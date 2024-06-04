dart
import 'package:http/http.dart' as http;

class APIService {
  static const String baseUrl = 'https://spoonacular.com/food-api';
  
  Future<List<FoodItem>> fetchFoodItems() async {
    final response = await http.get(Uri.parse('$baseUrl/food-items'));
    
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => FoodItem.fromJson(item)).toList();
    } else {
      throw Exception('Failed to fetch food items');
    }
  }
  
  // Other API-related methods...
}

class FoodItem {
  final String name;
  final double price;
  final String imageUrl;
  
  FoodItem({required this.name, required this.price, required this.imageUrl});
  
  factory FoodItem.fromJson(Map<String, dynamic> json) {
    return FoodItem(
      name: json['name'],
      price: json['price'],
      imageUrl: json['imageUrl'],
    );
  }
}