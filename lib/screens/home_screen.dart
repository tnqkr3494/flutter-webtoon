import 'package:flutter/material.dart';
import 'package:toonflix/widgets/UserDrawer.dart';

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
        title: const Text("Log In"),
        actions: const [
          Icon(Icons.shopping_cart),
          Icon(Icons.search),
        ],
      ),
      drawer: const UserDrawer(),
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          const Center(
            child: Image(
              width: 120,
              height: 150,
              image: AssetImage("assets/kang.png"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Form(
              child: Theme(
                  data: ThemeData(
                    inputDecorationTheme: InputDecorationTheme(
                        labelStyle: TextStyle(
                          color: Colors.pink.withOpacity(0.5),
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.pink.withOpacity(0.5),
                        ))),
                  ),
                  child: const Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(labelText: "Enter Id"),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      TextField(
                        decoration:
                            InputDecoration(labelText: "Enter Password"),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                      )
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
