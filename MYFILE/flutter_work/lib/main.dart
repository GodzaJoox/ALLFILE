import 'package:flutter/material.dart';
import 'package:flutter_work/friend_detail.dart';
import 'package:flutter_work/list_view.dart';

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
        '/':(context) => const ListViewPage(),
        '/friend_dt':(context) => const FriendDetail()
      },
    );
  }
}
