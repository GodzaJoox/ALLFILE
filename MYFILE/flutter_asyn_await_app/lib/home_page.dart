import 'package:flutter/material.dart';
import 'package:flutter_asyn_await_app/page2.dart';

class HomePage extends StatelessWidget {
  

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text("Navigation"),
      centerTitle: true,
      backgroundColor: Colors.green,
      foregroundColor: const Color.fromARGB(255, 255, 255, 255),
    ),
    body: Center(
      child: Column(
        children: [
          const SizedBox(height: 30),
          const Text("HomePage"),
          const SizedBox(height: 80),
          btnPage2(context),
          const SizedBox(height: 20),
          btnPage3(context)
        ],
      ),
    ),
  );
  Widget btnPage2(BuildContext context) => TextButton(
    onPressed: () async{
      var value = await Navigator.pushNamed     (
        context,
      '/page2',
      arguments: 456);
      myAlert(context, "ค่าที่ส่งกลับมาคือ $value");
    }, 
    child: const Text("Go to Page2"));

    Widget btnPage3(BuildContext context) => TextButton(
    onPressed: () async{
      var value = await Navigator.pushNamed(
        context,
      '/page3',
      arguments: {"num":"555",'text':'hahaha','boolean':false}) ?? 0;
      myAlert(context, "ค่าที่ส่งกลับมาคือ $value");
    }, 
    child: const Text("Go to Page3"));

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