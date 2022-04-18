import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';
import '../provider/cart_provider.dart';
import '../routes/routes.dart';

class ProductItems extends StatelessWidget {
  const ProductItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    var product = Provider.of<Product>(context);
    var cart = Provider.of<CartProvider>(context);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.productDetails,
            arguments: product.id);
      },
      child: Stack(children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: _screenSize.height * 0.025),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: _screenSize.height * 0.135,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(product.imageUrl),
                        fit: BoxFit.contain),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: _screenSize.width * 0.4,
                  child: Text(
                    product.productName,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18.5,
                      color: Colors.indigo,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: _screenSize.height * 0.015,
          right: _screenSize.height * 0.015,
          child: InkWell(
            onTap: () {
              product.isFavoritePressed();
              if (product.isFavorite) {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Product Added to Favorite!",
                      style: TextStyle(fontSize: 16),
                    ),
                    backgroundColor: Colors.green,
                    duration: Duration(seconds: 1),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Product Removed from Favorite!",
                      style: TextStyle(fontSize: 16),
                    ),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 1),
                  ),
                );
              }
            },
            child: Icon(
              product.isFavorite ? Icons.favorite : Icons.favorite_border,
              size: 25,
              color: Colors.indigo,
            ),
          ),
        ),
        Positioned(
          bottom: _screenSize.height * 0.032,
          right: _screenSize.height * 0.007,
          child: Container(
            height: _screenSize.height * 0.052,
            width: _screenSize.width * 0.11,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
            ),
            child: InkWell(
              onTap: () {
                cart.addToCart(product.id, product.productName, product.price,
                    product.imageUrl);
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.green,
                    duration: const Duration(seconds: 1),
                    content: const Text(
                      "Added to Cart!",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    action: SnackBarAction(
                      label: "UNDO",
                      textColor: Colors.white,
                      onPressed: () {
                        cart.undoSingleProduct(product.id);
                      },
                    ),
                  ),
                );
              },
              child: const Icon(
                Icons.shopping_cart,
                size: 24,
                color: Colors.indigo,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: _screenSize.height * 0.05,
          left: 20,
          child: Row(
            children: [
              const Text(
                "ETB ",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "${product.price}",
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: _screenSize.height * 0.024,
          left: 20,
          child: Row(
            children: [
              Text(
                "ETB ",
                style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
              ),
              Text(
                "${product.oldPrice}",
                style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    fontSize: 13.5,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade600),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
