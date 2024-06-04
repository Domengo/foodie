import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/cart_screen.dart';
import '../screens/checkout_screen.dart';
import '../models/food_item.dart';

class ShellScreen extends StatefulWidget {
  @override
  _ShellScreenState createState() => _ShellScreenState();
}

class _ShellScreenState extends State<ShellScreen> {
  int _selectedIndex = 0;

  final List<FoodItem> cartItems = [
  FoodItem(
    title: 'Pizza',
    image: 'https://example.com/pizza.jpg',
  ),
  FoodItem(
    title: 'Burger',
    image: 'https://example.com/burger.jpg',
  ),
  FoodItem(
    title: 'Salad',
    image: 'https://example.com/salad.jpg',
  ),
];

  List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    CartScreen(cartItems: <FoodItem>[]),
    CheckoutScreen(),
    // add your other screens here
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Foodie'),
      ),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.payment), label: 'Checkout'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}