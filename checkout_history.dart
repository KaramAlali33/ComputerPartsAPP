import 'package:hive/hive.dart';

part 'checkout_history.g.dart';

@HiveType(typeId: 1)
class CheckoutHistory {
  @HiveField(0)
  final String productName;
  @HiveField(1)
  final double price;
  @HiveField(2)
  final DateTime date;

  CheckoutHistory({required this.productName, required this.price, required this.date});
}
