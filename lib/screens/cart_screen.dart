dart
import 'package:flutter/material.dart';
import 'package:your_app/models/food_item.dart';

class CartScreen extends StatelessWidget {
  final List<FoodItem> cartItems;

  CartScreen({required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final cartItem = cartItems[index];
          return ListTile(
            title: Text(cartItem.name),
            subtitle: Text('\$${cartItem.price.toStringAsFixed(2)}'),
            leading: Image.network(cartItem.imageUrl),
            trailing: IconButton(
              icon: Icon(Icons.remove_circle),
              onPressed: () {
                // Remove item from cart
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Proceed to checkout
        },
        label: Text('Checkout'),
        icon: Icon(Icons.shopping_cart),
      ),
    );
  }
}