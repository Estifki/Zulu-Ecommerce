import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/product_provider.dart';
import '../widgets/product_item.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    var productProviderObject = Provider.of<ProductProvider>(context);
    final fav = productProviderObject.selectedFavorite;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Favorite",
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: fav.isEmpty
          ? const Center(
              child: Text(
                "Nothing is Added to Favorite",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.indigo,
                    fontWeight: FontWeight.w500),
              ),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: fav.length,
              itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
                value: fav[index],
                child: const ProductItems(),
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio:
                    _screenSize.width / (_screenSize.height / 1.45),
                mainAxisSpacing: 14,
                crossAxisSpacing: 14,
              ),
            ),
    );
  }
}
