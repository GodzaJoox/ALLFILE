import 'package:flutter/material.dart';
import 'package:flutter_student_list/student.dart';
import 'package:flutter_student_list/student_screen.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _formKey = GlobalKey<FormState>();
  String _id = "", _name = "";
  int _score = 0;
  String? _gender;
  

  final List<String> titleList = ['นาย','นางสาว'];

  @override
  Widget build(BuildContext context) {
    Student.addStudentItems = (value){
    setState(() {
      Student.studentItems.add(value);
      //Student.countItems = Student.studentItems.length;
    });
  };
    return Scaffold(
      appBar: AppBar(
        title: const Text("กรอกข้อมูลที่ต้องการเพิ่ม"),
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 0),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const Text("เพิ่มรายชื่อนักศึกษา",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 30,
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      maxLength: 13,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(color: Colors.green),
                      decoration: const InputDecoration(
                        label: Text(
                          "รหัสนักศึกษา",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "กรุณาป้อนรหัส";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _id = value.toString();
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DropdownButtonFormField(
                      value: _gender,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        label: Text("คำนำหน้า",style: TextStyle(fontSize: 16),)
                      ),
                      items: titleList.map((item){
                        return DropdownMenuItem(
                          value: item,
                          child: Text(item,style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),));
                      }).toList(), 
                      onChanged: (value){
                        setState(() {
                          _gender = value!;
                        });
                      },
                      validator: (value){
                        if(value == null){
                          return "กรุณาเลือกคำนำหน้า";
                        }
                        return null;
                      },
                      ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      maxLength: 20,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        label:Text('ชื่อ',style: TextStyle(fontSize: 16),),
                      ),
                      validator: (value) {
                        return (value==null || value.isEmpty)?'กรุณากรอกชื่อ':null;
                      },
                      onSaved: (value) {
                        _name = value!;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        label:Text('คะแนน',style: TextStyle(fontSize: 16),),
                      ),
                      validator: (value) {
                        return (value==null || value.isEmpty)?'กรุณากรอกคะแนน':null;
                      },
                      onSaved: (value) {
                        _score = int.parse(value.toString());
                      },
                    ),
                    const SizedBox(height: 10,),
                    FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.blue
                      ),
                      onPressed: (){
                          if (_formKey.currentState!.validate()){
                            _formKey.currentState!.save();
                            var newStd = {'id':_id, 'name':_gender!+_name,'score':_score};
                            setState(() {
                              Student.addStudentItems(newStd);
                              Student.countItems = Student.studentItems.length;
                            });
                            _formKey.currentState!.reset();
                            Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => const StudentScreen())
                            );
                          }
                      },
                      child: const Text("บันทึก",style: TextStyle(fontSize: 16),)),
                    
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
