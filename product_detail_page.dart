import 'package:flutter/material.dart';
import 'package:myapp/cart_pagee.dart';
import 'home_page.dart';
import 'checkout_history.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProductDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Product product = ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                product.imagePath,
                height: 250,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 20),
            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 24,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Product Details',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              product.description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                 onPressed: () async {
                  var box = await Hive.openBox<CheckoutHistory>('cart');
                  var checkoutItem = CheckoutHistory(
                    productName: product.name,
                    price: product.price,
                    date: DateTime.now(), 
                  );
                  box.add(checkoutItem); 

                  
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => CartPage()),
                  );
                },
                child: Text('Add to Cart'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
