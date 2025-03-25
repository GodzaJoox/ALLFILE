import 'package:flutter/material.dart';
import 'package:flutter_callback_inherit_app/member.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLocked = true;
  var _icon = Icons.lock;
  var _text = 'กรุณาเข้าสู่ระบบ';
  //callback function
  bool getIsLocked() => _isLocked;
  //callback function
  void updateStatus(value){
    setState(() {
      if(!value){
        _icon = Icons.lock;
        _text = 'กรุณาเข้าสู่ระบบ';
      }
      else{
        _icon = Icons.lock_open;
        _text = 'ท่านได้เข้าระบบแล้ว';
      }
      _isLocked = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home page"),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 30,),
            Icon(_icon,size: 64,),
            Text(_text),
            const SizedBox(height: 60,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
              ),
              onPressed: (){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MemberPage(updateStatus: updateStatus, getIsLocked: getIsLocked))
                );
              }, 
              child: const Text("Member")
            )
          ],
        ),
      ),
    );
  }
}
