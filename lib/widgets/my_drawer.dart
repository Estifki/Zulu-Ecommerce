import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/routes/routes.dart';

import 'navigator.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: const Text(
              "Zulu Shop",
              style: TextStyle(fontSize: 22),
            ),
          ),
          const Divider(),
          InkWell(
            onTap: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const NavigatorWidget(),
              ),
            ),
            child: const ListTile(
              leading: Icon(
                Icons.sell,
                color: Colors.indigo,
              ),
              title: Text(
                "Shop",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const Divider(),
          InkWell(
            onTap: () =>
                Navigator.of(context).pushReplacementNamed(Routes.userProduct),
            child: const ListTile(
              leading: Icon(
                Icons.work,
                color: Colors.indigo,
              ),
              title: Text(
                "My Products",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
