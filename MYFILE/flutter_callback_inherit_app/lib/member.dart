import 'package:flutter/material.dart';

class MemberPage extends StatefulWidget {
  final updateStatus;
  final getIsLocked;
  const MemberPage({super.key,required this.updateStatus,required this.getIsLocked});

  @override
  State<MemberPage> createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Member Page"),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 60,),
            btnLoginLogout(context),
            const SizedBox(height: 30,),
            btnBack(context),
          ],
        ),
      ),
    );
  }
  Widget btnLoginLogout(BuildContext context){
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.green)
      ),
      onPressed: (){
        //เมื่อคลิกปุ่ม ให้สลับบสถานะการเข้าระบบจาก true-> false,false->true
        widget.updateStatus(!widget.getIsLocked());
        setState(() {
          widget.getIsLocked();
        });
      }, 
      child: Text((!widget.getIsLocked()?'เข้าสู่ระบบ':'ออกจากระบบ')));
  }
  Widget btnBack(BuildContext context){
      return TextButton(
        onPressed: () => Navigator.pop(context), 
        child: const Text("<กลับ"));
  }
}