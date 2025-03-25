import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_pushpop/homepage.dart';
import 'package:flutter_pushpop/page3.dart';

// ignore: must_be_immutable
class Page2 extends StatelessWidget {
  int id;
  var rnd = Random();

  Page2({super.key,required this.id});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text("Page2"),
      centerTitle: true,
      backgroundColor: Colors.green,
      foregroundColor: const Color.fromARGB(255, 255, 255, 255),
    ),
    body: Center(
      child: Column(
        children: [
          const SizedBox(height: 30),
          Text("P A G E 2\nPage id: $id"),
          const SizedBox(height: 80),
          btnPage3(context),
          const SizedBox(height: 20),
          back(context)
        ],
      ),
    ),
  );
  Widget btnPage3(BuildContext context) => TextButton(
  onPressed: () => Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  Page3(num: 20, text: "GodzaJoox", boolean: true))
    ).then((value) => myAlert(context,"ข้อมูลที่ส่งกลับคือ : $value")),
  child: const Text("Go To Page3 >>")
  );


  Widget back(BuildContext context) => TextButton(
  onPressed: () => Navigator.pop(
    context,[456,'456']
    ),
    child: const Text("<< Back"));

  void myAlert (BuildContext context,String message){
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        actions: [
          TextButton(
            onPressed: ()=>Navigator.of(context).pop(), 
            child: const Text("OK"))
        ],
        content: Text(message),
    ));
  } 

  
}