import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    // รับ arguments จากหน้าก่อนหน้า
    var args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    var v1 = args['num'];
    var v2 = args['text'];
    var v3 = args['boolean'];

    return Scaffold(
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
            Text("P a g e 3\nNum: $v1\nText: $v2\nBoolean: $v3"),
            const SizedBox(height: 20),
            
            btnBack(context), // ปุ่มย้อนกลับ
          ],
        ),
      ),
    );
  }

  Widget btnBack(BuildContext context) => TextButton(
        onPressed: () => Navigator.pop(context, [123, "123"]),
        child: const Text("<< Back"),
      );
}
