import 'package:flutter/material.dart';
import '../models/food_item.dart';
import '../services/api_services.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<FoodItem> foodItems = [];

  @override
  void initState() {
    super.initState();
    fetchFoodItems();
  }

  Future<void> fetchFoodItems() async {
    try {
      final apiService = APIService();
      final items = await apiService.fetchFoodItems();
      setState(() {
        foodItems = items;
      });
    } catch (e) {
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Items'),
      ),
      body: ListView.builder(
        itemCount: foodItems.length,
        itemBuilder: (context, index) {
          final foodItem = foodItems[index];
          return ListTile(
            title: Text(foodItem.name),
            subtitle: Text('\$${foodItem.price.toStringAsFixed(2)}'),
            leading: Image.network(foodItem.imageUrl),
            onTap: () {
              // Handle item selection
            },
          );
        },
      ),
    );
  }
}