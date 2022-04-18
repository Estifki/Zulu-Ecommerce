import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  String id;
  String productName;
  double oldPrice;
  double price;
  String imageUrl;
  bool isFavorite;

  Product({
    required this.id,
    required this.productName,
    required this.oldPrice,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
  });

  void isFavoritePressed() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
