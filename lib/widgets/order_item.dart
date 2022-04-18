import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../models/order.dart';

// ignore: must_be_immutable
class OrderItem extends StatefulWidget {
  Order order;
  OrderItem({Key? key, required this.order}) : super(key: key);

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: Card(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8.0),
                child: ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 15),
                    child: Text(
                      "ETB ${widget.order.totalAmount.toStringAsFixed(2)}",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 3),
                    child: Text(
                      DateFormat.yMEd().add_jms().format(widget.order.dateTime),
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ),
                  trailing: Icon(
                      _isExpanded ? Icons.expand_less : Icons.expand_more,
                      color: Colors.indigo,
                      size: 28),
                ),
              ),
              if (_isExpanded)
                Padding(
                  padding: const EdgeInsets.only(left: 22.0, top: 5, bottom: 5),
                  child: Column(
                    children: widget.order.orderItems.map((singleProduct) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            singleProduct.productName,
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0, bottom: 4),
                            child: SizedBox(
                              width: 85,
                              child: Text(
                                "${singleProduct.quantity} x ${singleProduct.price}",
                                style: const TextStyle(
                                  fontSize: 14.5,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
            ]),
      ),
    );
  }
}
