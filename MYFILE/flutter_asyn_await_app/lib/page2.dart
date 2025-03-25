import 'dart:math';

import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    // รับ arguments จากหน้าก่อนหน้า
    var args = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
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
            Text("P A G E 2\nNum: $args"),
            const SizedBox(height: 20),
            if (args != null) Text("Arguments: $args"), // แสดงข้อมูล arguments ถ้ามี
            const SizedBox(height: 80),
            btnPage3(context),
            const SizedBox(height: 20),
            btnBack(context),
          ],
        ),
      ),
    );
  }

  Widget btnPage3(BuildContext context) => TextButton(
        onPressed: () async {
          var values = await Navigator.pushNamed(
            context,
            '/page3',
            arguments: {'num': 456, 'text': 'one M', 'boolean': true},
          );

          if (context.mounted) { // ตรวจสอบ context ก่อนใช้งาน
            myAlert(context, "ข้อมูลที่ส่งกลับมาคือ $values");
          }
        },
        child: const Text("Go to Page3"),
      );

  Widget btnBack(BuildContext context) => TextButton(
        onPressed: () => Navigator.pop(context, Random().nextInt(100)),
        child: const Text("<< Back"),
      );

  void myAlert(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("OK"),
          )
        ],
        content: Text(message),
      ),
    );
  }
}
