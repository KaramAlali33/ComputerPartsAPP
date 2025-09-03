import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myapp/box.dart';
import 'package:myapp/checkout_history.dart';
import 'home_page.dart';
import 'product_detail_page.dart';
import 'profile_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CheckoutHistoryAdapter());
  BoxUSER = await Hive.openBox<CheckoutHistory>('checkout_history');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Computer Parts Selling App',
    theme: ThemeData(
  primarySwatch: Colors.blue,
  colorScheme: ColorScheme.light(
    primary: Color(0xFF2962FF),  
    secondary: Color(0xFF00B0FF), 
    surface: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    error: Color(0xFFD32F2F),
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF2962FF),
  ),
    ),
      initialRoute: '/',
      routes: {
  '/': (context) => HomePage(),
  '/product': (context) => ProductDetailPage(),
        '/profile': (context) => ProfilePage(),
      },
      debugShowCheckedModeBanner: false,
     
    );
  }
}

