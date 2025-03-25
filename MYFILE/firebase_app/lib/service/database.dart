import 'package:cloud_firestore/cloud_firestore.dart';

class Database{
  static Database instance = Database._();

  Database._(); //สร้าง constuture แบบ private

  Future<List> getAllData() async{
    //กำหนดตัวแปรอ้างอิงไปยังข้อมูล
    final reference = FirebaseFirestore.instance.collection('product');
    //กำหนดการคิวรีข้อมูลตาม id ผ่านตัวแปรอ้างอิง
    Query query = reference.orderBy('id');
    //ขอเอกสารที่อยู่ในเงื่อนไขในรูปแบบของ snapshot
    final snapshots = query.snapshots();

    return snapshots.map(
      (snapshots){
        return snapshots.docs.map(
          (doc){
            if(doc.exists){
              return doc.data();
            }
          }
        );
      }
    ).toList();
  }
}