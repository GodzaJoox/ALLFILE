import 'package:flutter/material.dart';
import 'package:flutter_pushpop/page2.dart';
import 'package:flutter_pushpop/page3.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

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
  onPressed: () => Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Page2(id: 662,))
    ).then((value){
      var val = value ?? [0,"zero"];
      var v1 = val[0];
      var v2 = val[1];
      myAlert(context,'ข้อมูลที่ส่งกลับ \n $v1,$v2');
    }),
  child: const Text("Go To Page2 >>")
  );


  Widget btnPage3(BuildContext context) => TextButton(
  onPressed: () => Navigator.push(
    context,MaterialPageRoute(builder: (context) => Page3(
      num: 20, 
      text: "GodzaJoox", 
      boolean: true))
    ).then((value) => myAlert(context,"ข้อมูลที่ส่งกลับคือ : $value")),
  child: const Text("Go To Page3 >>"));

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

