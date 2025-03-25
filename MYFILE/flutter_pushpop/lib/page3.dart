import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_pushpop/homepage.dart';
import 'package:flutter_pushpop/page2.dart';

// ignore: must_be_immutable
class Page3 extends StatelessWidget {
  int num;
  String text;
  bool boolean;
  var rnd = Random();
  
  Page3({super.key,required this.num,required this.text,required this.boolean});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text("Page3"),
      centerTitle: true,
      backgroundColor: Colors.green,
      foregroundColor: const Color.fromARGB(255, 255, 255, 255),
    ),
    body: Center(
      child: Column(
        children: [
          const SizedBox(height: 30),
          Text("P a g e 3 $num\n$text\n$boolean"),
          const SizedBox(height: 80),
          //btnHome(context),
          const SizedBox(height: 20),
          back(context)
        ],
      ),
    ),
  );

  /*Widget btnHome(BuildContext context) => TextButton(
  onPressed: () => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => const Homepage()),
    (Route<dynamic> route) => false, // ลบทุก Route ออกจาก Stack
    ), 
    
  child: const Text("<< HomePage"));

  Widget back(BuildContext context) => TextButton(
  onPressed: () => Navigator.pop(
    context,MaterialPageRoute(builder: (context) => Page2(id: 662,))
    ), 
  child: const Text("<< Back")); */

  Widget back(BuildContext context) => TextButton(
    onPressed: () => Navigator.pop(context,rnd.nextInt(100)),
    child: const Text("<< Back")
    );
}