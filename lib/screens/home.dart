import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/widgets/my_drawer.dart';

import '../provider/cart_provider.dart';
import '../provider/product_provider.dart';
import '../widgets/product_item.dart';
import '../routes/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    var productProvider = Provider.of<ProductProvider>(context);
    var product = productProvider.items;
    var cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Zulu Shop",
          style: TextStyle(fontSize: 22),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 4, right: 8.0),
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
        ],
      ),
      drawer: const MyDrawer(),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        physics: const BouncingScrollPhysics(),
        itemCount: product.length,
        itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
          value: product[index],
          child: const ProductItems(),
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: _screenSize.width / (_screenSize.height / 1.4),
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
        ),
      ),
    );
  }
}
