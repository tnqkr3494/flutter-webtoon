import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void flutterToast() {
    Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
        body: Builder(builder: (ctx) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(ctx).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "SnackBar",
                          textAlign: TextAlign.center,
                        ),
                        backgroundColor: Colors.teal,
                        duration: Duration(seconds: 1),
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 40,
                    ),
                    backgroundColor: Colors.pink.withOpacity(0.8),
                  ),
                  child: const Text(
                    "SnackBar",
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextButton(
                  onPressed: () {
                    flutterToast();
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 40,
                    ),
                    backgroundColor: Colors.blue.withOpacity(0.8),
                  ),
                  child: const Text(
                    "Toast",
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
