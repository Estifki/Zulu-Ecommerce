import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/cart_provider.dart';
import 'package:shop_app/provider/product_provider.dart';

import '../../routes/routes.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    String productId = ModalRoute.of(context)!.settings.arguments as String;
    var selectedProduct =
        Provider.of<ProductProvider>(context).findById(productId);
    var cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedProduct.productName),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: _screenSize.height * 0.4,
            width: double.infinity,
            child: Image.asset(selectedProduct.imageUrl),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              selectedProduct.productName,
              style: const TextStyle(
                fontSize: 22,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Row(
              children: [
                const Text(
                  "Price: ",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "ETB ${selectedProduct.price}",
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Card(
        color: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(4),
          ),
        ),
        margin: const EdgeInsets.all(0),
        child: SizedBox(
          height: _screenSize.height * 0.09,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 4, left: 8.0),
                child: Stack(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(Routes.cartScreen);
                      },
                      icon: const Icon(
                        Icons.shopping_cart_outlined,
                        size: 28,
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: Badge(
                        badgeContent: Text(
                          '${cart.cartCount}',
                          style: const TextStyle(color: Colors.white),
                        ),
                        badgeColor: Colors.red,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: InkWell(
                  onTap: () => cart.addToCart(
                      selectedProduct.id,
                      selectedProduct.productName,
                      selectedProduct.price,
                      selectedProduct.imageUrl),
                  child: Card(
                    color: Colors.indigo,
                    margin: const EdgeInsets.all(0),
                    child: SizedBox(
                      width: _screenSize.width * 0.4,
                      height: 36,
                      child: const Center(
                        child: Text(
                          "Add To Cart",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
