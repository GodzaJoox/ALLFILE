import 'package:flutter/material.dart';
import 'package:flutter_buttom_navi_app/product_detail.dart';

class Product extends StatelessWidget {
  const Product({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Product")),
      body: Center(
      child: Column(
          children: [
            const SizedBox(height: 30,),
            const Text("Product Page"),
            const SizedBox(height: 60,),
            btnDetail(context)
        ],
      ))
    );
  }
  Widget btnDetail(BuildContext context){
    return TextButton(
      onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context) => const ProductDetail())), 
      child: const Text("Product Detail >> "));
  }
}