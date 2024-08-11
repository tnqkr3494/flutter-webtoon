import 'package:flutter/material.dart';
import 'package:toonflix/screens/first_screen.dart';
import 'package:toonflix/screens/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => const Home(),
        "/first": (context) => const FirstScreen(),
      },
    );
  }
}

class RoutingButton extends StatelessWidget {
  const RoutingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, "/first");
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.pink.withOpacity(0.5),
            ),
            child: const Text(
              "Go to another page",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
