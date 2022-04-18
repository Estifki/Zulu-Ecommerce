
import 'cart.dart';

class Order {
  String id;
  double totalAmount;
  List<Cart> orderItems;
  DateTime dateTime;

  Order({
    required this.id,
    required this.totalAmount,
    required this.orderItems,
    required this.dateTime,
  });
}
