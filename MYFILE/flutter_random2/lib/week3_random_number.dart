import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(RandomNumberApp());

class RandomNumberApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Number Game',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: RandomGamePage(),
    );
  }
}

class RandomGamePage extends StatefulWidget {
  @override
  _RandomGamePageState createState() => _RandomGamePageState();
}

class _RandomGamePageState extends State<RandomGamePage> {
  final TextEditingController _controller = TextEditingController();
  String _message = "กรุณาเดาตัวเลขระหว่าง 1-100";
  int _randomNumber = Random().nextInt(100) + 1;

  void _checkAnswer() {
    final input = int.tryParse(_controller.text);
    if (input == null || input < 1 || input > 100) {
      setState(() {
        _message = "กรุณาใส่ตัวเลขที่ถูกต้อง (1-100)";
      });
      return;
    }
    if (input < _randomNumber) {
      setState(() {
        _message = "น้อยไป!";
      });
    } else if (input > _randomNumber) {
      setState(() {
        _message = "มากไป!";
      });
    } else {
      setState(() {
        _message = "ถูกต้อง!";
      });
    }
  }

  void _resetGame() {
    setState(() {
      _randomNumber = Random().nextInt(100) + 1;
      _controller.clear();
      _message = "กรุณาเดาตัวเลขระหว่าง 1-100";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('เกมเดาตัวเลข'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _message,
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: "กรอกตัวเลข",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _checkAnswer,
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  child: const Text('ส่งคำตอบ'),
                ),
                ElevatedButton(
                  onPressed: _resetGame,
                  style: ElevatedButton.styleFrom(primary: Colors.blue),
                  child: const Text('เริ่มใหม่'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
