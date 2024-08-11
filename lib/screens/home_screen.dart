import 'package:flutter/material.dart';
import 'package:toonflix/screens/dice_screen.dart';
import 'package:toonflix/widgets/UserDrawer.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.pink.withOpacity(0.5),
        centerTitle: true,
        title: const Text(
          "Log In",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: const [
          Icon(Icons.shopping_cart),
          Icon(Icons.search),
        ],
      ),
      drawer: const UserDrawer(),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              const Center(
                child: Image(
                  width: 120,
                  height: 150,
                  image: AssetImage("assets/kang.png"),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Form(
                  child: Theme(
                    data: ThemeData(
                      inputDecorationTheme: InputDecorationTheme(
                          labelStyle: const TextStyle(
                            color: Colors.pink,
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.pink.withOpacity(0.5),
                          ))),
                    ),
                    child: Column(
                      children: [
                        const TextField(
                          decoration: InputDecoration(labelText: "Enter Id"),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const TextField(
                          decoration:
                              InputDecoration(labelText: "Enter Password"),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 40),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const DiceScreen(),
                                ));
                          },
                          child: const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
