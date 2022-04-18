import 'package:flutter/foundation.dart';
import 'package:shop_app/models/cart.dart';

class CartProvider with ChangeNotifier {
  final Map<String, Cart> _cartItems = {};

  Map<String, Cart> get cartItem {
    return {..._cartItems};
  }

  int get cartCount {
    return _cartItems.length;
  }

  void removeProduct(String productId) {
    _cartItems.remove(productId);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  double get totalAmount {
    double total = 0.0;
    _cartItems.forEach((key, eachItem) {
      total = total + eachItem.price * eachItem.quantity;
    });
    return total;
  }

  void addQuantity(String productId) {
    _cartItems.update(productId, (existingItem) {
      return Cart(
          id: existingItem.id,
          productName: existingItem.productName,
          price: existingItem.price,
          imgUrl: existingItem.imgUrl,
          quantity: existingItem.quantity + 1);
    });
    notifyListeners();
  }

  void removeQuantity(String productId) {
    _cartItems.update(productId, (existingItem) {
      if (existingItem.quantity == 1) {
        return Cart(
            id: existingItem.id,
            productName: existingItem.productName,
            price: existingItem.price,
            imgUrl: existingItem.imgUrl,
            quantity: existingItem.quantity);
      } else {
        return Cart(
            id: existingItem.id,
            productName: existingItem.productName,
            price: existingItem.price,
            imgUrl: existingItem.imgUrl,
            quantity: existingItem.quantity - 1);
      }
    });
    notifyListeners();
  }

  void addToCart(
      String productId, String productName, double price, String imgUrl) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(productId, (existingItem) {
        return Cart(
            id: existingItem.id,
            productName: existingItem.productName,
            price: existingItem.price,
            imgUrl: existingItem.imgUrl,
            quantity: existingItem.quantity + 1);
      });
    } else {
      _cartItems.putIfAbsent(
        productId,
        () => Cart(
          id: productId,
          productName: productName,
          price: price,
          imgUrl: imgUrl,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }

  void undoSingleProduct(String productId) {
    if (_cartItems[productId]!.quantity > 1) {
      _cartItems.update(productId, (existingItem) {
        return Cart(
            id: existingItem.id,
            productName: existingItem.productName,
            imgUrl: existingItem.imgUrl,
            price: existingItem.price,
            quantity: existingItem.quantity - 1);
      });
    } else {
      _cartItems.remove(productId);
    }
    notifyListeners();
  }
}
