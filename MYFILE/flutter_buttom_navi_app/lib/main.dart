import 'package:flutter/material.dart';
import 'package:flutter_buttom_navi_app/help.dart';
import 'package:flutter_buttom_navi_app/home.dart';
import 'package:flutter_buttom_navi_app/member.dart';
import 'package:flutter_buttom_navi_app/product.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainPage()
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _naviItemIndex = 0; //ลำดับที่ของปุ่มที่เลือก

  var pages = <Widget> [const HomePage(),const Product(),const Member(),const Help()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Buttom Navigation bar"),centerTitle: true,),
      body: pages[_naviItemIndex],
      bottomNavigationBar: BottomNavigationBar(
        //type: BottomNavigationBarType.fixed,
        //backgroundColor: Colors.grey, //สีพื้นหลัง
        //fixedColor: Colors.red, //สีปุ่มที่ถูกเลือก

        type: BottomNavigationBarType.shifting,
        selectedItemColor: const Color.fromARGB(255, 255, 0, 0),
        unselectedItemColor: Colors.white,

        showSelectedLabels: true, //แสดงข้อความปุ่มที่ถูกเลือก
        showUnselectedLabels: true, //แสดงข้อคววามบนปุ่มที่ไม่ถูกเลือก
        currentIndex: _naviItemIndex,
        items: btnNavItem(),
        onTap:(index){ //เมื่อมีการคลิกที่ปุ่ม naviItemIndex index ก็จะเปลื่ยนไป จาก 0 กลายเป็นตัวที่เราเลือก เช่นเลือก index ที่ 3 (ปุ่มคน) index ก็จะกลายเป็น
          setState(() {
            _naviItemIndex = index;
          });
        }
        ),
    );
  }
  List<BottomNavigationBarItem> btnNavItem(){
    var iconItem = [Icons.home,Icons.shopping_cart,Icons.person_2_rounded,Icons.help_center];
    var labelItem = ["Home","Shop","Info","Help"];
    var bgColorItem = [Colors.black,Colors.blue,Colors.lightGreen,Colors.red];

    List<BottomNavigationBarItem> mybtn;

    BottomNavigationBarItem createItem(index){
      return BottomNavigationBarItem(
      icon: Icon(iconItem[index]),
      label: labelItem[index],
      backgroundColor: bgColorItem[index]
      );
    }
    mybtn = List.generate(iconItem.length,createItem);
    return mybtn;
  }
}