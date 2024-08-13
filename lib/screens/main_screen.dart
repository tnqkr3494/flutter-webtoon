import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[100],
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  RichText(
                    text: const TextSpan(
                        text: "Welcome",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                        children: [
                          TextSpan(
                            text: " to my chatting app",
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          )
                        ]),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Signup to continue",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 180,
            child: Container(
              height: 280,
              width: MediaQuery.of(context).size.width - 40,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isLogin = true;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "LOGIN",
                                style: TextStyle(
                                  color: isLogin ? Colors.black : Colors.grey,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Container(
                                color: Colors.amber,
                                height: 2,
                                width: 55,
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isLogin = false;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "SIGNUP",
                                style: TextStyle(
                                  color: !isLogin ? Colors.black : Colors.grey,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Container(
                                color: Colors.amber,
                                height: 2,
                                width: 55,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: Form(
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.account_circle),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
