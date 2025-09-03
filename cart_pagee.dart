import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'checkout_history.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<CheckoutHistory> cartItems = [];

  @override
  void initState() {
    super.initState();
    _loadCartItems();
  }

  void _loadCartItems() async {
    var box = await Hive.openBox<CheckoutHistory>('cart');
    setState(() {
      cartItems = box.values.toList();
    });
  }

  void removeItemFromCart(int index) async {
    var box = await Hive.openBox<CheckoutHistory>('cart');
    await box.deleteAt(index);
    _loadCartItems();
  }

  void completePurchase() async {
    var checkoutBox = await Hive.openBox<CheckoutHistory>('checkoutHistory');
    var cartBox = await Hive.openBox<CheckoutHistory>('cart');

    for (var item in cartBox.values) {
      await checkoutBox.add(item);
    }

    await cartBox.clear();
    _loadCartItems();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Purchase completed successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Shopping Cart")),
      body: cartItems.isEmpty
          ? Center(child: Text("Your cart is empty"))
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return ListTile(
                  title: Text(
                    '${item.productName} - \$${item.price.toStringAsFixed(2)}',
                  ),
                  subtitle: Text('Date: ${item.date}'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      removeItemFromCart(index);
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: completePurchase,
        label: Text('Complete Purchase'),
        icon: Icon(Icons.check),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    Navigator.popUntil(context, ModalRoute.withName('/'));
  }
}
