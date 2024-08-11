import 'package:flutter/material.dart';
import 'package:toonflix/main.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text("Appbar"),
          actions: const [
            Icon(Icons.shopping_cart),
            Icon(Icons.search),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: const CircleAvatar(
                  backgroundImage: AssetImage("assets/kang.png"),
                ),
                accountName: const Text("InGwonKang"),
                accountEmail: const Text("tnqkr3494@naver.com"),
                onDetailsPressed: () {},
                decoration: BoxDecoration(
                  color: Colors.pink.withOpacity(0.5),
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text("Home"),
                trailing: const Icon(Icons.add),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text("Home"),
                trailing: const Icon(Icons.add),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text("Home"),
                trailing: const Icon(Icons.add),
                onTap: () {},
              )
            ],
          ),
        ),
        body: const RoutingButton());
  }
}
