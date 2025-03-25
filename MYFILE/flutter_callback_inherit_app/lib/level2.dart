import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_callback_inherit_app/level3.dart';

class Level2 extends StatelessWidget {
  final counter;
  final updateCounter;

  const Level2({super.key,
            required this.counter,
            required this.updateCounter});

  @override
  Widget build(BuildContext context) {
    int randomCounter= Random().nextInt(8)+1;
  
    return  SizedBox(
        child: Column(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
              ),
              onPressed: (){
                updateCounter(randomCounter);
              }, 
              child: const Text("Set Yur")
            ),
            const SizedBox(height: 30,),
            Level3(counter: counter, updateCounter: updateCounter)
          ],
        ),
      );
  }
} 