import 'package:flutter/material.dart';
import '../models/food_item.dart';
import '../services/api_services.dart';
import 'detailed_screen.dart';

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
      print('Error fetching food items: $e');
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
      title: Text(foodItem.title),
      leading: Hero(
        tag: 'imageHero${foodItem.title}',
        child: Image.network(foodItem.image),
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return DetailScreen(
            imageUrl: foodItem.image,
            heroTag: 'imageHero${foodItem.title}',
          );
        }));
      },
    );
  },
),
      // body: ListView.builder(
      //   itemCount: foodItems.length,
      //   itemBuilder: (context, index) {
      //     final foodItem = foodItems[index];
      //     return ListTile(
      //       title: Text(foodItem.title),
      //       leading: Image.network(foodItem.image),
      //       onTap: () {
      //         // Handle item selection
      //       },
      //     );
      //   },
      // ),
    );
  }
}