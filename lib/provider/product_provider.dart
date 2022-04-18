import 'package:flutter/foundation.dart';
import 'package:shop_app/models/product.dart';

class ProductProvider with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: "p1",
      productName: "Nick Shoe",
      oldPrice: 1399.99,
      price: 1299.99,
      imageUrl: "assets/images/a.jpg",
    ),
    Product(
      id: "p2",
      productName: "Samsung A51",
      oldPrice: 24899,
      price: 22500,
      imageUrl: "assets/images/b.png",
    ),
    Product(
      id: "p3",
      productName: "Molly Puppy",
      oldPrice: 1200,
      price: 950,
      imageUrl: "assets/images/c.jpg",
    ),
    Product(
      id: "p4",
      productName: "Vans Of The Wall",
      oldPrice: 700,
      price: 629,
      imageUrl: "assets/images/d.jpg",
    ),
    Product(
      id: "p5",
      productName: "Mens Shoe AE256",
      oldPrice: 300,
      price: 199.99,
      imageUrl: "assets/images/e.jpg",
    ),
    Product(
      id: "p6",
      productName: "Women's Shoe",
      oldPrice: 230,
      price: 299.99,
      imageUrl: "assets/images/f.png",
    ),
  ];

  List<Product> get items {
    return [..._items];
  }

  Product findById(String id) {
    return _items.firstWhere((prod) {
      return prod.id == id;
    });
  }

  void addProduct(Product newProduct) {
    _items.insert(0, newProduct);
    notifyListeners();
  }

  List<Product> get selectedFavorite {
    return _items.where((favProducts) {
      return favProducts.isFavorite;
    }).toList();
  }
}
