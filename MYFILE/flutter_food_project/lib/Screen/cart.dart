import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CartScreen extends StatefulWidget {
  final List<Map<String, dynamic>> cart;

  const CartScreen({super.key, required this.cart});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late List<Map<String, dynamic>> cartItems;

  @override
  void initState() {
    super.initState();
    cartItems = widget.cart.map((item) {
      var modifiableItem = Map<String, dynamic>.from(item);
      if (modifiableItem["quantity"] == null) {
        modifiableItem["quantity"] = 1; // ถ้า quantity เป็น null ตั้งค่าให้เริ่มต้นที่ 1
      }
      return modifiableItem;
    }).toList();
  }

  void increaseQuantity(int index) {
    setState(() {
      cartItems[index]["quantity"] = (cartItems[index]["quantity"] ?? 1) + 1;
    });
  }

  void decreaseQuantity(int index) {
    setState(() {
      if (cartItems[index]["quantity"] > 1) {
        cartItems[index]["quantity"] = cartItems[index]["quantity"] - 1;
      }
    });
  }

  void removeItem(int index) {
    setState(() {
      cartItems.removeAt(index); // ลบสินค้าออกจากตะกร้า
    });
  }

  Future<void> placeOrder() async {
    try {
      // สร้าง Collection 'orders' ใน Firestore
      CollectionReference orders = FirebaseFirestore.instance.collection('orders');

      // สร้าง orderId ด้วย Firebase Firestore (ID อัตโนมัติ)
      DocumentReference orderRef = orders.doc();  // หรือสามารถใช้ UUID ได้ถ้าต้องการ

      List<Map<String, dynamic>> orderDetails = cartItems.map((item) {
        return {
          'name': "Pizza ${item["name"]}",
          'image': item["image"],
          'price': item["discountPrice"],
          'quantity': item["quantity"] ?? 1,
          'email' : item["email"]
        };
      }).toList();

      // ใช้เวลาในโซนเวลาประเทศไทย (GMT+7)
      DateTime thailandTime = DateTime.now().toUtc().add(const Duration(hours: 7));

      // แปลงเวลาประเทศไทยเป็นรูปแบบที่ต้องการ
      String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(thailandTime);

      // เพิ่มข้อมูลใน Firestore
      await orderRef.set({
        'orderId': orderRef.id,  // เก็บ OrderId (ใช้ doc ID เป็น OrderId)
        'orderDate': formattedDate,  // เก็บเวลาในรูปแบบเวลาประเทศไทย
        'items': orderDetails,
      });

      // ล้างตะกร้าหลังการสั่งซื้อ
      setState(() {
        cartItems.clear();
      });

      // แสดงข้อความว่า สั่งซื้อสำเร็จ
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('สั่งซื้อสำเร็จ'),
        backgroundColor: Colors.green,
      ));

      // ส่งข้อมูลตะกร้าที่อัปเดตกลับไปที่หน้าหลัก
      Navigator.pop(context, cartItems);
    } catch (e) {
      // ถ้ามีข้อผิดพลาด แสดงข้อความ
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('เกิดข้อผิดพลาด: $e'),
        backgroundColor: Colors.red,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ตะกร้าสินค้า"),
      ),
      body: cartItems.isEmpty
          ? const Center(child: Text("ตะกร้าของคุณว่างเปล่า"))
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.asset(cartItems[index]["image"]!),
                  title: Text(cartItems[index]["name"]),
                  subtitle: Text(
                    "Price: ${cartItems[index]["discountPrice"]} Bath",
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () => decreaseQuantity(index),
                      ),
                      Text(cartItems[index]["quantity"].toString()),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () => increaseQuantity(index),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => removeItem(index),
                      ),
                    ],
                  ),
                );
              },
            ),
      bottomSheet: cartItems.isEmpty
          ? const SizedBox.shrink()
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: placeOrder,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text(
                  'สั่งซื้อ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
    );
  }
}
