import 'dart:math';

import 'package:flutter/material.dart';

class Week3RandomPage extends StatefulWidget {
  const Week3RandomPage({super.key});

  @override
  State<Week3RandomPage> createState() => _Week3RandomPageState();
}

class _Week3RandomPageState extends State<Week3RandomPage> {
  String _str = 'กรุณาเดาตัวเลขระหว่าง 1 - 100';
  final TextEditingController _ctr = TextEditingController();
  int _randomNum = Random().nextInt(100) + 1;

  void _check() {
    final input = int.tryParse(_ctr.text);
    if (input == null || input < 1 || input > 100) {
      setState(() {
        _str = 'กรุณาใส่ตัวเลขที่ถูกต้อง (1-100)';
      });
      return;
    }
    if (input < _randomNum) {
      setState(() {
        _str = 'น้อยไป!!!';
      });
    } else if (input > _randomNum) {
      setState(() {
        _str = 'มากไป!!!';
      });
    } else {
      setState(() {
        _str = 'ถูกต้องนะครับบ!!!';
      });
    }
  }

  void _reset() {
    setState(() {
      _randomNum = Random().nextInt(100) + 1;
      _ctr.clear();
      _str = 'กรุณาเดาตัวเลขระหว่าง 1 - 100';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('เกมทายตัวเลข'),
      ),
      body: Center(
          child: Column(
        children: [
          const SizedBox(height: 15),
          Text(
            _str,
            style: const TextStyle(fontSize: 25),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
           child: TextField(
            controller: _ctr,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: 'กรอกตัวเลข' , 
              border: OutlineInputBorder(),
            ),
          )
        ),
         const SizedBox(height: 20),
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: _check,style: ElevatedButton.styleFrom(backgroundColor: Colors.blue), 
            child: const Text('ส่งคำตอบ'),
            ),
            ElevatedButton(onPressed: _reset,style: ElevatedButton.styleFrom(backgroundColor: Colors.red), child: 
            const Text('เริ่มใหม่'),
            )
          ],
         )
        ],
        
      )),
    );
  }
}
