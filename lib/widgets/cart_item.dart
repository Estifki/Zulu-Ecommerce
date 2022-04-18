import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/cart_provider.dart';

// ignore: must_be_immutable
class CartItem extends StatelessWidget {
  String productid;
  String productName;
  double price;
  String imgUrl;
  int quantity;
  CartItem({
    Key? key,
    required this.productid,
    required this.productName,
    required this.price,
    required this.imgUrl,
    required this.quantity,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartProvider>(context);
    return Dismissible(
      key: ValueKey(productid),
      direction: DismissDirection.endToStart,
      background: Container(
        padding: const EdgeInsets.only(right: 8),
        color: Colors.red,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 30,
        ),
        alignment: Alignment.centerRight,
      ),
      onDismissed: (_)=> cart.removeProduct(productid),
      confirmDismiss: (_) {
        return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: const Text("Are You Sure?"),
                  content:
                      const Text("You want to remove this product from cart"),
                  actions: [
                    TextButton(
                      child: const Text("No"),
                      onPressed: () {
                        return Navigator.of(ctx).pop(false);
                      },
                    ),
                    TextButton(
                      child: const Text("Yes"),
                      onPressed: () {
                        return Navigator.of(ctx).pop(true);
                      },
                    )
                  ],
                ));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
            margin: const EdgeInsets.all(0),
            child: ListTile(
              visualDensity: VisualDensity.adaptivePlatformDensity,
              leading: Container(
                width: 60,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imgUrl),
                  ),
                ),
              ),
              title: Text(
                productName,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Text(
                "Total: ${(price * quantity).toStringAsFixed(2)}",
                style: const TextStyle(color: Colors.indigo),
              ),
              trailing: Container(
                width: 80,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 20,
                      child: IconButton(
                        splashColor: Colors.transparent,
                        padding: const EdgeInsets.all(0),
                        onPressed: () {
                          cart.addQuantity(productid);
                        },
                        icon: const Icon(Icons.add, size: 20),
                      ),
                    ),
                    Text(
                      quantity.toString(),
                      style: const TextStyle(
                          color: Colors.indigo,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 20,
                      child: IconButton(
                        splashColor: Colors.transparent,
                        padding: const EdgeInsets.all(0),
                        onPressed: () {
                          cart.removeQuantity(productid);
                        },
                        icon: const Icon(Icons.remove, size: 20),
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
