import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:toonflix/screens/chat_screen.dart';
import 'package:toonflix/screens/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // 만약 인증 토큰이 존재하면 -> 채팅 스크린
          if (snapshot.hasData) {
            return const ChatScreen();
          }
          // 만약 인증 토큰이 없으면(로그인 실패 or 로그아웃) -> 로그인/회원가입 페이지
          else {
            return const MainScreen();
          }
        },
      ),
    );
  }
}
