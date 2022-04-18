import 'package:flutter/material.dart';

class UserProductsItem extends StatelessWidget {
  String productName;
  double price;
  String imgUrl;

  UserProductsItem(
      {required this.productName, required this.price, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return ListTile(
      leading: SizedBox(
        width: _screenSize.width * 0.15,
        child: Image.asset(
          imgUrl,
          fit: BoxFit.contain,
        ),
      ),
      title: Text(
        productName,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      subtitle: Text(price.toString()),
      trailing: SizedBox(
        width: _screenSize.width * 0.25,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.edit, color: Colors.indigo),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
