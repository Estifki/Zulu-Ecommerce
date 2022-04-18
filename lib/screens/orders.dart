import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/widgets/order_item.dart';

import '../provider/order_provider.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var order = Provider.of<OrderProvider>(context);
    return Scaffold(
      appBar: AppBar(
       
        title: const Text(
          "Orders Summary",
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: order.orderItem.isEmpty
          ? const Center(
              child: Text(
                "Nothing Ordered Yet!",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.indigo,
                    fontWeight: FontWeight.w500),
              ),
            )
          : ListView.builder(
              itemCount: order.orderItem.length,
              itemBuilder: (context, index) {
                return OrderItem(order: order.orderItem[index]);
              }),
    );
  }
}
