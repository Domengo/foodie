import 'package:flutter/material.dart';
import '../models/food_item.dart';

class CartScreen extends StatelessWidget {
  final List<FoodItem> cartItems;

  const CartScreen({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final cartItem = cartItems[index];
          return ListTile(
            title: Text(cartItem.title),
            leading: Image.network(cartItem.image),
            trailing: IconButton(
              icon: const Icon(Icons.remove_circle),
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
        label: const Text('Checkout'),
        icon: const Icon(Icons.shopping_cart),
      ),
    );
  }
}
