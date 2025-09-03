import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'checkout_history.dart';

class ProfilePage extends StatelessWidget {
  final String username = 'Hasan Musallam';
  final String email = 'hasanmusallam@gmail.com';
  final String profilePicUrl = 'images/me.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder(
          future: _loadPurchaseHistory(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error loading history');
            } else if (snapshot.hasData) {
              List<CheckoutHistory> history = snapshot.data!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(profilePicUrl),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    username,
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    email,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Purchase History:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  ...history.map((item) => Text('${item.productName} - \$${item.price}')).toList(),
                  ElevatedButton(
                    onPressed: () async {
                      var box = await Hive.openBox<CheckoutHistory>('checkoutHistory');
                      await box.clear();
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => ProfilePage()),
                      );
                    },
                    child: Text('Clear Purchase History'),
                  ),
                ],
              );
            } else {
              return Text('No purchase history');
            }
          },
        ),
      ),
    );
  }

  Future<List<CheckoutHistory>> _loadPurchaseHistory() async {
    var box = await Hive.openBox<CheckoutHistory>('checkoutHistory');
    return box.values.toList();
  }
}
