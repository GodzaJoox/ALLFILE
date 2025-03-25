import 'package:flutter/material.dart';

class Memberlogin extends StatelessWidget {
  const Memberlogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Member Login"),),
      body: const Center(
        child: Column(
          children: [
            SizedBox(height: 30,),
            Text("Member Login Page")
      ],),),
    );
  }
}