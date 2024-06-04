import 'package:hive/hive.dart';
import 'package:isar/isar.dart';
import '../models/food_item.dart';

class LocalDatabase {
  static const String foodItemsBoxName = 'food_items';
  static const String cartItemsBoxName = 'cart_items';

  final Box<FoodItem> _foodItemsBox;
  final Box<FoodItem> _cartItemsBox;

  LocalDatabase()
      : _foodItemsBox = Hive.box<FoodItem>(foodItemsBoxName),
        _cartItemsBox = Hive.box<FoodItem>(cartItemsBoxName);

  Future<void> storeFoodItems(List<FoodItem> foodItems) async {
    await _foodItemsBox.clear();
    await _foodItemsBox.addAll(foodItems);
  }

  List<FoodItem> getFoodItems() {
    return _foodItemsBox.values.toList();
  }

  Future<void> addToCart(FoodItem foodItem) async {
    await _cartItemsBox.add(foodItem);
  }

  List<FoodItem> getCartItems() {
    return _cartItemsBox.values.toList();
  }
}