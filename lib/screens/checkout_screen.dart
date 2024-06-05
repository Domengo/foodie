import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Checkout Successful!',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Make POST request to dummy endpoint
                makeDummyRequest();
              },
              child: const Text('Complete Purchase'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> makeDummyRequest() async {
    final response = await http.post(Uri.parse('https://dummy-endpoint.com/checkout'));
    if (response.statusCode == 200) {
      // Handle success
    } else {
      // Handle error
    }
  }
}