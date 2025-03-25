import 'package:flutter/material.dart';
import 'package:flutter_buttom_navi_app/memberlogin.dart';

class Member extends StatelessWidget {
  const Member({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Member")),
      body: Center(
      child: Column(
          children: [
            const SizedBox(height: 30,),
            const Text("Member Page"),
            const SizedBox(height: 60,),
            btnLogin(context)
        ],
      ))
    );
  }
  Widget btnLogin(BuildContext context){
    return TextButton(
      onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context) => const Memberlogin())), 
      child: const Text("Member Login >> "));
  }
}