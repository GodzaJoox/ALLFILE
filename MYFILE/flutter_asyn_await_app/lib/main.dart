import 'package:flutter/material.dart';
import 'package:flutter_asyn_await_app/home_page.dart';
import 'package:flutter_asyn_await_app/page2.dart';
import 'package:flutter_asyn_await_app/page3.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/':(context) => const HomePage(),
        '/Page2':(context) => const Page2(),
        '/page3':(context) => const Page3()
      }
    );
  }
}
