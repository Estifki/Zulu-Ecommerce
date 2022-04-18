import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/orders.dart';
import 'screens/user_products/add_products.dart';
import './screens/user_products/user_products.dart';
import './provider/order_provider.dart';
import './widgets/navigator.dart';
import './provider/cart_provider.dart';
import './screens/cart.dart';
import './screens/product_details/product_details.dart';
import './provider/product_provider.dart';
import './routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => OrderProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Zulu Shop',
        theme: ThemeData(
            primarySwatch: Colors.indigo,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        home: const NavigatorWidget(),
        routes: {
          Routes.productDetails: (context) => const ProductDetails(),
          Routes.cartScreen: (context) => const CartScreen(),
          Routes.orderScreen: (context) => const OrderScreen(),
          Routes.userProduct: (context) =>const UserProductsScreen(),
          Routes.addUserProduct: (context)=> const AddUserProduct(),
        },
      ),
    );
  }
}
